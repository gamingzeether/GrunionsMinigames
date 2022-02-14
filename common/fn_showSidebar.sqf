#include "script_component.hpp"
/* 
 * Shows selected sidebar
 * 
 * Arguments:
 * 0: Identifier <STRING>
 * 1: Targets <NUMBER> or <OBJECT> or <Strig> or <Side> or <ARRAY>
 * 
 * Return value:
 * None
 * 
 * Example:
 * ["PointsScoreboard", 0] call minigames_common_fnc_showSidebar
 */

params ["_id", "_targets"];

if (!isRemoteExecuted) then {
    _this remoteExecCall [QFUNC(showSidebar), _targets];
} else {
    private _display = uiNamespace getVariable [QGVAR(sidebar), displayNull];
    if (isNull _display) then {
        ([QGVAR(sidebar)] call BIS_fnc_rscLayer) cutRsc [QGVAR(sidebar), "PLAIN"];
        _display = uiNamespace getVariable [QGVAR(sidebar), displayNull];
    };
    
    private _sidebarData = GVAR(sidebars) get _id;
    (_display displayCtrl 70001) ctrlSetText (_sidebarData select 0);
    (_display displayCtrl 70002) ctrlSetText (_sidebarData select 1);
    GVAR(activeSidebar) = _id;
};
