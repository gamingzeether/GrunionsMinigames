#include "script_component.hpp"
/* 
 * Gets sidebar text
 * 
 * Arguments:
 * 0: Identifier <STRING>
 * 
 * Return value:
 * Sidebar text <STRING>
 * 
 * Example:
 * ["PointsScoreboard"] call minigames_common_fnc_getSidebar
*/

params ["_id"];

(GVAR(sidebars) get _id) select 1
