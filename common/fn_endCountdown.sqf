#include "script_component.hpp"
/* 
 * Ends countdown
 * 
 * Arguments:
 * 0: Countdown identifier <STRING>
 * 1: Targets <NUMBER> or <OBJECT> or <Strig> or <Side> or <ARRAY>
 * 
 * Return value:
 * None
 * 
 * Example:
 * ["test", allPlayers] call minigames_common_fnc_endCountdown
 */

params ["_identifier", "_targets"];

if (!isRemoteExecuted) then {
    _this remoteExecCall [QFUNC(endCountdown), _targets];
} else {
    GVAR(shownCountdown) deleteAt (GVAR(shownCountdown) find (GVAR(activeCountdowns) get _identifier));
    (uiNamespace getVariable [QGVAR(minigamesCountdown), displayNull]) closeDisplay 1;
    uiNamespace setVariable [QGVAR(minigamesCountdown), nil];
    [GVAR(activeCountdowns) get _identifier] call CBA_fnc_removePerFrameHandler;
    GVAR(activeCountdowns) set [_identifier, nil];
};
