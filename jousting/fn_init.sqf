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
    
    MINIGAME_LOGICENTITY setVariable [QEGVAR(common,endGameCode), FUNC(endGameCode)];
    MINIGAME_LOGICENTITY setVariable [QEGVAR(common,perFrameCode), FUNC(perFrameCode)];
    MINIGAME_LOGICENTITY setVariable [QEGVAR(common,respawnPos), getPosASL lobbyLogic];
    MINIGAME_LOGICENTITY setVariable [QEGVAR(common,startGameCode), FUNC(startGameCode)];
    MINIGAME_LOGICENTITY setVariable [QEGVAR(common,onPlayerKilled), FUNC(onPlayerkilled)];
    
    // Create arena
    private _pos = getPosASL MINIGAME_LOGICENTITY;
    [_pos, 60, 2] call EFUNC(common,buildCircularArena);
};
