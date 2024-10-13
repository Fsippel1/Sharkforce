params ["_control", "_lbSelIndex"];

_key = player getVariable["Current_Garage", ""];
_favorites = player getVariable["FAV_Vehicles", []];

[501, 1501, _key, _favorites] execVM "scripts\garage\fillVehicleListBox.sqf";