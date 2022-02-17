#include "script_component.hpp"
/* 
 * Builds a rectangular arena with given width and length
 * 
 * Arguments:
 * 0: Center ASL <ARRAY>
 * 1: Width X <NUMBER>
 * 2: Width Y <NUMBER>
 * 3: Walls height <NUMBER>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [[0,0,1], 20, 20, 2] call minigames_common_fnc_buildRectangularArena
 * 
 */

params ["_center", "_widthX", "_widthY", "_height"];

private _minCorner = _center vectorAdd [(-_widthX) / 2, (-_widthY) / 2, 0];
private _maxCorner = _center vectorAdd [_widthX / 2, _widthY / 2, 0];

//Place walls
private _wallCountX = ceil (_widthX / WALL_WIDTH);
private _wallCountY = ceil (_widthY / WALL_WIDTH);

private _fnc_wallLine = {
    params ["_start", "_vector", "_wallCount", "_vectorDir"];
    
    for "_i" from 0 to _wallCount do {
        private _wall = createVehicle [WALL_CLASS, [0,0,0]];
        _wall allowDamage false;
        
        _wall setPosASL (_start vectorAdd (_vector vectorMultiply _i));
        _wall setVectorDir _vectorDir;
    };
};

for "_i" from 0 to (_height - 1) do {
    [_minCorner vectorAdd [0, 0, _i * WALL_HEIGHT], [ WALL_WIDTH, 0, 0], _wallCountX, [0,  1, 0]] call _fnc_wallLine;
    [_minCorner vectorAdd [0, 0, _i * WALL_HEIGHT], [0,  WALL_WIDTH, 0], _wallCountY, [ 1, 0, 0]] call _fnc_wallLine;
    [_maxCorner vectorAdd [0, 0, _i * WALL_HEIGHT], [-WALL_WIDTH, 0, 0], _wallCountX, [0, -1, 0]] call _fnc_wallLine;
    [_maxCorner vectorAdd [0, 0, _i * WALL_HEIGHT], [0, -WALL_WIDTH, 0], _wallCountY, [-1, 0, 0]] call _fnc_wallLine;
};

//Place floor
private _floorCountX = ceil (_widthX / FLOOR_WIDTHX);
private _floorCountY = ceil (_widthY / FLOOR_WIDTHY);
[_minCorner vectorAdd [FLOOR_WIDTHX / 2, FLOOR_WIDTHY / 2, -2], FLOOR_WIDTHX, FLOOR_WIDTHY, _floorCountX, _floorCountY, FLOOR_CLASS] call FUNC(distributeGrid);
