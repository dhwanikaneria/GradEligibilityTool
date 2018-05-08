_takenCoreCourses(Student):-
	_hasTaken(Student,cs6313),
    _hasTaken(Student,cs6350),
    _hasTaken(Student,cs6363),
    _hasTaken(Student,cs6375).
    
_meetPreReqCourses(Student):-
	_hasTaken(Student,cs5303),
	_hasTaken(Student,cs5333).