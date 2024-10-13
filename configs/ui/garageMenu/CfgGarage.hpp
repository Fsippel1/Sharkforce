class CfgGarage {
	filter[] = {
		{ "Favoriten", "FAV" }, // displayName, classname 
		{ "Flugzeuge", "PLANE" },
		{ "Helikopter", "HELI" },
		{ "Boote", "BOAT" },
		{ "Panzer", "TANK" },
		{ "Infantery Fighting Vehicle", "IFV" },
		{ "Armoured Personnel Carrier", "APC" },
		{ "Armored Car", "AC" },
		{ "Anti-Air", "AA" },
		{ "Artillery", "ARTY" },
		{ "Military Engineering Vehicle", "MEV" },
		{ "Geschütze", "TURRET" }
	};
	class CfgGarageVehicles {
		class LandRover110 {
			displayName = "Land Rover 110";
			variants[] = {
				{ 
					"Transport - Wüstentarn", // displayName
					"CUP_B_LR_Transport_GB_D", // classname
					{}, // designArray (GM)
					"AC", // type
					"GB", // faction
					0, // isUAV 0 = false, 1 = true
					1 // shownInDialog 0 = false, 1 = true
				},
				{ 
					"Transport - Waldtarn",
					"CUP_B_LR_Transport_GB_W",
					{},
					"AC",
					"GB",
					0,
					1
				},
				{ 
					"Sanitäter - Wüstentarn",
					"CUP_B_LR_Ambulance_GB_D",
					{},
					"AC",
					"GB",
					0,
					1
				},
				{
					"Sanitäter - Waldtarn",
					"CUP_B_LR_Ambulance_GB_W",
					{},
					"AC",
					"GB",
					0,
					1
				},
				{
					"HMG Standard - Wüstentarn",
					"CUP_B_LR_MG_GB_D",
					{},
					"AC",
					"GB",
					0,
					1
				},
				{
					"HMG Standard - Waldtarn",
					"CUP_B_LR_MG_GB_W",
					{},
					"AC",
					"GB",
					0,
					1
				},
				{
					"HMG Custom - Wüstentarn",
					"CUP_B_LR_Special_M2_GB_D",
					{},
					"AC",
					"GB",
					0,
					1
				},
				{ 
					"HMG Custom - Waldtarn",
					"CUP_B_LR_Special_M2_GB_W",
					{},
					"AC",
					"GB",
					0,
					1
				},
				{
					"GMG Custom - Wüstentarn",
					"CUP_B_LR_Special_GMG_GB_D",
					{},
					"AC",
					"GB",
					0,
					1
				},
				{
					"GMG Custom - Waldtarn", 
					"CUP_B_LR_Special_GMG_GB_W",
					{},
					"AC",
					"GB",
					0,
					1
				}
			};
		};
		class FA181 {
			displayName = "F/A-181 Black Wasp II";
			variants[] = {
				{ 
					"Standard", 
					"B_Plane_Fighter_01_F",
					{},
					"PLANE",
					"US",
					0,
					1
				},
				{
					"Stealth",
					"B_Plane_Fighter_01_Stealth_F",
					{},
					"PLANE",
					"US",
					0,
					1
				}
			};
		};
		class F35B {
			displayName = "F-35B Lightning II";
			variants[] = {
				{ 
					"Standard", 
					"CUP_B_F35B_BAF",
					{},
					"PLANE",
					"GB",
					0,
					1
				},
				{
					"Stealth",
					"CUP_B_F35B_Stealth_BAF",
					{},
					"PLANE",
					"GB",
					0,
					1
				},
				{
					"Standard",
					"CUP_B_F35B_USMC",
					{},
					"PLANE",
					"US",
					0,
					1
				},
				{ 
					"Stealth",
					"CUP_B_F35B_Stealth_USMC",
					{},
					"PLANE",
					"US",
					0,
					1
				}
			};
		};
	};
	class CfgAircraftCarrier {
		unitClassName = "B_Deck_Crew_F";
		spawnPos[] = { 10581.492, -1563.401, 20.355 };
		spawnDir = 50.320;
		vehicleSpawns[] = {
			{
				{ "US", "GB", "GER", "RU" }, // faction
				{ "HELI" }, // types
				{ 10614.651, -1560.628, 47.423 }, // position
				0 // direction
			},
			{
				{ "US", "GB", "GER", "RU" },
				{ "PLANE" },
				{ 10495.559, -1534.046, 47.4 }, 
				91.991
			},
			{
				{ "US", "GB", "GER", "RU" },
				{ "BOAT" },
				{ 10533.384, -1582.696, 30 }, 
				91.188
			},
			{
				{ "US", "GB", "GER", "RU" },
				{ "TANK", "IFV", "APC", "AC", "AA", "ARTY", "MEV", "TURRET" },
				{ 0, 0, 0 },
				0
			}
		};
		limits[] = {
			{
				"HELI",
				{ "HELI" }, // types
				12 // max count
			},
			{
				"PLANE",
				{ "PLANE" },
				32
			},
			{
				"BOAT",
				{ "BOAT" },
				6
			},
			{
				"CAR",
				{ "TANK", "IFV", "APC", "AC", "AA", "ARTY", "MEV" },
				24
			},
			{
				"TURRET",
				{ "TURRET" },
				10
			}
		};
		storedVehicles[] = {
			//PLANE
			{
				"FA181",
				1,
				{}
			},
			{
				"FA181",
				1,
				{}
			},
			{
				"FA181",
				1, // fuel
				{} // ammo
			},
			{
				"FA181",
				1,
				{}
			},
			{
				"FA181",
				1,
				{}
			},
			{
				"FA181",
				1,
				{}
			}
			//HELI
			//BOAT
			//AC
			//APC
			//IFV
			//TANK
			//AA
			//ARTY
			//MEV
			//TURRET
		};
	}
};