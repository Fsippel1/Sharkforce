params ["_group"];

//TODO Testen
if (isServer) then {
	if (isNil "_group") exitWith { hint "Group is nil" };
	/*_group addEventHandler ["EnemyDetected", {
		params ["_group", "_newTarget"];

		_side = side (units _group select 0);
		if (_side getFriend west < 0.6) exitWith {
			_group removeEventHandler _thisEventHandler;
		};
        
		hint "Enemy Detected";
		_side setFriend [west, (_side getFriend west) - 0.1];
    }];*/
	_group addEventHandler ["KnowsAboutChanged", {
		params ["_group", "_targetUnit", "_newKnowsAbout", "_oldKnowsAbout"];

		if (side _targetUnit != west) exitWith { hint format["TargetUnit %1 has wrong side!", name _targetUnit] };
		if (_side getFriend west < 0.6) exitWith { _group removeEventHandler _thisEventHandler; hint "removed eventhandler"; };
		if (_newKnowsAbout < 1.5) exitWith {
			hint format["TargetUnit %1 was not spotted! %2, %3", name _targetUnit, _oldKnowsAbout, east getFriend west];
		};
		
		_side = side (units _group select 0);
		_side setFriend [west, (_side getFriend west) - 0.1];
		hint format["TargetUnit %1 was spotted! %2", name _targetUnit, (_side getFriend west)];
	}];

	{
		_x addEventHandler ["Hit", {
			params ["_unit", "_source", "_damage", "_instigator"];

			if ((side _unit) getFriend (side _instigator) < 0.6 || (side _instigator) getFriend (side _unit) < 0.6) exitWith { _unit removeEventHandler ["Hit", _thisEventHandler]; };
			if (!alive _unit) exitWith { hint format["Unit %1 is dead",name _unit] };
			if (side _instigator == east) exitWith { hint format["%1, %2", side _instigator, side _unit]; };
			
			_hitCount = _unit getVariable["hitCount", 1];
			_unit setVariable["hitCount", _hitCount + 1, true];	

			if (_hitCount < 3) exitWith { hint format["Unit %1 was hit %2", name _unit, _hitCount]; };

			(side _unit) setFriend [(side _instigator), 0.5];
			_unit removeEventHandler ["Hit", _thisEventHandler];
		}];
		/*_x addEventHandler ["Suppressed", {
			params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];
            
			_side = side _unit;
			if (alive _unit || _side getFriend west >= 0.6) then {
				hint "Suppressed";
				_side setFriend [west, 0.5];
            };
			hint "test3";
			_unit removeEventHandler _thisEventHandler;
        }];*/
	} forEach units _group;
};