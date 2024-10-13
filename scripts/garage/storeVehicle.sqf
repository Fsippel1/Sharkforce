hint "test";
// Get Selected Vehicle
_index = lbCurSel 2100;

if (_index == -1) exitWith { hint "Selected Index is null" };

_storableVehicles = player getVariable["Garage_Nearby_Vehicles", []];
_item = _storableVehicles select _index;

//_index = vehicles findIf { typeOf _x == (_item select 0) }; //TODO prüfen ob dies immer das richtige fahrzeug findet

//if (_index == -1) exitWith { hint "Selected Index is null 2" };

//_vehicle = vehicles select _index;
_vehicle = _item select 0;

// Check if vehicle fulfilles Conditions
if (count (crew _vehicle) > 0) exitWith { hint "Selected Vehicle is not empty!" };
if (_vehicle distance2D player > 100) exitWith { hint "Selected Vehicle is more then 100m away!" };

// Add Vehicle to Garage
_key = player getVariable["Current_Garage", ""];
_fnc_storeVehicle = compile preprocessFile "functions\fnc_storeVehicle.sqf";
_result = [_key, [_item select 1, fuel _vehicle, magazinesAllTurrets _vehicle]] call _fnc_storeVehicle;

// remove vehicle from game
deleteVehicle _vehicle;

// remove vehicle from storable vehicle List
_storableVehicles deleteAt _index;
player setVariable["Garage_Nearby_Vehicles", _storableVehicles, true];

if (!_result) exitWith { hint "Could not store selected Vehicle!" };

//Refresh Listboxes
_garageVehicles = (findDisplay 501) displayCtrl 1501;
_vehicleOptionLb = (findDisplay 501) displayCtrl 1502;
_parkableVehicles = (findDisplay 501) displayCtrl 2100;

lbClear 1501;
lbClear 1502;
lbClear 2100;

_garageVehicles lbSetCurSel -1;
_parkableVehicles lbSetCurSel -1;
_vehicleOptionLb lbSetCurSel -1;

_favorites = player getVariable["FAV_Vehicles", []];
[501, 1501, _key, _favorites] execVM "scripts\garage\fillVehicleListBox.sqf";

{
	_displayName = getText(missionConfigFile >> "CfgGarage" >> "CfgGarageVehicles" >> (_x select 1) >>  "displayName");
	_garageVehicles lbAdd _displayName;
} forEach _storableVehicles;