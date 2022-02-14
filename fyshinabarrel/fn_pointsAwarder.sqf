#include "script_component.hpp"
/* 
 * Awards points to players
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_fyshinabarrel_fnc_pointsAwarder
 */

private _addPtsArray = [];
private _addPlayersArray = [];
{
    private _distance = _x distance GVAR(killerFysh);
    private _points = 5 / sqrt _distance;
    _addPtsArray pushBack round _points;
    _addPlayersArray pushBack owner _x;
} foreach GVAR(activePlayers);

[_addPtsArray, _addPlayersArray] call EFUNC(common,addPoints);
