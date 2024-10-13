//Make friendly CSAT, Resistance and NATO
west setFriend [resistance, 1];
resistance setFriend [west, 1];
west setFriend [east, 1];
east setFriend [west, 1];
east setFriend [resistance, 1];
resistance setFriend [east, 1];

// Add Eventhandlers
{
	[_x] execVM "scripts\events\addGroupEventHandlers.sqf";
} forEach (allGroups select { side (units _x select 0) == east });

// Add CustomEventHandler
[
	missionNamespace,
	"BlueforDeclaredWarOnRedfor",
	{
		["WarDeclaration", ["Die NATO", "Russland"]] call BIS_fnc_showNotification;
		east setFriend [west, 0.5];
		[missionNamespace, "BlueforDeclaredWarOnRedfor", _thisScriptedEventHandler ] call BIS_fnc_removeScriptedEventHandler;
	}
] execVM "scripts\events\createCustomEvent.sqf";
[
	missionNamespace,
	"RedforDeclaredWarOnBluefor",
	{
		["WarDeclaration", ["Russland", "der NATO"]] call BIS_fnc_showNotification;
		west setFriend [east, 0.5];
		[missionNamespace, "RedforDeclaredWarOnBluefor", _thisScriptedEventHandler ] call BIS_fnc_removeScriptedEventHandler;
	}
] execVM "scripts\events\createCustomEvent.sqf";

// Create Initial Sectors
_sectors = getArray(missionConfigFile >> "CfgSectors" >> "initialSectors");
{
	[_x] execVM "scripts\sectors\createSector.sqf";
} forEach _sectors;