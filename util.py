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
from collections import namedtuple
import re
import csv
import os.path as path


# Container for student academic information
Transcript = namedtuple(
    'Transcript', ['name', 'degree', 'category', 'spec', 'courses'])


class CourseNotFoundError(Exception):
    """
    Error raised an invalid course is encountered when
    generating main.lp
    """
    msg = "Course {} was not found in the database.\n"\
          "Make sure the class is spelled correctly or try removing this\n"\
          "course and running the audit again."

    def __init__(self, course):
        self.msg = CourseNotFoundError.msg.format("'{}'".format(course))

    def __str__(self):
        return self.msg


def get_package_dir():
    """
    Returns the directory that this package is located.
    """
    return path.dirname(path.realpath(__file__))


def parse_transcript(transcript):
    """
    Parses a transcript in the .csv format specified in the README
    and returns and equivalent Transcript object.
    """
    try:
        csvr = list(csv.reader(open(transcript)))
        # the student's name is on the first line
        student = csvr[0][0]
        # extract contents on the second line
        print csvr[1]
        (degree, category, spec) = csvr[1]
        # list of courses student has taken are on the third line
        courses = csvr[2]
        #print courses
    except IOError:
        raise IOError('could not read transcript {}'.format(transcript))

    return Transcript(student, degree, category, spec, courses)


def get_courses():
    """
    Returns a list of all valid courses
    """
    path = get_package_dir() + '/' + 'course.lp'
    with open(path, 'r') as fil:
        valid_courses = re.findall('[a-z]+[0-9][0-9V][0-9]{2}', fil.read())
        #print valid_courses
    return valid_courses


def get_required_courses(degree, category, spec):
    """
    Returns a list of courses required to graduate
        according to the degree, major, and year.
    """
    directory = get_package_dir()
    filename = '{0}/{1}/{2}/{3}/{2}_{3}_req.lp'.format(
        directory, degree, category, spec)
    try:
        contents = open(filename).read()
    except IOError:
        raise IOError('error: could not read {}'.format(filename))

    req_courses = re.findall(
        r'_req\(([a-z]+[0-9][0-9V][0-9]{2}),required\).', contents)
    return req_courses


def gen_main(transcript):
    """
    Returns the contents of a s(ASP) program that can
    be run to perform a graduation audit on a student
    with the provided transcript
    """
    student_fact = "student({},{}).".format(transcript.name, transcript.spec)

    if transcript.spec != 'none':
        spec_string = '_specialization({0},{1}).\n'.format(
            transcript.name, transcript.spec)
    else:
        spec_string = str()

    # the _taken(<name>,[c1,c2...cn]). atom
    taken_list = '_taken({},['.format(transcript.name)
    has_taken = str()  # series of _hasTaken/2 atoms

    try:
        req = get_required_courses(
            transcript.degree, transcript.category, transcript.spec)
    except IOError as err:
        raise err

    valid_courses = get_courses()

    for course in transcript.courses:

        # course not found in databse
        if not course in valid_courses:
            raise CourseNotFoundError(course)

        # include only those courses that could possibly
        # counted as electives i.e. those that are not required.
        # in the 'taken list' (improves performance)
        #if not course in req:
        taken_list += course + ','



        has_taken += '_hasTaken({0},{1}).\n'.format(transcript.name, course)

    # strip trailisng comma
    if transcript.courses != []:
        taken_list = taken_list[:-1]
    taken_list += ']).\n'

    print taken_list

    directory = get_package_dir()
    postamble = "#include '{0}/counting.lp'.\n"\
        "#include '{0}/{1}/{2}/{3}/{2}_{3}_rules.lp'.\n\n"\
        '?- _main({4}).\n'.format(directory, transcript.degree,
                                  transcript.category, transcript.spec, transcript.name)

    mainlp = '\n'.join(
        [student_fact, spec_string, has_taken, taken_list, postamble])

    return mainlp
