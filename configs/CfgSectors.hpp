class CfgSectors {
	initialSectors[] = {
		"CfgSouthSea",
		"CfgBolshevikIsle",
		"CfgYermolovaIsle",
		"CfgVeteranIsle"
	};
	westOwnedSectors[] = {
		"CfgSouthSea" //sectorClassName
	};
	eastOwnedSectors[] = {
		"CfgBolshevikIsle",
		"CfgYermolovaIsle",
		"CfgVeteranIsle",
		"CfgSonaIsle"
	};
	independentOwnedSectors[] = {};

	class CfgSouthSea {
		garages[] = {
			"CfgAircraftCarrier"
		};
	};
	class CfgBolshevikIsle {
		displayName = "Bolshevik Isle";
		sectorName = "BolshevikIsle";
		markerName = "sectorBolshevikIsle";
	};
	class CfgYermolovaIsle {
		displayName = "Yermolova Isle";
		sectorName = "YermolovaIsle";
		markerName = "sectorYermolovaIsle";
	};
	class CfgVeteranIsle {
		displayName = "Veteran Isle";
		sectorName = "VeteranIsle";
		markerName = "sectorVeteranIsle";
	};
	class CfgSonaIsle {
		displayName = "Sona Isle";
		sectorName = "SonaIsle";
		markerName = "sectorSonaIsle";
	};
};