#include "script_component.hpp"
/* 
 * Starts a minigame
 * Execute on server
 * 
 * Arguments:
 * 0: Game logic entity <OBJECT>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [fyshInABarrelLogic] call minigames_common_fnc_startMinigame
 */

params ["_logicEntity"];

if (!isNull GVAR(activeMinigame)) then {
    call FUNC(endMinigame);
};
GVAR(activeMinigame) = _logicEntity;
respawn setPosASL (call (_logicEntity getVariable [QGVAR(respawnPos), [0, 0, 0]]));

call (_logicEntity getVariable [QGVAR(startGameCode), {}]);
private _minigamePFC = _logicEntity getVariable [QGVAR(perFrameCode), {}];
if (!isNil "_minigamePFC") then {
    GVAR(minigamePFH) = [_minigamePFC] call CBA_fnc_addPerFrameHandler;
};
