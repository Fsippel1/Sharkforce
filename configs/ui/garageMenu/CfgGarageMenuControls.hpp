class CfgGarageMenu {
	idd = 501;
	class controls {
		class garageBaseFrame: RscFrame
		{
			idc = 1800;
			x = 0.244063 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.465937 * safezoneW;
			h = 0.63 * safezoneH;
		};
		class garageBoatLimitPic: RscPicture
		{
			idc = 1200;
			text = "\a3\ui_f\data\igui\cfg\simpletasks\types\Boat_ca.paa";
			x = 0.486875 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageHeliLimitPic: RscPicture
		{
			idc = 1202;
			text = "\a3\ui_f\data\igui\cfg\simpletasks\types\Heli_ca.paa";
			x = 0.395 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garagePlaneLimitPic: RscPicture
		{
			idc = 1203;
			text = "\a3\ui_f\data\igui\cfg\simpletasks\types\Plane_ca.paa";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageCarLimitPic: RscPicture
		{
			idc = 1204;
			text = "\a3\ui_f\data\igui\cfg\simpletasks\types\truck_ca.paa";
			x = 0.57875 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garagePlaneLimitTxt: RscText
		{
			idc = 1000;
			text = "11 / 20"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageHeliLimitTxt: RscText
		{
			idc = 1001;
			text = "1 / 3"; //--- ToDo: Localize;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageCarLimitTxt: RscText
		{
			idc = 1002;
			text = "0 / 0"; //--- ToDo: Localize;
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageBoatLimitTxt: RscText
		{
			idc = 1003;
			text = "3 / 4"; //--- ToDo: Localize;
			x = 0.440937 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageFilter: RscListbox
		{
			idc = 1500;
			onLBSelChanged = "_this execVM 'scripts\garage\filterSelectionChanged.sqf'";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.532 * safezoneH;
		};
		class garageVehicles: RscListbox
		{
			idc = 1501;
			onLBSelChanged = "_this execVM 'scripts\garage\vehicleSelectionChanged.sqf'";
			onLBDblClick = "_this execVM 'scripts\garage\addVehicleToFavorites.sqf'";
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.532 * safezoneH;
		};
		class garageParkableVehicleSelection: RscCombo
		{
			idc = 2100;
			x = 0.52625 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageParkinBtn: RscButton
		{
			idc = 1600;
			action = "execVM 'scripts\garage\storeVehicle.sqf'";
			//action = "hint'neh duf'";
			text = "Einparken"; //--- ToDo: Localize;
			x = 0.52625 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageParkoutBtn: RscButton
		{
			idc = 1601;
			action = "execVM 'scripts\garage\parkOutVehicle.sqf'";
			text = "Ausparken"; //--- ToDo: Localize;
			x = 0.52625 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageCancelBtn: RscButton
		{
			idc = 1602;
			action = "closeDialog 1;";
			text = "Abbrechen"; //--- ToDo: Localize;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageVehicleOptions: RscListbox
		{
			idc = 1502;
			x = 0.52625 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.322 * safezoneH;
		};
		class garageTurretLimitPic: RscPicture
		{
			idc = 1201;
			text = "\a3\ui_f\data\igui\cfg\simpletasks\types\rifle_ca.paa";
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class garageTurretLimitTxt: RscText
		{
			idc = 1004;
			text = "1 / 10"; //--- ToDo: Localize;
			x = 0.624687 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.042 * safezoneH;
		};
	};
};
