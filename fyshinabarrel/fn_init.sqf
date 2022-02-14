#include "script_component.hpp"
/* 
 * Initalizes minigame
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_fyshinabarrel_fnc_init
 */

MINIGAME_LOGICENTITY setVariable [QEGVAR(common,endGameCode), FUNC(endGameCode)];
MINIGAME_LOGICENTITY setVariable [QEGVAR(common,perFrameCode), FUNC(perFrameCode)];
MINIGAME_LOGICENTITY setVariable [QEGVAR(common,respawnPos), getPosASL lobbyLogic];
MINIGAME_LOGICENTITY setVariable [QEGVAR(common,startGameCode), FUNC(startGameCode)];
MINIGAME_LOGICENTITY setVariable [QEGVAR(common,onPlayerKilled), FUNC(onPlayerkilled)];

// Create arena
private _pos = getPosASL MINIGAME_LOGICENTITY;
private _fnc_wallRing = {
    params ["_pos", "_height"];
    private _walls = [];
    for "_i" from 0 to 36 do {
        private _wall = createVehicle ["Land_Mil_WallBig_4m_F", [0,0,0]];
        _wall allowDamage false;
        _walls pushBack _wall;
    };
    [_pos vectorAdd [0, 0, _height], 20, _walls, true] call EFUNC(common,distributeRing);
};
for "_i" from 0 to 10 do {
    [_pos, 4.5 * _i] call _fnc_wallRing;
};

[_pos vectorAdd [0, -15, -2], 0, 15, 1, 3, "Land_Pier_F"] call EFUNC(common,distributeGrid);
