#include "script_component.hpp"
/* 
 * Handles player dying while minigame is active
 * 
 * Arguments:
 * onPlayerKilled args
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_fyshinabarrel_fnc_onPlayerKilled
 */

params ["_oldUnit", "_killer", "_respawnType", "_respawnDelay"];

GVAR(activePlayers) deleteAt (GVAR(activePlayers) find _oldUnit);
[QGVAR(killerFyshCountdown), _oldUnit] call EFUNC(common,endCountdown);
