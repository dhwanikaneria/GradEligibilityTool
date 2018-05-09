_takenCoreCourses(Student):-
	_hasTaken(Student,cs6320),
    _hasTaken(Student,cs6363),
    _hasTaken(Student,cs6364),
    _hasTaken(Student,cs6375).
    
_meetPreReqCourses(Student):-
	_hasTaken(Student,cs5V81),
	_hasTaken(Student,cs5348).