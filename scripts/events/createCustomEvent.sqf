params ["_namespace", "_name", "_code"];

if (isServer) then {
	if (isNil "_namespace") exitWith { hint "Namespace is nil" };
	if (isNil "_name") exitWith { hint "Eventname is nil" };
	if (isNil "_code") exitWith { hint "Code is nil" };

	[_namespace, _name, _code] call BIS_fnc_addScriptedEventHandler;

	_type = getText(missionConfigFile >> "CfgCustomEvents" >> _name >> "type");
	_global = getText(missionConfigFile >> "CfgCustomEvents" >> _name >> "global");
	_condition = getText(missionConfigFile >> "CfgCustomEvents" >> _name >> "condition");
	_onActivation = getText(missionConfigFile >> "CfgCustomEvents" >> _name >> "onActivation");
	_onDeactivation = getText(missionConfigFile >> "CfgCustomEvents" >> _name >> "onDeactivation");
	_activatedBy = getText(missionConfigFile >> "CfgCustomEvents" >> _name >> "activatedBy");
	_activationType = getText(missionConfigFile >> "CfgCustomEvents" >> _name >> "activationType");
	_repeatable = getText(missionConfigFile >> "CfgCustomEvents" >> _name >> "repeatable");
	_interval = getNumber(missionConfigFile >> "CfgCustomEvents" >> _name >> "interval");

	//TODO trigger wird nicht richtig erstellt event kann getriggert werden
	_trg = createTrigger [_type, [0,0,0], _global == "true"];
	_trg setTriggerArea [0, 0, 0, false, -1];
	_trg setTriggerActivation [_activatedBy, _activationType, _repeatable == "true"];
	_trg setTriggerStatements [_condition, _onActivation, _onDeactivation];
	_trg setTriggerInterval _interval;
};