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
 * call minigames_jousting_fnc_onPlayerKilled
 */

params ["_oldUnit", "_killer", "_respawnType", "_respawnDelay"];

[10, owner _killer] call EFUNC(common,addPoints);
GVAR(activePlayers) deleteAt (GVAR(activePlayers) find _oldUnit);

if (count GVAR(activePlayers) <= 1) then {
    call EFUNC(common,endMinigame);
};
