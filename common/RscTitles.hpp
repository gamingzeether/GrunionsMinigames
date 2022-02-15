#include "script_component.hpp"

class RscTitles {
    class GVAR(minigamesCountdown) {
        idd = 69000;
        onLoad = "uiNamespace setVariable ['minigames_common_minigamesCountdown', _this select 0];";
        duration = "10e10";
        
        class controls {
            class NumbersTextBox: RscText {
                idc = 69001;
                
                x = 0.4250 * __W + __X;
                y = 0.0100 * __H + __Y;
                w = 0.1500 * __W;
                h = 0.0600 * __H;
                style = ST_CENTER;
                text = "0.0";
                SizeEx = GUI_GRID_H * 3;
            };
        };
    };
    
    class GVAR(sidebar) {
        idd = 70000;
        onLoad = "uiNamespace setVariable ['minigames_common_sidebar', _this select 0];";
        duration = "10e10";
        
        class controls {
            class Title: RscText {
                idc = 70001;
                
                x = 0.8400 * __W + __X;
                y = 0.2000 * __H + __Y;
                w = 0.1500 * __W;
                h = 0.0500 * __H;
                style = ST_CENTER;
                text = "";
                SizeEx = GUI_TEXT_SIZE_LARGE;
                colorBackground[] = {0, 0, 0, 0.3};
            };
            class TextBox: RscText {
                idc = 70002;
                
                x = 0.8400 * __W + __X;
                y = 0.2500 * __H + __Y;
                w = 0.1500 * __W;
                h = 0.5000 * __H;
                style = ST_LEFT + ST_MULTI;
                text = "";
                SizeEx = GUI_TEXT_SIZE_MEDIUM;
                colorBackground[] = {0, 0, 0, 0.2};
            };
        };
    };
};