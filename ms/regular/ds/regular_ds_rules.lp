#include 'regular_ds_grad.lp'.
#include 'regular_ds_req.lp'.
#include 'regular_ds_req2.lp'.
#include 'regular_ds_sugg.lp'.


canGraduate(Student):-
	_takenCoreCourses(Student),
	_meetPreReqCourses(Student),
	_meetsHours(Student,required,15),
	_meetsHours(Student,elective,18).
	
_suggestionToGraduate(Student):-
	_suggestReqCourses(Student),
	_suggestPreReqCourses(Student),
	_auditHours(Student,required,15),
	_auditHours(Student,elective,18).
	
_main(Student):-
	canGraduate(Student).

_main(Student):-
	_suggestionToGraduate(Student).
	