#include "script_macros.hpp"

params ["_newUnit", "_oldUnit", "_respawnType", "_respawnDelay"];

[getPosASL respawn, 10, [_newUnit]] call EFUNC(common,distributeCircle);
