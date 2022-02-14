#include "script_component.hpp"
/* 
 * Resets minigame and prepares to return to lobby
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_jousting_fnc_endGameCode
 */

if (count GVAR(activePlayers) == 1) then {
    [MINIGAME_VICTORY_POINTS, owner (GVAR(activePlayers) select 0)] call EFUNC(common,addPoints);
};
{
   deleteVehicle _x; 
} foreach GVAR(quadbikes);
[QGVAR(timeLimit), 0] call EFUNC(common,endCountdown);
