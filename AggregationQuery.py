def generate_permutations(n):
    """ 
    In: 1
    Out: [['x'], ['a']]
    In: 2
    Out: [
            ['x', 'x'], 
            ['a', 'x'], 
            ['x', 'a'], 
            ['a', 'a']
        ]
    """
    if n < 2:
        return []

    chars = ['a', 'x']
    perms = []

    def backtracking(perm):
        if len(perm) == n:
            perms.append(perm[:])
            return

        for c in chars:
            perm.append(c)
            backtracking(perm)
            perm.pop()

    backtracking([])
    return perms


def gen_perc_groups(names, permutations):
    assert len(names) == len(permutations[0])
    queries = []
    group_code = []
    perc_group = []
    select_group = []
    for perm in permutations:
        for char, name in list(zip(perm, names)):
            if char == 'a':
                group_code.append(char)
                perc_group.append('')
                select_group.append("'All' as " + name)
            elif char == 'x':
                group_code.append(char)
                perc_group.append(name)
                select_group.append(name)
            else:
                raise ValueError('Invalid character in permutation')
        queries.append(
            {'code': group_code[:], 'select': select_group[:], 'partition': perc_group[:]})
        perc_group, select_group, group_code = [], [], []
    return queries


def read_file(file_name):
    with open(file_name, 'r') as f:
        return f.read()
    
def write_file(file_name, text):
    with open(file_name, 'w') as f:
        f.write(text)

# def gen_queries(query_template_str, )

def query_group_to_string(query_group, sep):
    query_group_nonempty = [x for x in query_group if x]
    return '' if len(query_group_nonempty) == 0 else (sep.join(query_group_nonempty) + sep)


def gen_queries(query_template_file, all_dims, query_groups):
    query_template = read_file(query_template_file)
    queries = []
    sep = ', '
    all_dims_str = query_group_to_string(all_dims, sep)
    prefix_str = '-- <Next line is auto-generated>'
    for i, q in enumerate(query_groups):
        select_str = query_group_to_string(q['select'], sep)
        partition_str = query_group_to_string(q['partition'], sep)
        query = f"-- {i + 1}. {select_str}\n\n"
        query += query_template \
            .replace('<all_dims>', f"{prefix_str} All dimensions\n{all_dims_str}") \
            .replace('<select_group>', f"{prefix_str} Select group\n{select_str}") \
            .replace('<partition_group>', f"{prefix_str} Partition group\n{partition_str}")
        queries.append(query)
    return queries


if __name__ == '__main__':
    all_dims = ['story_id', 'model_id', 'query_type', 'status']
    permutations = generate_permutations(len(all_dims))
    query_groups = gen_perc_groups(all_dims, permutations)

    queries = gen_queries(
        r'C:\Users\D070741\Documents\Software Development\Python\Data Science\Fellowship\ColdHotData\query_with_status.sql', all_dims, query_groups)
    stored_proc_query = '\n\nUNION\n'.join(queries) + '\n;'
    write_file(r'C:\Users\D070741\Documents\Software Development\Python\Data Science\Fellowship\ColdHotData\stored_proc_query.sql', stored_proc_query)
