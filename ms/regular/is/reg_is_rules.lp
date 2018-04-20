#include 'reg_is_grad.lp'.
#include 'reg_is_req.lp'.
#include 'reg_is_req2.lp'.
#include 'reg_is_sugg.lp'.


canGraduate(Student):-
	_takenCoreCourses(Student),
	_meetPreReqCourses(Student),
	_meetHours(Student,'Core Credit',15),
	_meetHours(Student,'Elective Credit',18).
	
suggestionToGraduate(Student):-
	_suggestReqCourses(Student),
	_suggestPreReqCourses(Student),
	_auditHours(Student,'Core Credit',15),
	_auditHours(Student,'Elective Credit',15).
	
_main(Student):-
	canGraduate(Student).

_main(Student):-
	_suggestionToGraduate(Student).
	