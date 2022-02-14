#include "script_component.hpp"
/* 
 * Adds points to player
 * Execute on server
 * 
 * Arguments:
 * 0: Points to add <NUMBER> or <ARRAY>
 * 1: Player ID <NUMBER> or <ARRAY>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [10, owner player] call minigames_common_fnc_addPoints
 */

params ["_points", "_player"];

if (_points isEqualType []) then {
    for "_i" from 0 to (count _points - 1) do {
        GVAR(pointsHashmap) set [_player select _i, (_points select _i) + (GVAR(pointsHashmap) getOrDefault [_player select _i, 0])];
    };
} else {
    GVAR(pointsHashmap) set [_player, _points + (GVAR(pointsHashmap) getOrDefault [_player, 0])];
};
["minigames_pointsUpdated", _player] call CBA_fnc_globalEvent;
