params ["_key", "_filter", "_favorites"];

_filteredItems = [];
_items = missionNamespace getVariable [_key, []];
_limits = getArray(missionConfigFile >> "CfgGarage" >> _key >>"limits");

_boatCount = 0;
_heliCount = 0;
_landCount = 0;
_planeCount = 0;
_turretCount = 0;

if (isNil "_favorites") then {
	_favorites = [];
};

{
	_item = _x;
	_variants = getArray(missionConfigFile >> "CfgGarage" >> "CfgGarageVehicles" >> (_x select 0) >> "variants");

	// Set Filtered Items
	if (_variants findIf {
		(_x select 3) == (_filter select 1) 
		|| (_x select 4) == (_filter select 1) 
		|| ((_filter select 1) == "FAV" && (_item select 0) in _favorites) 
	} != -1 || isNil "_filter") then {
		_filteredItems pushBack _item;
	};

	// Count Vehicle Types
	_variant = _variants select 0;
	switch (_variant select 3) do {
		case "BOAT": { 
			_boatCount = _boatCount + 1;
		};
		case "TURRET": { 
			_turretCount = _turretCount + 1;
		};
		case "HELI": { 
			_heliCount = _heliCount + 1;
		};
		case "PLANE": { 
			_planeCount = _planeCount + 1;
		};
		default { 
			_landCount = _landCount + 1;
		};
	};
} forEach _items;

// Set Garage Limits
ctrlSetText [1000, format["%1 / %2", _planeCount, (((_limits select { (_x select 0) == "PLANE" }) select 0) select 2)]];
ctrlSetText [1001, format["%1 / %2", _heliCount, (((_limits select { (_x select 0) == "HELI" }) select 0) select 2)]];
ctrlSetText [1002, format["%1 / %2", _landCount, (((_limits select { (_x select 0) == "CAR" }) select 0) select 2)]];
ctrlSetText [1003, format["%1 / %2", _boatCount, (((_limits select { (_x select 0) == "BOAT" }) select 0) select 2)]];
ctrlSetText [1004, format["%1 / %2", _turretCount, (((_limits select { (_x select 0) == "TURRET" }) select 0) select 2)]];

_filteredItems