params ["_key", "_item"];

if (isNil "_key" || isNil "_item") exitWith { false };

_garage = missionNamespace getVariable[_key, false];

if (count _garage < 1) exitWith {
	false
};

_garage append [_item];
missionNamespace setVariable[_key, _garage, true];

true