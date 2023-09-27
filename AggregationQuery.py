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


def generate_queries(query_template_file, all_dims, query_groups):
    query_template = read_file(query_template_file)
    queries = []
    sep = ', '
    dim_names = list(map(lambda dim: dim.name, all_dims))
    all_dims_str = query_group_to_string(dim_names, sep)
    prefix_str = '-- <Next line is auto-generated>'
    for i, q in enumerate(query_groups):
        select_str = query_group_to_string(q['select'], sep)
        partition_str = query_group_to_string(q['partition'], sep)
        query = f"-- {i + 1}. {select_str.strip(sep)}\n\n"
        query += query_template \
            .replace('<all_dims>', f"{prefix_str} All dimensions\n{all_dims_str}") \
            .replace('<select_group>', f"{prefix_str} Select group\n{select_str}") \
            .replace('<partition_group>', f"{prefix_str} Partition group\n{partition_str}")
        queries.append(query)
    return queries


def run(dims, template, file_out):
    permutations = generate_permutations(len(dims))
    query_groups = generate_percentile_groups(dims, permutations)
    queries = generate_queries(template, dims, query_groups)
    stored_proc_query = '\n\nUNION\n'.join(queries) + '\n;'
    write_file(file_out, stored_proc_query)


class Dim:
    def __init__(self, name, type):
        self.name = name
        self.type = type


def run_backend():
    folder = f"{QUERY_DIR}\\{BACKEND_DIR}"
    dims = [
        Dim('story_id', 'string'),
        Dim('model_id', 'string'),
        Dim('query_type', 'string'),
        Dim('status', 'string')
    ]
    run(dims, f"{folder}\\template.sql", f"{folder}\\result.sql")


def run_action():
    folder = f"{QUERY_DIR}\\{ACTION_DIR}"
    dims = [
        Dim('story_id', 'string'),
        Dim('is_optimized_view_mode', 'int')
    ]
    run(dims, f"{folder}\\template.sql", f"{folder}\\result.sql")


if __name__ == '__main__':
    run_backend()
    run_action()
