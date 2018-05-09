%courses for Intelligent System
_req(cs6320,required).
_req(cs6363,required).
_req(cs6364,required).
_req(cs6375,required).

%Electives for Intelligent System
_req(cs6360,coreElective).
_req(cs6378,coreElective).

_req(Course,required):- _hasTaken(_,Course),_req(Course,coreElective).