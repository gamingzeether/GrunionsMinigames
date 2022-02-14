#include "script_component.hpp"
/* 
 * Code that is executed every frame
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_fyshinabarrel_fnc_perFrameCode
 */

// Respawn the fysh if it moves too far away or despawns

if (isNil QGVAR(killerFysh) || {isNull GVAR(killerFysh)} || {(GVAR(killerFysh) distance MINIGAME_LOGICENTITY) > MINIGAME_RADIUS}) then {
    deleteVehicle GVAR(killerFysh);
    GVAR(killerFysh) = createVehicle ["ace_fyshing_fysh", getPosASL MINIGAME_LOGICENTITY vectorAdd [0, 0, 10]];
    [GVAR(killerFysh), sideEmpty] call ace_fyshing_fnc_flop;
};

if (count GVAR(activePlayers) == 0) then {
    call EFUNC(common,endMinigame);
};

{
    if (_x distance MINIGAME_LOGICENTITY > MINIGAME_RADIUS) then {
        _x setPosASL getPosASL MINIGAME_LOGICENTITY;
    };
} foreach GVAR(activePlayers);
