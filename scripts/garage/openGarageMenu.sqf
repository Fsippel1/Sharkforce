params ["_key"];

createDialog "CfgGarageMenu";

_filter = (findDisplay 501) displayCtrl 1500;
_parkableVehicles = (findDisplay 501) displayCtrl 2100;

player setVariable["Current_Garage", _key, true];
_favorites = player getVariable["FAV_Vehicles", []];

// Add Filters
_filters = getArray(missionConfigFile >> "CfgGarage" >> "filter");
lbClear 1500;
{
	_filter lbAdd (_x select 0);
} forEach _filters;

lbSetCurSel [1500, 0];
//[501, 1501, _key, _favorites] execVM "scripts\garage\fillVehicleListBox.sqf";

// Get Vehicles to store
_vehiclesToStore = [];
_foundVehicles = vehicles select { count (crew _x) == 0 && (_x distance2D player) <= 100 };
_vehicleClasses = "true" configClasses (missionConfigFile >> "CfgGarage" >> "CfgGarageVehicles");
lbClear 2100;
{
	_vehicle = _x;
	_index = _vehicleClasses findIf { 
		(getArray(_x >> "variants") findIf { (typeOf _vehicle) == _x select 1 }) != -1
	};

	if (_index != -1) then {
		_vehicleClass = _vehicleClasses select _index;
		_displayName = getText(_vehicleClass >> "displayName");
		_vehiclesToStore append [[_x, configName _vehicleClass]];
		_parkableVehicles lbAdd _displayName;
	};
} forEach _foundVehicles;

player setVariable["Garage_Nearby_Vehicles", _vehiclesToStore, true];