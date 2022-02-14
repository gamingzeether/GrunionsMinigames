#include "script_component.hpp"
/* 
 * Starts minigame
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_fyshinabarrel_fnc_startGameCode
 */

GVAR(activePlayers) = allPlayers;
private _center = getPosASL MINIGAME_LOGICENTITY;
[_center, 15, allPlayers, 1] call EFUNC(common,distributeCircle);

// Spawn fysh
GVAR(killerFysh) = createVehicle ["ace_fyshing_fysh", _center vectorAdd [0, 0, 10]];
private _pickupHelper = createVehicle ["ace_advanced_throwing_pickupHelper", [0, 0, 0]];
_pickupHelper attachTo [GVAR(killerFysh), [0, 0, 0]];
[GVAR(killerFysh), sideEmpty] call ace_fyshing_fnc_flop;

GVAR(pointsAwarderPFH) = [FUNC(pointsAwarder), 1] call CBA_fnc_addPerFrameHandler;

call FUNC(startCountdown);
