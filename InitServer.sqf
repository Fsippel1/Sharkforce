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

// Frontline
[
	[
		[[10438.196, -138.588], [10400, 100], 0]
	],
	"A3_Front_Line_Markers_South_Names"
] execVM "scripts\frontLine\drawFrontline.sqf";
[
	[
		[[15308.405, 15050.29], [5385.602, 100], 270],
		[[16579.213, 8586.557], [1746.271, 100], 41.061],
		[[19276.57, 7466.03], [1442.91, 100], 0]
	],
	"A3_Front_Line_Markers_East_Names"
] execVM "scripts\frontLine\drawFrontline.sqf";

// Create Initial Sectors
_sectors = getArray(missionConfigFile >> "CfgSectors" >> "initialSectors");
{
	[_x] execVM "scripts\sectors\createSector.sqf";
} forEach _sectors;