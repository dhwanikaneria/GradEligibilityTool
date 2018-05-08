student(dhwani,ds).
_specialization(dhwani,ds).

_hasTaken(dhwani,cs6313).
_hasTaken(dhwani,cs6350).
_hasTaken(dhwani,cs6363).
_hasTaken(dhwani,cs6375).

%_hasTaken(dhwani,cs6332).
_hasTaken(dhwani,cs6320).
_hasTaken(dhwani,cs6327).
%_hasTaken(dhwani,cs6347).
_hasTaken(dhwani,cs6360).
_hasTaken(dhwani,cs5303).
_hasTaken(dhwani,cs5333).

_taken(dhwani,[cs6313,cs6350,cs6363,cs6375,cs6320,cs6327,cs6360,cs5303,cs5333]).

#include '/Users/hardik/Desktop/GIT-WORKSPACE/GradEligibilityTool/counting.lp'.
#include '/Users/hardik/Desktop/GIT-WORKSPACE/GradEligibilityTool/ms/regular/ds/regular_ds_rules.lp'.

?- _main(dhwani).
