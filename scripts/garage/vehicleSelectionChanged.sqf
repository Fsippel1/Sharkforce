params ["_control", "_lbCurSel"];

if (isNil "_lbCurSel") exitWith { hint "Selected Index is Null" };

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

if (count _items == 0) exitWith { hint "No Items found" };
hint format["%1 | %2", count _items, _lbCurSel];
/*
if (!isNil "_items") then {
	_item = _items select _lbCurSel;
	_variants = getArray(missionConfigFile >> "CfgGarage" >> "CfgGarageVehicles" >> (_item select 0) >>  "variants");

	_vehicleOptionLb = (findDisplay 501) displayCtrl 1502;
	lbClear 1502;
	{
		_vehicleOptionLb lbAdd (_x select 0);
	} forEach _variants;

	_vehicleOptionLb lbSetCurSel 0;
};*/
