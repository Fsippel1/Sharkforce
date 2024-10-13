params ["_key", "_item"];

if (isNil "_key" || isNil "_item") exitWith { false };

_garage = missionNamespace getVariable[_key, []];

if (count _garage < 1) exitWith { false };

_index = _garage find _item;
if (_index == -1) exitWith { false }; 
_garage deleteAt _index;

missionNamespace setVariable[_key, _garage, true];

true