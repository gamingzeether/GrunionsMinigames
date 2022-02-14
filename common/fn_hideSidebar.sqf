#include "script_component.hpp"
/* 
 * Hides current sidebar
 * 
 * Arguments:
 * 0: Targets <NUMBER> or <OBJECT> or <Strig> or <Side> or <ARRAY>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [0] call minigames_common_fnc_hideSidebar
*/

params ["_targets"];

if (!isRemoteExecuted) then {
    _this remoteExecCall [QFUNC(hideSidebar), _targets];
} else {
    (uiNamespace getVariable [QGVAR(sidebar), displayNull]) closeDisplay 1;
    uiNamespace setVariable [QGVAR(sidebar), nil];
    GVAR(activeSidebar) = "";
};
