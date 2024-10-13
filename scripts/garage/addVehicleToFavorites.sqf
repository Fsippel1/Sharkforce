params ["_control", "_lbSelIndex"];

if (_lbSelIndex == -1) exitWith { hint "Selected Index is null" };

_key = player getVariable["Current_Garage", ""];
_favoriteVehicles = player getVariable["FAV_Vehicles", []];
_selFilterIndex = lbCurSel 1500;
_params = [_key, nil, _favoriteVehicles];

if (_selFilterIndex != -1) then {
	_filters = getArray(missionConfigFile >> "CfgGarage" >> "filter");
	_filter = _filters select _selFilterIndex;
	_params = [_key, _filter, _favoriteVehicles];
};

_fnc_getStoredVehicles = compile preprocessFile "functions\fnc_getStoredVehicles.sqf";
_items = _params call _fnc_getStoredVehicles;

_favoriteVehicle = _items select _lbSelIndex;

if (!((_favoriteVehicle select 0) in _favoriteVehicles)) then {
	_favoriteVehicles append [(_favoriteVehicle select 0)];
	player setVariable["FAV_Vehicles", _favoriteVehicles, true];
} else {
	player setVariable["FAV_Vehicles", _favoriteVehicles select {_x != (_favoriteVehicle select 0)}, true];
};

_favoriteVehicles = player getVariable["FAV_Vehicles", []];
[501, 1501, _key, _favoriteVehicles] execVM "scripts\garage\fillVehicleListBox.sqf";