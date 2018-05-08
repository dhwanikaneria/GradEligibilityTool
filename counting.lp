#include 'course.lp'.


hasNotTaken(Student,Course) :- not _hasTaken(Student, Course).

_t(Student,Course) :- _hasTaken(Student,Course).
_t(Student,Course) :- hasNotTaken(Student,Course).


_meetsHours(Student, Req, N):-
    _countHours(Student,Sum,Req),
    %write(Req),
    Sum >= N.
    %, write(Sum), _meetsHours(Student, Req, N).

%_meetsHours(Student, Req, N):-
 %   _countHours(Student,Sum,Req),
  %  write(Sum),
   % Sum > N.

_auditHours(Student, Req, N):-
%write(N),
    _taken(Student, CourseList),
    _auditHours(Student, Req, CourseList,N).     
_auditHours(Student, Req, N):-
    _countHours(Student, Sum, Req),
    %write(Req),write(Sum),write(' '),
    Diff is N - Sum,
    %write(Req),write(Diff),write(' '),  
    needsHours(Student,Req,Diff).

needsHours(Student, Req, Diff).

_auditHours(Student, Req, List, Min):-
    Min =< 0.           
_auditHours(Student, Req, [Course|Tail], Min):-
    _req(Course, Req),
    _course(Course, H),
    %_takenFor(Student, Course, Req),
    Min_sub is Min - H,
    _auditHours(Student, Req, Tail, Min_sub).            
_auditHours(Student, Req, [Course|Tail], Min):-
    _auditHours(Student, Req, Tail, Min).


_countHours(Student, Sum, Req):-
    _taken(Student, List),
    _countHours(Student,List,0,Sum,Req).

_countHours(Student, [], Accu,Accu, Req).
_countHours(Student, [Course|Tail], Accu ,Sum, Req):-
    _req(Course, Req),
    _course(Course, H),
    NewAccu is (Accu+H),
    _countHours(Student,Tail,NewAccu,Sum,Req).
    

_countHours(Student,[H|T],Accu,Sum,Req):-
    _countHours(Student,T,Accu,Sum,Req).

