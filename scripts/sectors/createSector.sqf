params ["_className"];

if (isServer) then {
	if (isNil "_className") exitWith { hint "Sector className is nil!" };
	if (_className == "") exitWith { hint "Sector className is empty!" };

	_westOwnedSectors = getArray(missionConfigFile >> "CfgSectors" >> "westOwnedSectors");
	
	if ((_westOwnedSectors find _className) != -1) then {
		[_className] execVM "scripts\sectors\createOwnSector.sqf";
	} else {
		_eastOwnedSectors = getArray(missionConfigFile >> "CfgSectors" >> "eastOwnedSectors");
		_independentOwnedSectors = getArray(missionConfigFile >> "CfgSectors" >> "independentOwnedSectors");
		_isEastSector = if ((_eastOwnedSectors find _className) != -1) then { true } else { false };
		_isIndependentSector = if ((_independentOwnedSectors find _className) != -1) then { true } else { false };

		if (!_isEastSector && !_isIndependentSector) exitWith { hint format ["Sector %1is not assigned"] };

		[_className, _isEastSector] execVM "scripts\sectors\createHostileSector.sqf";
	};
};