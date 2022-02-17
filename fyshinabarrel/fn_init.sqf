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

if (isServer) then {
    // Create arena
    private _pos = getPosASL MINIGAME_LOGICENTITY;
    [_pos, 20, 10] call EFUNC(common,buildCircularArena);
};
