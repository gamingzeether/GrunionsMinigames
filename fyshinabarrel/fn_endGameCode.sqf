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
 * call minigames_fyshinabarrel_fnc_endGameCode
 */

deleteVehicle GVAR(killerFysh);
[MINIGAME_WINREWARD, owner (GVAR(activePlayers) select 0)] call EFUNC(common,addPoints);
[GVAR(pointsAwarderPFH)] call CBA_fnc_removePerFrameHandler;
[QGVAR(killerFyshCountdown), 0] call EFUNC(common,endCountdown);
