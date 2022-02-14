#include "script_component.hpp"
/* 
 * (Re)Starts killer fysh countdown
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_fyshinabarrel_fnc_startCountdown
 */

[20 max round (5 * sqrt(count GVAR(activePlayers))), QGVAR(killerFyshCountdown), GVAR(activePlayers), {
    if (!isServer) exitWith {};
    
    // Select closest target
    private _pos = getPosASL GVAR(killerFysh);
    private _targets = nearestObjects [_pos, ["Man"], MINIGAME_RADIUS, true];
    _targets = _targets arrayIntersect GVAR(activePlayers);
    
    private _nearest = _targets select 0;
    private _nearestDist = _pos vectorDistance getPosASL _nearest;
    {
        private _tempDist = _pos vectorDistance getPosASL _x; 
        if (_tempDist < _nearestDist) then {
            _nearest = _x;
            _nearestDist = _tempDist;
        };
    } foreach _targets;
    
    // Kill target
    _nearest setDamage 2;
    private _vector = _pos vectorFromTo [0, 0, 1] vectorAdd (getPosASL _nearest);
    GVAR(killerFysh) setVelocity (_vector vectorMultiply 10);
    GVAR(activePlayers) deleteAt (GVAR(activePlayers) find _nearest);
    
    // Restart countdown
    if (count GVAR(activePlayers) > 1) then {
        call FUNC(startCountdown);
    } else {
        call EFUNC(common,endMinigame);
    };
}] call EFUNC(common,startCountdown);
