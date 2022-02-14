#include "script_macros.hpp"

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];
    
    [0, _owner] call EFUNC(common,setPoints);
}];
