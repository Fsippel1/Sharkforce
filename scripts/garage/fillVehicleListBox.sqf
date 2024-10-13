params ["_idd", "_idc", "_key", "_favorites"];

_control = (findDisplay _idd) displayCtrl _idc;
_selFilterIndex = lbCurSel 1500;
_params = [_key, nil, _favorites];

if (_selFilterIndex != -1) then {
	_filters = getArray(missionConfigFile >> "CfgGarage" >> "filter");
	_filter = _filters select _selFilterIndex;
	_params = [_key, _filter, _favorites];
};

_fnc_getStoredVehicles = compile preprocessFile "functions\fnc_getStoredVehicles.sqf";
_filteredItems = _params call _fnc_getStoredVehicles;

lbClear _idc;
{
	_icon = if ((_x select 0) in _favorites) then { "assets\pictures\fav.paa" } else { "assets\pictures\default.paa" };
	_control lbAdd getText(missionConfigFile >> "CfgGarage" >> "CfgGarageVehicles" >> (_x select 0) >> "displayName");
	_control lbSetPicture [_forEachIndex, _icon];
	_control lbSetPictureColor [_forEachIndex, 	[245, 0, 43, 0.8]];
} forEach _filteredItems;