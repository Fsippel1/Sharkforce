params["_className", "_isEastSector"];

if (isServer) then {
	_displayName = getText(missionConfigFile >> "CfgSectors" >> _className >> "displayName");
	_sectorName = getText(missionConfigFile >> "CfgSectors" >> _className >> "sectorName");
	_markerName = getText(missionConfigFile >> "CfgSectors" >> _className >> "markerName");

	// Create Tasks
	[
		west, 
		format["capture%1", _sectorName], 
		["", format ["Capture %1", _displayName], ""],
		getMarkerPos _markerName,
		"CREATED",
		-1,
		false,
		"Attack",
		false
	] call BIS_fnc_taskCreate;
};