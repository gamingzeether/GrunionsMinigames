#include "script_macros.hpp"
#include "include\a3\ui_f\hpp\defineDIKCodes.inc"

[
    ["Grunions Minigames", "Common"], 
    QEGVAR(common,selectionGUI), 
    "Open selection GUI", 
    {
        if (EGVAR(common,isSelectingMinigame)) then {
            createDialog QEGVAR(common,selectionMenu);
        };
    }, 
    {}, 
    [DIK_M, true, false, false]
] call CBA_fnc_addKeybind;
