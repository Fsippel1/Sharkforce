params["_className"];

if (isServer) then {
	// Create Sector Garages
	_garages = getArray(missionConfigFile >> "CfgSectors" >> _className >> "garages");
	{
		[_x] execVM "scripts\garage\spawnGarage.sqf";
	} forEach _garages;
};