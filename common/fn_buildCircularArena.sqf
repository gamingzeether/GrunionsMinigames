#include "script_component.hpp"
/* 
 * Builds an arena of given radius and height
 * 
 * Arguments:
 * 0: Center ASL <ARRAY>
 * 1: Radius <NUMBER>
 * 2: Walls hight <NUMBER>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [[0,0,0], 20, 2] call minigames_common_fnc_buildCircularArena
 */

params ["_center", "_radius", "_height"];

private _wallCount = ceil ((6.3 * _radius) / WALL_WIDTH);
for "_i" from 0 to (_height - 1) do {
    private _walls = [];
    for "_j" from 1 to _wallCount do {
        private _wall = createVehicle [WALL_CLASS, [0,0,0]];
        _wall allowDamage false;
        _walls pushBack _wall;
    };
    [_center vectorAdd [0, 0, _i * WALL_HEIGHT], _radius, _walls, true] call EFUNC(common,distributeRing);
};

private _floorStart = _center vectorAdd [(FLOOR_WIDTHX / 2) - _radius, (FLOOR_WIDTHY / 2) - _radius, -2];
private _floorCountX = ceil ((_radius * 2 + 5) / FLOOR_WIDTHX);
private _floorCountY = ceil ((_radius * 2 + 5) / FLOOR_WIDTHY);
[_floorStart, FLOOR_WIDTHX, FLOOR_WIDTHY, _floorCountX, _floorCountY, FLOOR_CLASS] call FUNC(distributeGrid);
