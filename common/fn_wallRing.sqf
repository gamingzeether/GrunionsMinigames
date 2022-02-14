#include "script_component.hpp"
/* 
 * Builds a wall ring of given radius and height
 * 
 * Arguments:
 * 0: Center ASL <ARRAY>
 * 1: Radius <NUMBER>
 * 2: Height <NUMBER>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [[0,0,0], 20, 1] call minigames_common_fnc_wallRing
 */

params ["_center", "_radius", "_height"];

#define WALL_WIDTH 4
#define WALL_CLASS "Land_Mil_WallBig_4m_F"

private _wallCount = ceil ((6.3 * _radius) / WALL_WIDTH);
for "_i" from 0 to (_height - 1) do {
    private _walls = [];
    for "_j" from 1 to _wallCount do {
        private _wall = createVehicle [WALL_CLASS, [0,0,0]];
        _wall allowDamage false;
        _walls pushBack _wall;
    };
    [_center vectorAdd [0, 0, _i * 4.5], _radius, _walls, true] call EFUNC(common,distributeRing);
};
