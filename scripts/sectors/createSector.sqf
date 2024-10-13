params ["_className"];

if (isServer) then {
	if (isNil "_className") exitWith { hint "Sector className is nil!" };
	if (_className == "") exitWith { hint "Sector className is empty!" };

	// Create Sector Garages
	_garages = getArray(missionConfigFile >> "CfgSectors" >> _className >> "garages");
	{
		[_x] execVM "scripts\garage\spawnGarage.sqf";
	} forEach _garages;
};