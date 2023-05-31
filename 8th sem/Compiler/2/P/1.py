def removeLeftRecursion(input_grammar):
    output_grammar = input_grammar.copy()
    grammar_without_left_recursion = {}
    for lhs in output_grammar.keys():
        alphas = []
        betas = []
        allrhs = output_grammar[lhs]
        for subrhs in allrhs:
            if subrhs[0] == lhs:
                alphas.append(subrhs[1:])
            else:
                betas.append(subrhs)
        if len(alphas) > 0:
            new_lhs = lhs + "'"
            while (new_lhs in output_grammar.keys() or new_lhs in grammar_without_left_recursion.keys()):
                new_lhs += "'"
            for i in range(len(betas)):
               betas[i] += new_lhs
            output_grammar[lhs] = betas
            for i in range(len(alphas)):
               alphas[i] += new_lhs
            alphas.append('')
            grammar_without_left_recursion[new_lhs] = alphas
    for lhs in grammar_without_left_recursion:
        output_grammar[lhs] = grammar_without_left_recursion[lhs]
    output_grammar = dict(sorted(output_grammar.items()))
    return output_grammar


import itertools

def longestCommonPrefix(a):
    size = len(a)
    if (size == 0):
        return ""
    if (size == 1):
        return a[0]
    a.sort()
    end = min(len(a[0]), len(a[size - 1]))
    i = 0
    while (i < end and
           a[0][i] == a[size - 1][i]):
        i += 1
    pre = a[0][0: i]
    return pre


def getLongestPrefixMatch(allrhs):
    prefixes_len = dict()
    prefixes = dict()
    for L in range(2, len(allrhs) + 1):
        for subset in itertools.combinations(allrhs, L):
            prefixes_len[subset] = len(longestCommonPrefix(list(subset)))
            prefixes[subset] = longestCommonPrefix(list(subset))
    if prefixes == {}:
        return 
    return max(prefixes_len, key=prefixes_len.get), prefixes[max(prefixes_len, key=prefixes_len.get)]


def leftFactoring(input_grammar):
    output_grammar = {}
    for lhs in input_grammar.keys():
        if len(input_grammar[lhs]) > 1:
            allrhs = input_grammar[lhs]
            longest_matching_prefix_rhs, longest_matching_prefix = getLongestPrefixMatch(allrhs)
            if (longest_matching_prefix != ''):
                new_lhs = lhs + "'"
                while (new_lhs in output_grammar.keys() or new_lhs in input_grammar.keys()):
                    new_lhs += "'"
                new_rhs = []
                p_new_rhs = []
                length_of_common_prefix = len(longest_matching_prefix)
                for rhs in longest_matching_prefix_rhs:
                    p_new_rhs.append(rhs[length_of_common_prefix:])
                for rhs in allrhs:
                    if (rhs not in longest_matching_prefix_rhs):
                        new_rhs.append(rhs)
                new_rhs.append(longest_matching_prefix + new_lhs)
                output_grammar[lhs] = new_rhs
                output_grammar[new_lhs] = p_new_rhs
                continue
        output_grammar[lhs] = input_grammar[lhs]
    return output_grammar


x1 = {
    'E': ['E+T', 'T'],
    'T': ['T*F', 'F'],
    'F': ['(E)', 'id']
}
y1 = removeLeftRecursion(x1)
z1 = leftFactoring(y1)
print(z1)

x2 = {
    'E': ['EE+', 'EE*', 'id']
}
y2 = removeLeftRecursion(x2)
z2 = leftFactoring(y2)
print(z2)

x3 = {
    'S': ['iEtS', 'iEtSeS', 'a'],
    'E': ['b']
}
y3 = removeLeftRecursion(x3)
z3 = leftFactoring(y3)
print(z3)