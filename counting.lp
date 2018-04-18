
	





_t(Student,Course) :- _hasTaken(Student,Course).
_t(Student,Course) :- hasNotTaken(Student,Course).

hasNotTaken(Student,Course) :- not _hasTaken(Student, Course).


_meetsHours(Student, Req, N):-
    _countHours(Student,Sum,Req),
    Sum >= N.

_auditHours(Student, Req, N):-
    _taken(Student, CourseList),
    _auditHours(Student, Req, CourseList,N).     
_auditHours(Student, Req, N):-
    _countHours(Student, Sum, Req),
    Diff is N - Sum,
    needsHours(Student,Req,Diff).

needsHours(Student, Req, Diff).


_countHours(Student, Sum, Req):-
    _taken(Student, List),
    _countHours(Student,List,Sum,Req).	  	 
_countHours(Student, [], 0, Req).
_countHours(Student, [Course|Tail], Sum, Req):-
    _req(Course, Req),
    _course(Course, H),
    %_takenFor(Student,Course,Req),
    _countHours(Student,Tail,Sum_Tail,Req),
    Sum is H + Sum_Tail.
_countHours(Student,[H|T],Sum,Req):-
    _countHours(Student,T,Sum,Req).

