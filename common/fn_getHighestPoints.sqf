#include "script_component.hpp"
/* 
 * Gets players with highest points
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * Players with highest points <ARRAY of ARRAYS>
 *  0: Player ID <NUMBER>
 *  1: Points <NUMBER>
 * 
 * Example:
 * call minigames_common_fnc_getHighestPoints
 */

private _highestPoints = -1;
private _highestPlayers = [];
{
    if (_y > _highestPoints) then {
        _highestPoints = _y;
        
        _highestPlayers = [];
        _highestPlayers pushBack [_x, _y];
    } else {
        if (_y == _highestPoints) then {
            _highestPlayers pushBack [_x, _y];
        };
    };
} foreach GVAR(pointsHashmap);

_highestPlayers
