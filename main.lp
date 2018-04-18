
student(dhwani,cs).
_hasTaken(dhwani,math2451).
_hasTaken(dhwani,math3311).
_hasTaken(dhwani,math3323).
_hasTaken(dhwani,ecs1200).


_taken(dhwani,[chem1311,chem1111,math2417,hist1301,hist1302,math2419,ahst2331,math3310,cs4V98,math2451,math3311,math3323]).

#include 'counting.lp'.
#include 'reg_ds_rules.lp'.

?-_main(dhwani).