#include "script_component.hpp"
/* 
 * Ends selection process and starts minigame
 * Execute on server
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_common_fnc_minigameVotingFinish
 */

[QGVAR(minigameVoting), 0] call FUNC(endCountdown);

// Select highest votes
private _votes = [];
for "_i" from 0 to (count GVAR(minigamesList) - 1) do {
    _votes set [_i, 0];
};
{
   _votes set [_y, 1 + (_votes select _y)];
} foreach GVAR(votingSelections);

private _highestVotes = [];
private _highestVoteCount = -1;
{
    if (_x > _highestVoteCount) then {
        _highestVotes = [_foreachIndex];
        _highestVoteCount = _x;
    } else {
        if (_x == _highestVoteCount) then {
            _highestVotes pushBack _foreachIndex;
        };
    };
} foreach _votes;

// Reset counter
GVAR(votingSelections) = createHashmap;

// Start minigame
private _minigameCfg = missionConfigFile >> "CfgGrunionsMinigames" >> (GVAR(minigamesList) select selectRandom _highestVotes);
private _minigameLogic = missionNamespace getVariable [getText (_minigameCfg >> "logicEntity"), objNull];

GVAR(isSelectingMinigame) = false;
publicVariable QGVAR(isSelectingMinigame);
[10, QGVAR(minigameStarting), 0, {
    params ["_minigameLogic"];
    if (isServer) then {
        [_minigameLogic] call FUNC(startMinigame);
    };
}, [_minigameLogic]] call FUNC(startCountdown);
