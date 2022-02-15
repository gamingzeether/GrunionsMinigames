#include "script_component.hpp"
/* 
 * Starts minigame voting
 * Execute on server
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_common_fnc_startMinigameVoting
 */

GVAR(isSelectingMinigame) = true;
publicVariable QGVAR(isSelectingMinigame);
