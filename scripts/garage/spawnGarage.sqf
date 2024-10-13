params ["_className"];

if (isServer) then {
	if (isNil "_className") exitWith { hint "Garage className is nil!" };
	if (_className == "") exitWith { hint "Garage className is empty!" };

	_unitClassName = getText(missionConfigFile >> "CfgGarage" >> _className >> "unitClassName");
	_pos = getArray(missionConfigFile >> "CfgGarage" >> _className >> "spawnPos");
	_dir = getNumber(missionConfigFile >> "CfgGarage" >> _className >> "spawnDir");
	_group = createGroup west;
	_garage = _group createUnit [_unitClassName, _pos, [], 0, "CAN_COLLIDE"];
	
	if (surfaceIsWater _pos) then {
		_garage setPosASL [_pos select 0, _pos select 1, 20.355];
	};

	_garage setDir _dir;
	_garage disableAI "PATH";
	_garage allowDamage false;
	_garage allowSprint false;
	
	garageClassName = _className;
	_vehicles = getArray(missionConfigFile >> "CfgGarage" >> garageClassName >> "storedVehicles");
	missionNamespace setVariable [garageClassName, _vehicles];
	publicVariable garageClassName;

	_garage addAction ["Garage", {
		params ["_target", "_caller", "_actionId", "_arguments"];

 		[garageClassName] execVM "scripts\garage\openGarageMenu.sqf" ; 
	}];
};