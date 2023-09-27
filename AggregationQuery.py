QUERY_DIR = r"C:\Users\D070741\Documents\Software Development\Python\Data Science\Fellowship\ColdHotData\query"
BACKEND_DIR = 'backend'
ACTION_DIR = 'action'
TEMPLATE_FILE = r'C:\Users\D070741\Documents\Software Development\Python\Data Science\Fellowship\ColdHotData\query\template.sql'


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


def generate_percentile_groups(dims, permutations):
    assert len(dims) == len(permutations[0])
    queries = []
    group_code = []
    perc_group = []
    select_group = []
    for perm in permutations:
        for char, dim in list(zip(perm, dims)):
            if dim.permute:
                if char == 'a':
                    group_code.append(char)
                    perc_group.append('')
                    allName = "'All'"
                    if dim.type in ['int', 'integer', 'Integer']:
                        allName = 99
                    select_group.append(f"{allName} as {dim.name}")
                elif char == 'x':
                    group_code.append(char)
                    perc_group.append(dim.name)
                    select_group.append(dim.name)
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


def query_group_to_string(query_group, sep):
    query_group_nonempty = [x for x in query_group if x]
    return '' if len(query_group_nonempty) == 0 else (sep.join(query_group_nonempty) + sep)

def generate_proc_query_str(query_template_file, all_dims, table, query_groups):
    query_template = read_file(query_template_file)
    queries = []
    sep = ', '
    offset = '\t\t\t'
    dim_names = list(map(lambda dim: dim.name, all_dims))
    all_dims_str = query_group_to_string(dim_names, sep)
    prefix_str = '-- <Next line is auto-generated>'

    for i, q in enumerate(query_groups):
        select_str = query_group_to_string(q['select'], sep)
        partition_str = query_group_to_string(q['partition'], sep)
        query = f"-- {i + 1}. {select_str.strip(sep)}\n\n"
        query += query_template \
            .replace('<all_dims>', f"{prefix_str} All dimensions\n{offset}{all_dims_str}") \
            .replace('<select_group>', f"{prefix_str} Select group\n{offset}{select_str}") \
            .replace('<partition_group>', f"{prefix_str} Partition group\n{offset}{partition_str}") \
            .replace('<table>', table)
        queries.append(query)

    stored_proc_query = '\n\nUNION\n'.join(queries)
    return stored_proc_query


def run(dims, template, file_out, table = 'data'):
    permutations = generate_permutations(len(dims))
    query_groups = generate_percentile_groups(dims, permutations)

    stored_proc_query_str = '------ ALL ------\n\n'
    stored_proc_query_str += f'aggr_{table}_all = \n'
    stored_proc_query_str += generate_proc_query_str(template, dims, table + '_all', query_groups)
    stored_proc_query_str += ';'
    stored_proc_query_str += '\n\n------ YESTERDAY ------\n\n'
    stored_proc_query_str += f'aggr_{table}_yesterday = \n'
    stored_proc_query_str += generate_proc_query_str(template, dims, table + '_yesterday', query_groups)

    stored_proc_query_str += '\n\n------ END ------\n;'

    write_file(file_out, stored_proc_query_str)


class Dim:
    def __init__(self, name, type, permute = True):
        self.name = name
        self.type = type
        self.permute = permute


def run_backend():
    folder = f"{QUERY_DIR}\\{BACKEND_DIR}"
    dims = [
        Dim('story_hash', 'string'),
        Dim('model_id', 'string'),
        Dim('query_type', 'string'),
        Dim('status', 'string')
    ]
    run(dims, f"{folder}\\template.sql", f"{folder}\\result.sql")


def run_action():
    folder = f"{QUERY_DIR}\\{ACTION_DIR}"
    dims = [
        Dim('story_id', 'string'),
        Dim('is_optimized_view_mode', 'int'),
        # Dim('action_name_group', 'string', False)
    ]
    run(dims, f"{folder}\\template1.sql", f"{folder}\\result1.sql")
    run(dims, f"{folder}\\template2.sql", f"{folder}\\result2.sql", 'data_actiongroup')


if __name__ == '__main__':
    run_backend()
    run_action()
