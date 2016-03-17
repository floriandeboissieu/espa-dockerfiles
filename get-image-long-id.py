#! /usr/bin/env python


import os
import sys
import json


def main():
    data = json.load(sys.stdin)

    long_id = data[0]['Id'].split(':')[1]
    print long_id
    return 0


if __name__ == '__main__':
    sys.exit(main())
