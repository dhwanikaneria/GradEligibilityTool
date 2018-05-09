#!/usr/bin/env python
"""
    This file is part of Graduation Audit System.
    Copyright (C) 2016 Saikiran Srirangapalli <saikiran1096@gmail.com>

    Graduation Audit System is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Graduation Audit System is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Graduation Audit System.  If not, see <http://www.gnu.org/licenses/>.
"""
from __future__ import print_function
import argparse
import sys
import util


def main():
    """
    This program writes 'main.lp'.
    Run as:
        python main_writer.py <transcript>
    """

    parser = argparse.ArgumentParser(description='Writes main.lp')
    parser.add_argument('transcript')

    transcript_file = parser.parse_args().transcript

    try:
        transcript = util.parse_transcript(transcript_file)
    except IOError as err:
        print(str(err), file=sys.stderr)
        sys.exit(1)

    try:
        main_contents = util.gen_main(transcript)
    except IOError as err:
        print(str(err), file=sys.stderr)
        sys.exit(1)

    factfile = 'main_' + transcript.name +'.lp'
    with open(factfile, 'w') as main_file:
        main_file.write(main_contents)

if __name__ == '__main__':
    main()
