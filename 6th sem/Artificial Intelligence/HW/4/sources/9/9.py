import subprocess as spr

def main():
    name_of_file = '\"' + input('please enter file name: ') + '\"';
    number_of_runs = 10;
    shell_output = spr.check_output('ubcsat -alg novelty+ -inst ' + name_of_file + ' -solve -runs ' + str(number_of_runs) + '>output.txt');
    shell_output = shell_output.decode();
    lines = shell_output.split('\r\n');
    ans = lines[46];
    final_ans = '';
    ans = ans.split(' ');
    for i in range(1, len(ans)):
        if (int(ans[i]) < 0):
            final_ans += '0';
        else:
            final_ans += '1';
    f = open('output.txt', 'w');
    f.write(final_ans);
    f.close();

main();