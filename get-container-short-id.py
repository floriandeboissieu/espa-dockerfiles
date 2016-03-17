#! /usr/bin/env python


import os
import sys
import commands


def main():

    cmd = 'docker run -d {0} /bin/bash'.format(sys.argv[1])
    status, long_id = commands.getstatusoutput(cmd)

    short_id = long_id[:12]

    print short_id
    return 0


if __name__ == '__main__':
    sys.exit(main())
