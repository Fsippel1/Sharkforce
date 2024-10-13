class CfgCustomEvents {
	/*example
	class ExampleEvent {
		type = "EmptyDetector";
		global = "true";
		condition = "this"; //condition expression
		onActivation = "[missionNamespace, 'ExampleEvent', []] call BIS_fnc_callScriptedEventHandler;"; //expression execute on activation
		onDeactivation = ""; //expression execute on deactivation default ""
		activatedBy = "NONE"; //activated by default NONE
		activationType = "PRESENT"; //activation type default PRESENT
		repeatable = "false"; //event is repeatable default false
		interval = 0.5; //cooldown in seconds default 0.5
	};
	*/

	class BlueforDeclaredWarOnRedfor {
		type = "EmptyDetector";
		global = "false";
		condition = "west getFriend east < 0.6 && east getFriend west >= 0.6";
		onActivation = "hint 'event'; [missionNamespace, 'BlueforDeclaredWarOnRedfor', []] call BIS_fnc_callScriptedEventHandler;";
		onDeactivation = "";
		activatedBy = "NONE";
		activationType = "PRESENT";
		repeatable = "false";
		interval = 0.5;
	};
	class RedforDeclaredWarOnBluefor {
		type = "EmptyDetector";
		global = "false";
		condition = "east getFriend west < 0.6 && west getFriend east >= 0.6";
		onActivation = "hint 'event'; [missionNamespace, 'RedforDeclaredWarOnBluefor', []] call BIS_fnc_callScriptedEventHandler;";
		onDeactivation = "";
		activatedBy = "NONE";
		activationType = "PRESENT";
		repeatable = "false";
		interval = 0.5;
	};
};