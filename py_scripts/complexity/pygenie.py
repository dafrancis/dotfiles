#!/usr/bin/env python

import os
import sys
from glob import glob
from optparse import OptionParser
import cc

USAGE = 'usage: pygenie command [directories|files|packages]'

def find_module(fqn):
    join = os.path.join
    exists = os.path.exists
    partial_path = fqn.replace('.', os.path.sep)
    for p in sys.path:
        path = join(p, partial_path, '__init__.py')
        if exists(path):
            return path
        path = join(p, partial_path + '.py')
        if exists(path):
            return path
    raise Exception('invalid module')


def main():
    parser = OptionParser(usage='./cc.py command [options] *.py')
    parser.add_option('-v', '--verbose',
            dest='verbose', action='store_true', default=False,
            help='print detailed statistics to stdout')
    args = sys.argv[1:]

    items = set()
    for arg in args:
        if os.path.isdir(arg):
            for f in glob(os.path.join(arg, '*.py')):
                if os.path.isfile(f):
                    items.add(os.path.abspath(f))
        elif os.path.isfile(arg):
            items.add(os.path.abspath(arg))
        else:
            # this should be a package'
            print arg
            items.add(find_module(arg))

    for item in items:
        code = open(item).read()
        stats = cc.measure_complexity(code, item)
        pp = cc.PrettyPrinter(sys.stdout, verbose=False)
        pp.pprint(item, stats)


if __name__ == '__main__':
    main()

