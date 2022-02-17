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
 * call minigames_jousting_fnc_init
 */

if (isServer) then {
    GVAR(quadbikes) = [];
    GVAR(activePlayers) = [];
    
    // Create arena
    private _pos = getPosASL MINIGAME_LOGICENTITY;
    [_pos, 60, 2] call EFUNC(common,buildCircularArena);
};
