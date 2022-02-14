#include "script_component.hpp"
/* 
 * Starts minigame
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_jousting_fnc_startGameCode
 */

GVAR(activePlayers) = allPlayers;
private _center = getPosASL MINIGAME_LOGICENTITY;
[_center, 50, GVAR(activePlayers), 10] call EFUNC(common,distributeCircle);

private _turret = getArray (configFile >> "CfgVehicles" >> VEHICLE_CLASS >> "ace_weapon_mounting_turret");
{
    private _veh = createVehicle [VEHICLE_CLASS, [0, 0, 0]];
    [WEAPON_CLASS, _veh] call ace_weapon_mounting_fnc_mountWeapon;
    for "_i" from 0 to 500 do {
        _veh addMagazineTurret [MAGAZINE_CLASS, _turret];
    };
    _veh setPosASL getPosASL _x;
    _x moveInDriver _veh;
} foreach GVAR(activePlayers);

[MINIGAME_TIME_LIMIT, QGVAR(timeLimit), 0, {
    call EFUNC(common,endMinigame);
}] call EFUNC(common,startCountdown);
