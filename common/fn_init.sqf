#include "script_component.hpp"
/* 
 * Initalizes module
 * 
 * Arguments:
 * None
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_common_fnc_init
 */

GVAR(pointsHashmap) = createHashMap;
GVAR(activeCountdowns) = createHashMap;
GVAR(sidebars) = createHashMap;
GVAR(activeSidebar) = "";
GVAR(shownCountdown) = [];

// Points sidebar
["Points", "", QGVAR(pointsScoreboard), clientOwner] call FUNC(addSidebar);
[QGVAR(pointsScoreboard), clientOwner] call FUNC(showSidebar);

["minigames_pointsUpdated", {
    private _playerScores = [];
    private _players = allPlayers;
    {
        _playerScores set [_foreachIndex, GVAR(pointsHashmap) get owner _x];
    } foreach allPlayers;
    
    for "_i" from 0 to (count _players - 2) do {
        private _highestIndex = _i;
        private _highestScore = _playerScores select _i;
        for "_j" from (_i + 1) to (count _players - 1) do {
            private _score = _playerScores select _j;
            if (_score > _highestScore) then {
                _highestScore = _score;
                _highestIndex = _j;
            };
        };
        private _tempScore = _playerScores select _i;
        private _tempPlayer = _players select _i;
        
        _playerScores set [_i, _playerScores select _highestIndex];
        _players set [_i, _players select _highestIndex];
        
        _playerScores set [_highestIndex, _tempScore];
        _players set [_highestIndex, _tempPlayer];
    };
    
    private _scoresText = "";
    for "_i" from 0 to (count _playerScores - 1) do {
        _scoresText = _scoresText + ((name (_players select _i)) + ": " + (str (_playerScores select _i)) + " pts" + endl);
    };
    
    [QGVAR(pointsScoreboard), _scoresText, clientOwner] call FUNC(updateSidebar);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    //Lobby init
    [getPosASL LOBBY_LOGICENTITY, 20, 1] call FUNC(wallRing);
    [(getPosASL LOBBY_LOGICENTITY) vectorAdd [0, -15, -2], 0, 15, 1, 3, "Land_Pier_F"] call EFUNC(common,distributeGrid);
};
