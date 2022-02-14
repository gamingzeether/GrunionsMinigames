#include "script_component.hpp"
/* 
 * Code that is executed every frame
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_jousting_fnc_perFrameCode
 */

{
    if ((vehicle _x) distance MINIGAME_LOGICENTITY > MINIGAME_RADIUS) then {
        (vehicle _x) setPosASL getPosASL MINIGAME_LOGICENTITY;
    };
} foreach GVAR(activePlayers);
