player enableStamina false;
player enableFatigue false;

//TODO umbauen auf custom event
onEachFrame { 
	switch (cursorTarget) do {
		case ar1;
		case aa1;
		case aa2;
		case aa3: {
			carrier setVariable["A3_Add_Objective_Alpha_Destroy_Aa", true, true];
			_type = if (cursorTarget == ar1) then { "o_uav" } else { "o_antiair" };
			_marker = createMarker [name cursorTarget, position cursorTarget, 1, player];
			_marker setMarkerType _type;
		};
		default { };
	};
};