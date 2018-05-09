student(dhwani,ds).
_specialization(dhwani,ds).

_hasTaken(dhwani,cs6350).
_hasTaken(dhwani,cs6363).
_hasTaken(dhwani,cs6375).
_hasTaken(dhwani,cs6301).
_hasTaken(dhwani,cs6352).
_hasTaken(dhwani,cs6353).
_hasTaken(dhwani,cs6356).
_hasTaken(dhwani,cs5333).

_taken(dhwani,[cs6350,cs6363,cs6375,cs6301,cs6352,cs6353,cs6356,cs5333]).

#include '/Users/hardik/Desktop/GIT-WORKSPACE/GradEligibilityTool/counting.lp'.
#include '/Users/hardik/Desktop/GIT-WORKSPACE/GradEligibilityTool/ms/regular/ds/regular_ds_rules.lp'.

?- _main(dhwani).
