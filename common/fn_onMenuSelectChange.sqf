#include "script_component.hpp"
/* 
 * Updates minigame selection menu info
 * 
 * Arguments:
 * 0: Listbox control <CONTROL>
 * 1: Selected index <NUMBER>
 * 
 * Return value:
 * None
 * 
 * Example:
 * call minigames_common_fnc_onMenuSelectChange
 */

params ["_control", "_index"];

if (!GVAR(isSelectingMinigame)) exitWith {};

private _display = uiNamespace getVariable [QGVAR(selectionMenu), displayNull];
if (isNull _display) exitWith {};

private _minigameCfg = MISSION_CONFIG >> (GVAR(minigamesList) select _index);
(_display displayCtrl 71002) ctrlSetText (getText (_minigameCfg >> "minigameInfo"));

['minigames_voteSelected', [clientOwner, _index]] call CBA_fnc_serverEvent;
