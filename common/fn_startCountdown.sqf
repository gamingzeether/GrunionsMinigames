#include "script_component.hpp"
/* 
 * Starts a countdown
 * 
 * Arguments:
 * 0: Time <NUMBER>
 * 1: Identifier <STRING>
 * 2: Targets <NUMBER> or <OBJECT> or <Strig> or <Side> or <ARRAY>
 * 3: Code on complete (Default: {}) <CODE>
 * 4: Code params (Default: []) <ARRAY>
 * 
 * Return value:
 * None
 * 
 * Example:
 * [10, "test", allPlayers] call minigames_common_fnc_startCountdown
 */

params ["_countdownTime", "_identifier", "_targets", ["_code", {}], ["_params", []]];

if (!isRemoteExecuted) then {
    _this remoteExecCall [QFUNC(startCountdown), _targets];
} else {
    if (isNull (uiNamespace getVariable [QGVAR(minigamesCountdown), displayNull])) then {
        ([QGVAR(minigamesCountdown)] call BIS_fnc_rscLayer) cutRsc [QGVAR(minigamesCountdown), "PLAIN"];
    };
    
    if (!isNil {GVAR(activeCountdowns) get _identifier}) then {
        [_identifier, clientOwner] call FUNC(endCountdown);
    };
    
    private _pfh = [{
        (_this select 0) params ["_beginTime", "_countdownTime", "_identifier", "_code", "_params"];
        
        private _elapsedTime = CBA_missionTime - _beginTime;
        private _display = uiNamespace getVariable [QGVAR(minigamesCountdown), displayNull];
        
        if (_elapsedTime > _countdownTime) exitWith {
            _params call _code;
            [_identifier, clientOwner] call FUNC(endCountdown);
        };
        
        if ((_this select 1) == (GVAR(shownCountdown) select (count GVAR(shownCountdown) - 1))) then {
            private _remainingTime = str (_countdownTime - _elapsedTime);
            _remainingTime = _remainingTime select [0, (_remainingTime find ".") + 2];
            (_display displayCtrl 69001) ctrlSetText _remainingTime;
        };
    }, 0.1, [CBA_missionTime, _countdownTime, _identifier, _code, _params]] call CBA_fnc_addPerFrameHandler;
    
    GVAR(shownCountdown) pushBack _pfh;
    GVAR(activeCountdowns) set [_identifier, _pfh];
};
