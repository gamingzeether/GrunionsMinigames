#include "script_component.hpp"
/* 
 * Updates body text on sidebar
 * 
 * Arguments:
 * 0: Identifier <STRING>
 * 1: Text <STRING>
 * 2: Targets <NUMBER> or <OBJECT> or <Strig> or <Side> or <ARRAY>
 * 
 * Return value:
 * None
 * 
 * Example:
 * ["PointsScoreboard", "Text", 0] call minigames_common_fnc_updateSidebar
 */


params ["_id", "_text", "_targets"];

if (!isRemoteExecuted) then {
    _this remoteExecCall [QFUNC(updateSidebar), _targets];
} else {
    (GVAR(sidebars) get _id) set [1, _text];
    
    if (GVAR(activeSidebar) == _id) then {
        private _display = uiNamespace getVariable [QGVAR(sidebar), displayNull];
        (_display displayCtrl 70002) ctrlSetText _text;
    };
};
