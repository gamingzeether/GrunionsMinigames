#include "script_component.hpp"
/* 
 * Distributes objects evenly along a ring
 * 
 * Arguments:
 * 0: Ring center ASL <ARRAY>
 * 1: Ring radius <NUMBER>
 * 2: Objects <ARRAY of OBJECTS>
 * 3: Orientate objects towards center <BOOL>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [[0, 0, 0], 10, [object1, object2, object3]] call minigames_common_fnc_distributeRing
 */

params ["_center", "_radius", "_objects", ["_pointTowardsCenter", false]];

private _angleDiff = 360 / count _objects;

for "_i" from 0 to (count _objects - 1) do {
    private _object = _objects select _i;
    private _pos = _center vectorAdd [_radius * sin (_angleDiff * _i), _radius * cos (_angleDiff * _i)];
    
    _object setPosASL _pos;
    if (_pointTowardsCenter) then {
        _object setVectorDir (_pos vectorFromTo _center);
    };
};
