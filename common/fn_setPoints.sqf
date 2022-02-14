#include "script_component.hpp"
/* 
 * Sets player's points
 * 
 * Arguments:
 * 0: Points to add <NUMBER> or <ARRAY>
 * 1: Player ID <NUMBER> or <ARRAY>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [10, owner player] call minigames_common_fnc_setPoints
 */

params ["_points", "_player"];

if (_points isEqualType []) then {
    for "_i" from 0 to (count _points - 1) do {
        GVAR(pointsHashmap) set [_player select _i, _points select _i];
    };
} else {
    GVAR(pointsHashmap) set [_player, _points];
};
["minigames_pointsUpdated", _player] call CBA_fnc_globalEvent;
