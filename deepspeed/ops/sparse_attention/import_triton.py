import os

def _build_file_index(directory, suffix='.tr'):
    """Build an index of source files and their basenames in a given directory.

    Args:
        directory (string): the directory to index
        suffix (string): index files with this suffix

    Returns:
        list: A list of tuples of the form [(basename, absolute path), ...]
    """

    index = []

    for fname in os.listdir(directory):
        if fname.endswith(suffix):
            basename = fname[:fname.rfind(suffix)]  # strip the suffix
            path = os.path.join(directory, fname)
            index.append((basename, path))

    return index


def get_triton_src(path):
    ret = {}
    for name, fname in _build_file_index(path):
        with open(fname, 'r') as fin:
            ret[name] = fin.read()
    return ret