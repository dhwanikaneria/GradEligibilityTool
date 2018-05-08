_takenCoreCourses(Student):-
	_hasTaken(Student,rhet1302),
    _hasTaken(Student,govt2305),
    _hasTaken(Student,govt2306),
    _hasTaken(Student,phys2125).

_meetPreReqCourses(Student):-
	.