def convert_data_to_dzn(input_data, dzn_filename='data.dzn', encoding='UTF-8'):
    '''Reformat input_data to a minizinc .dzn file, write to disk'''
    # with open(input_data,'r') as f:
    with open(input_data, 'r') as data_file:
        lines = data_file.read().split('\n')
        
        first_line = lines[0].split()
        node_count = int(first_line[0])
        edge_count = int(first_line[1])

        with open(f'{dzn_filename}', 'w') as f:
            f.write(f"NUM_NODES = {node_count};\n")
            f.write(f"NUM_EDGES = {edge_count};\n")
            f.write(f"edges = [|")
            for line in lines[1:-1]:
                node1, node2 = line.split()
                f.write(f"\n{node1}, {node2}|")
            f.write(']\n')

    return None

convert_data_to_dzn("9816603.txt", "data.dzn")