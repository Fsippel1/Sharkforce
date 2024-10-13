//Make friendly CSAT, Resistance and NATO
west setFriend [resistance, 1];
resistance setFriend [west, 1];
west setFriend [east, 1];
east setFriend [west, 1];
east setFriend [resistance, 1];
resistance setFriend [east, 1];

// Create Initial Sectors
_sectors = getArray(missionConfigFile >> "CfgSectors" >> "ownedSectors");
{
	[_x] execVM "scripts\sectors\createSector.sqf";
} forEach _sectors;