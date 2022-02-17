#include "script_component.hpp"

class GVAR(selectionMenu) {
    idd = 71000;
    onLoad = QUOTE(uiNamespace setVariable ARR2(QQGVAR(selectionMenu), _this select 0););
    onUnload = QUOTE(uiNamespace setVariable ARR2(QQGVAR(selectionMenu), nil););
    
    class controlsBackground {
        class MainBackground: RscText {
            x = 0.2000 * __W + __X;
            y = 0.2000 * __H + __Y;
            w = 0.6000 * __W;
            h = 0.6000 * __H;
            colorBackground[] = {0, 0, 0, 0.4};
        };
        class TitleBar: RscText {
            x = 0.2000 * __W + __X;
            y = 0.2000 * __H + __Y;
            w = 0.6000 * __W;
            h = 0.0200 * __H;
            colorBackground[] = {0, 0, 0, 0.4};
            text = "Minigame Selection Menu";
        };
    };
    class controls {
        class ItemsListbox: RscListBox {
            idc = 71001;
            
            x = 0.2050 * __W + __X;
            y = 0.2400 * __H + __Y;
            w = 0.3000 * __W;
            h = 0.5300 * __H;
            colorBackground[] = {0, 0, 0, 0.3};
            onLBSelChanged = QUOTE(_this call FUNC(onMenuSelectChange));
            onLoad = QUOTE( { private _name = getText (MISSION_CONFIGM >> _x >> 'minigameDisplayName'); (_this select 0) lbAdd _name; } foreach GVAR(minigamesList); );
        };
        class ItemInfo: RscText {
            idc = 71002;
            
            x = 0.5400 * __W + __X;
            y = 0.2400 * __H + __Y;
            w = 0.2500 * __W;
            h = 0.5300 * __H;
            style = ST_LEFT + ST_MULTI;
            colorBackground[] = {0, 0, 0, 0.3};
        };
    };
};
