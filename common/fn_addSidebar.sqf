#include "script_component.hpp"
/* 
 * Creates sidebar
 * 
 * Arguments:
 * 0: Title <STRING>
 * 1: Text <STRING>
 * 2: Identifier <STRING>
 * 3: Targets <NUMBER> or <OBJECT> or <Strig> or <Side> or <ARRAY>
 * 
 * Return value:
 * None
 * 
 * Example:
 * ["Points Scoreboard", "", "PointsScoreboard", 0] call minigames_common_fnc_addSidebar
 */

params ["_title", "_text", "_id", "_targets"];

if (!isRemoteExecuted) then {
    _this remoteExecCall [QFUNC(addSidebar), _targets];
} else {
    GVAR(sidebars) set [_id, [_title, _text]];
};
