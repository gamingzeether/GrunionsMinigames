#include "script_component.hpp"
/* 
 * Places objects in a grid
 * 
 * Arguments:
 * 0: Start pos ASL <ARRAY>
 * 1: Grid spacing X <NUMBER>
 * 2: Grid spacing Y <NUMBER>
 * 3: Grid count X <NUMBER>
 * 4: Grid count Y <NUMBER>
 * 5: Object type <STRING>
 * 
 * Return value:
 * Created objects <ARRAY>
 * 
 * Example:
 * [[0, 0, 5], 15, 10, 10, 10, "Land_Pier_F"] call minigames_common_fnc_placeObjectsGrid
 */

params ["_startPos", "_xSpacing", "_ySpacing", "_xCount", "_yCount", "_type"];

private _objects = [];
for "_i" from 0 to (_xCount - 1) do {
    for "_j" from 0 to (_yCount - 1) do {
        private _offsetPos = [_xSpacing * _i, _ySpacing * _j];
        
        private _obj = createVehicle [_type, [0, 0, 0]];
        _obj setPosASL (_startPos vectorAdd _offsetPos);
        _objects pushBack _obj;
    };
};

_objects
