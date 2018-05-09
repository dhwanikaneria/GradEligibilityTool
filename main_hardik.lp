student(hardik,intSys).
_specialization(hardik,intSys).

_hasTaken(hardik,cs6320).
_hasTaken(hardik,cs6363).
_hasTaken(hardik,cs6364).
_hasTaken(hardik,cs6375).
_hasTaken(hardik,cs6360).
_hasTaken(hardik,cs6326).
_hasTaken(hardik,cs6343).
_hasTaken(hardik,cs6350).
_hasTaken(hardik,cs6353).
_hasTaken(hardik,cs5V81).
_hasTaken(hardik,cs5348).

_taken(hardik,[cs6320,cs6363,cs6364,cs6375,cs6360,cs6326,cs6343,cs6350,cs6353,cs5V81,cs5348]).

#include '/Users/hardik/Desktop/GIT-WORKSPACE/GradEligibilityTool/counting.lp'.
#include '/Users/hardik/Desktop/GIT-WORKSPACE/GradEligibilityTool/ms/regular/intSys/regular_intSys_rules.lp'.

?- _main(hardik).
