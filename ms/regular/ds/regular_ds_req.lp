%courses for Data Science
_req(cs6313,required).
_req(cs6350,required).
_req(cs6363,required).
_req(cs6375,required).

%Electives for Data Science
_req(cs6301,coreElective).
_req(cs6320,coreElective).
_req(cs6327,coreElective).
_req(cs6347,coreElective).
_req(cs6360,coreElective).

_req(Course,required):- _hasTaken(_,Course),_req(Course,coreElective).
