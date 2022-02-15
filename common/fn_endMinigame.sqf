#include "script_component.hpp"
/* 
 * Ends currently running minigame and returns players to lobby
 * Execute on server
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_common_fnc_endMinigame
 */

call (GVAR(activeMinigame) getVariable [QGVAR(endGameCode), {}]);
[GVAR(minigamePFH)] call CBA_fnc_removePerFrameHandler;
GVAR(activeMinigame) = objNull;
respawn setPosASL getPosASL LOBBY_LOGICENTITY;
[{{deleteVehicle _x} foreach allDeadMen}, nil, 5] call CBA_fnc_waitAndExecute;

[getPosASL LOBBY_LOGICENTITY, 15, allPlayers select {alive _x}, 0.5] call FUNC(distributeCircle);
call FUNC(startMinigameVoting);
