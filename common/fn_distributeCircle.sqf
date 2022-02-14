#include "script_component.hpp"
/* 
 * Distributes objects randomly on a circle
 * 
 * Arguments:
 * 0: Circle center ASL <ARRAY>
 * 1: Circle radius <NUMBER>
 * 2: Objects <ARRAY of OBJECTS>
 * 3: Min distance between objects (Default: 0) <NUMBER>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [[0, 0, 0], 10, [object1, object2, object3]] call minigames_common_fnc_distributeCircle
 */

params ["_center", "_radius", "_objects", ["_minDist", 0]];

#define MAX_TRIES 20

for "_i" from 0 to count _objects do {
    private _searching = true;
    private _pos = _center;
    private _tries = 0;
    
    while {_searching && {_tries < MAX_TRIES}} do {
        _tries = _tries + 1;
        private _distance = _radius * sqrt(random 1);
        private _angle = random 360;
        _pos = _center vectorAdd [_distance * sin _angle, _distance * cos _angle];
        
        if (count (_objects arrayIntersect (_pos nearObjects _minDist)) == 0) then {
            _searching = false;
        };
    };
    
    (_objects select _i) setPosASL _pos;
};
