// Get Vehicles from Garage
_selFilterIndex = lbCurSel 1500;
_key = player getVariable["Current_Garage", ""];
_favorites = player getVariable["FAV_Vehicles", []];
_params = [_key, nil, _favorites];

if (_selFilterIndex != -1) then {
	_filters = getArray(missionConfigFile >> "CfgGarage" >> "filter");
	_filter = _filters select _selFilterIndex;
	_params = [_key, _filter, _favorites];
};

_fnc_getStoredVehicles = compile preprocessFile "functions\fnc_getStoredVehicles.sqf";
_items = _params call _fnc_getStoredVehicles;

// Select Vehicle Spawn Pos
//_favorites = player getVariable["FAV_Vehicles", []];
_item = _items select (lbCurSel 1501);
//_vehName = getText(missionConfigFile >> "CfgGarage" >> "CfgGarageVehicles" >> (_item select 0) >> "displayName");
_variants = getArray(missionConfigFile >> "CfgGarage" >> "CfgGarageVehicles" >> (_item select 0) >> "variants");
_variant = _variants select (lbCurSel 1502);
_type  = _variant select 3;
_faction = _variant select 4;
_spawns = getArray(missionConfigFile >> "CfgGarage" >> _key >> "vehicleSpawns");

_availableSpawns = _spawns select { 
	_faction in (_x select 0) && _type in (_x select 1)
};

if (count _availableSpawns <= 0) exitWith { hint "No Vehicle Spawn Pos found!" };

_spawnPos = _availableSpawns select 0; //TODO save spawn pos also on aircraft carrier

// Spawn Vehicle
_className = _variant select 1;
_textures = _variant select 2;

_vehicle = createVehicle [_className, (_spawnPos select 2), [], 0, "CAN_COLLIDE"];
_vehicle setDir (_spawnPos select 3);

{
	_vehicle setObjectTextureGlobal [_forEachIndex, _x];
} forEach _textures;

// Set Vehicle Privious State
_vehicle setFuel (_item select 1);
{
	_vehicle addMagazineTurret [_x select 0, _x select 1, _x select 2];
} forEach (_item select 2);

// Remove Vehicle from Garage
_fnc_removeVehicle = compile preprocessFile "functions\fnc_removeVehicle.sqf";
_items = [_key, _item] call _fnc_removeVehicle;

closeDialog 1;