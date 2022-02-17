#include "script_macros.hpp"

call EFUNC(common,init);

{
    private _minigameCfg = MISSION_CONFIG >> _x;
    call compile getText (_minigameCfg >> "init");
} foreach getArray (MISSION_CONFIG >> "minigamesList");
