import pyshark
from matplotlib import pyplot as plt
import time
import subprocess
import os
import signal
import colorama

class MyTextFormat:
   PURPLE = '\033[95m'
   CYAN = '\033[96m'
   DARKCYAN = '\033[36m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   BOLD = '\033[1m'
   UNDERLINE = '\033[4m'
   END = '\033[0m'


def main():
    snd_x_axis = []
    snd_y_axis = []
    rcv_x_axis = []
    rcv_y_axis = []
    snd_period = 0
    rcv_period = 0
    receiver_average_bitrate = ''
    ip = '127.0.0.1'
    speed = '5G'
    port = 4040
    interval = 1
    ip = input('Please enter intended ip address of server(e.g. 127.0.0.1):\n')
    speed = input('Please enter intended speed(e.g. 5G):\n')
    port = int(input('Please enter intended port(e.g. 4040):\n'))
    interval = float(input('Please enter intended interval(e.g. 1(minimum 0.1 and max 60 seconds)):\n'))
    command_no = int(input(f'Please enter number of intended client command:\n1: \"‫‪iperf3‬‬ ‫‪-c‬‬ ‫‪{ip}‬‬ ‫‪-b‬‬ {speed}‬‬‬‬ ‫‪-p‬‬ ‫‪{port}‬‬ -i {interval} -J > file.json\"\n2: \"‫‪iperf3‬‬ ‫‪-c‬‬ ‫‪{ip}‬‬ ‫‪-b‬‬ ‫‪{speed}‬‬‬‬ ‫‪-p‬‬ ‫‪{port}‬‬ -i {interval} ‫‪-u‬‬ -J > file.json\"\n'))
    print('')
    iperf_client_command = ''
    if command_no == 1:
        iperf_client_command = f'iperf3 -c {ip} -b {speed} -p {port} -i {interval}'
    elif command_no == 2:
        iperf_client_command = f'iperf3 -c {ip} -b {speed} -p {port} -i {interval} -u'
    else:
        print('Invalid input!')
    server_process = subprocess.Popen(f'iperf3 -s -p {port} -i {interval}', encoding = 'utf-8', stdout = subprocess.PIPE, shell = True)
    client_process = subprocess.Popen(iperf_client_command, encoding = 'utf-8', stdout = subprocess.PIPE, shell = True)

    print('Capturing...')
    capturer = pyshark.LiveCapture(interface = 'lo', display_filter = 'tcp.srcport == 4040 || tcp.dstport == 4040')
    timeout = 10
    start = time.time()
    retransmition_packet_counter = 0
    retransmition_packet_counter_B = 0
    retransmition_packet_counter_C = ''
    all_packets_counter = 0
    received_packet_counter = 0
    dic_of_received_packets = {}

    print('Calculating...')
#Calculating number of recieved packets and Number of retransmited packets
#A
    # capturer.sniff(timeout = timeout)
    # print('Capturing done\n')
    # print('Calculating...')
    # for i in range(len(capturer)):
    #     received_packet_counter += 1
    #     data = f'{capturer[i]}'
    #     if 'retransmission' in data or 'Retransmission' in data:
    #         retransmition_packet_counter += 1
#B
    for pkt in capturer.sniff_continuously():
        all_packets_counter += 1
        if 'retransmission' in pkt or 'Retransmission' in pkt:
            retransmition_packet_counter_B += 1
        current_seq_number = pkt[pkt.transport_layer].seq_raw
        current_src_port = pkt[pkt.transport_layer].srcport
        if time.time() - start > timeout:
            break
        else:
            if int(current_src_port) == port:
                received_packet_counter += 1
            if current_seq_number in dic_of_received_packets:
                dic_of_received_packets[current_seq_number] += 1
                retransmition_packet_counter += 1
            else:
                dic_of_received_packets[current_seq_number] = 1

    iperf_client_details = ''
    iperf_server_details = ''

#Plotting
    print('Plotting...')
    while True:
        client_output = client_process.stdout.readline()
        iperf_client_details += client_output + '\n'
        c_index = 0
        client_bitrate_str = ''
        if client_output.find('bits/sec') != -1:
            c_index = client_output.find('bits/sec') + -3
            while client_output[c_index] != ' ':
                client_bitrate_str = client_output[c_index] + client_bitrate_str
                c_index -= 1
            snd_x_axis.append(snd_period + interval)
            snd_y_axis.append(float(client_bitrate_str))
            snd_period += interval

        if 'sender' in client_output:
            sender_index = client_output.find('bits/sec')
            temp = sender_index - 3
            while client_output[temp] != ' ':
                temp -= 1
            receiver_average_bitrate = client_output[temp + 1:sender_index + len('bits/sec')]
            kemp = sender_index + len('bits/sec') + 1
            is_digit_read = 0
            while True:
                if client_output[kemp] == ' ':
                    kemp += 1
                    continue
                else:
                    break
            hemp = kemp
            while True:
                if client_output[hemp] == ' ':
                    break
                else:
                    hemp += 1
                    continue
            retransmition_packet_counter_C = client_output[kemp: hemp + 1]
        if client_output == '':
            break
    while True:
        server_output = server_process.stdout.readline()
        iperf_server_details += server_output + '\n'
        s_index = 0
        server_bitrate_str = ''
        if server_output.find('bits/sec') != -1:
            s_index = server_output.find('bits/sec') - 3
            while server_output[s_index] != ' ':
                server_bitrate_str = server_output[s_index] + server_bitrate_str
                s_index -= 1
            rcv_x_axis.append(rcv_period + interval)
            rcv_y_axis.append(float(server_bitrate_str))
            rcv_period += interval
        if 'receiver' in server_output:
            break
    
    print('Output of iperf client and server:')
    print(iperf_server_details)
    print('#' * 75)
    print('\n')
    print(iperf_client_details)
    print('')
    print('Results:')
    print('Average Sender Throughput: ' + colorama.Fore.GREEN + MyTextFormat.BOLD + receiver_average_bitrate + MyTextFormat.END + colorama.Fore.RESET)
    print('Number of all packets: ' + colorama.Fore.GREEN + MyTextFormat.BOLD + str(all_packets_counter) + MyTextFormat.END + colorama.Fore.RESET)
    print('Number of recieved packets: ' + colorama.Fore.GREEN + MyTextFormat.BOLD + str(received_packet_counter) + MyTextFormat.END + colorama.Fore.RESET)
    print('Number of retransmitted packets(Calculated by counting packets having same sequence number in Pyshark): ' + colorama.Fore.GREEN + MyTextFormat.BOLD + str(retransmition_packet_counter) + MyTextFormat.END + colorama.Fore.RESET)
    print('Number of retransmitted packets(Calculated by counting packets having \"retransmition\" substring in Pyshark): ' + colorama.Fore.GREEN + MyTextFormat.BOLD + str(retransmition_packet_counter_B) + MyTextFormat.END + colorama.Fore.RESET)
    print('Number of retransmitted packets or jitter(Retransmition/jitter detected in Iperf3): ' + colorama.Fore.GREEN + MyTextFormat.BOLD + retransmition_packet_counter_C + MyTextFormat.END + colorama.Fore.RESET)
    print('')
    plt.plot(snd_x_axis, snd_y_axis, label = 'Sender', color = 'red')
    plt.plot(rcv_x_axis, rcv_y_axis, label = 'Receiver', color = 'blue')
    plt.legend(loc = 'best')
    plt.grid()
    plt.xlabel('Time(sec)')
    plt.ylabel('Bitrate(Gbits/sec)')
    print('Close \'Figure 1\' to continue...' + '(' + colorama.Fore.YELLOW + MyTextFormat.BOLD + 'Attention:' + MyTextFormat.END + colorama.Fore.RESET + ' Do not kill the process!' + ')')
    plt.show()

    os.killpg(os.getpgid(server_process.pid), signal.SIGTERM)
    

main()