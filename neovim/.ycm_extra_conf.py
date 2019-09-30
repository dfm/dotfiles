# import platform
import os
# import subprocess
# import ycm_core
from distutils.sysconfig import get_python_inc


DIR_OF_THIS_SCRIPT = os.path.abspath(os.path.dirname(__file__))
SOURCE_EXTENSIONS = ['.cpp', '.cxx', '.cc', '.c', '.m', '.mm']

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
    # '-Wall',
    # '-Wextra',
    # '-Werror',
    # '-Wno-long-long',
    # '-Wno-variadic-macros',
    # '-fexceptions',
    # '-DNDEBUG',

    # THIS IS IMPORTANT! Without the '-x' flag, Clang won't know which
    # language to use when compiling headers. So it will guess. Badly. So C++
    # headers will be compiled as C headers. You don't want that so ALWAYS
    # specify the '-x' flag. For a C project, you would set this to 'c'
    # instead of 'c++'.
    '-x',
    'c++',

    '-std=c++11',
    '-stdlib=libc++',

    '-isystem',
    '.',

    '-isystem',
    'include',

    '-isystem',
    get_python_inc(),

    '-isystem',
    '/usr/local/include/eigen3',
]

try:
    import tensorflow as tf
except ImportError:
    pass
else:
    flags += tf.sysconfig.get_compile_flags()


def load_local(dirname):
    local_filename = os.path.join(dirname, ".ycm_custom")
    if os.path.exists(local_filename):
        with open(local_filename, "r") as f:
            return [l.strip().replace("{PWD}", dirname) for l in f]
    else:
        parent = os.path.dirname(dirname)
        flag = os.path.exists(os.path.join(dirname, ".git"))
        if parent != dirname and not flag:
            return load_local(parent)
    return []


def Settings(**kwargs):
    if kwargs['language'] == 'cfamily':
        filename = os.path.abspath(kwargs['filename'])
        return {
            'flags': flags + load_local(os.path.dirname(filename)),
            'include_paths_relative_to_dir': os.path.dirname(filename),
            'override_filename': filename
        }
    return {}
