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
[getPosASL MINIGAME_LOGICENTITY, 20, 10] call EFUNC(common,wallRing);
[_pos vectorAdd [0, -15, -2], 0, 15, 1, 3, "Land_Pier_F"] call EFUNC(common,distributeGrid);
