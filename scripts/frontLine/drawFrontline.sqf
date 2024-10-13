params["_frontLineParts", "_key"];
//Example _frontLineParts: 		[[0,0,0], [1,1], 0]
//Explenation _frontLineParts:  [position, size, rotation]

//Base line South
/*[
	[[10438.196, -138.588], [10400, 100], 0]
]*/
//Base line East
/*[
	[[15308.405, 15050.29], [5385.602, 100], 270],
	[[16579.213, 8586.557], [1746.271, 100], 41.061],
	[[19276.57, 7466.03], [1442.91, 100], 0]
]*/
// Sektor Alpha eingenommen
/*[
	[[2372.109, 4379.71], [2312.087, 100], 0],
	[[6816.228, 2130.750], [3166.806, 100], 46.605],
	[[14879.955, -138.588], [5958.242, 100], 0]
]*/

//TODO frontline changes via custom events handeln
if (isServer) then {
	// Remove existing Frontline
	{
		deleteMarker (format["%1", _x]);
	} forEach (carrier getVariable[format["%1", _key], []]);

	// Create new Frontline
	_frontLineMarker = [];
	{
		_name = format["frontline_%1", _forEachIndex];
		_marker = createMarker [_name, _x select 0, 1, player];
		_marker setMarkerShape "RECTANGLE";
		_marker setMarkerBrush "FDiagonal";
		_marker setMarkerColor "ColorRed";
		_marker setMarkerSize (_x select 1);
		_marker setMarkerDir (_x select 2);
		_frontLineMarker append [_name];
	} forEach _frontLineParts;
	carrier setVariable[format["%1", _key], _frontLineMarker, true];
};