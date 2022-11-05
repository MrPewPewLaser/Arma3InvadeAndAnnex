/*
 * Author: Whigital
 *
 * Customizes Opfor vehicle appearance based on classname
 *
 */

params [["_vehicle", objNull]];

if (isNull _vehicle) exitWith {};

private _qilinSkins = ["Arid", "GreenHex"];
private _csatSkins = ["Hex", "GreenHex"];

private _offroadSkins = [
    "Guerilla_03", "Guerilla_06",
    "Guerilla_11", "Guerilla_12"
];

private _aafSkins = ["Indep_01", "Indep_02", "Indep_03"];
private _gorgonSkins = ["Indep", "Indep_02", "Indep_03"];

private _buzzardTextures = [
    ["A3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_1_INDP_co.paa", "A3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_2_INDP_co.paa"],
    ["A3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_1_brownhex_CO.paa", "A3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_2_brownhex_CO.paa"]
];

private _shikraSkins = [
    "CamoAridHex",
    "CamoBlue"
];

private _orcaTextures = [
    "A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_CO.paa",
    "A3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
];

private _xianSkins = [
    "Hex",
    "GreenHex"
];


_totalRandomization = {
    params [
        "_aircraft",
        ["_owner", []]
    ];

    private _allPylons = ("true" configClasses (configFile >> "CfgVehicles" >> (typeOf _aircraft) >> "Components" >> "TransportPylonsComponent" >> "pylons") apply {configName _x});
    private _pylonsArray = [];

    {
        private _magazine = (selectRandom (_aircraft getCompatiblePylonMagazines _x));

        _pylonsArray pushBack [_x, _magazine, _owner];
    } forEach _allPylons;

    [_aircraft, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _aircraft];
};


switch (typeOf _vehicle) do {
    // To-199 Neophron (CAS)
    case "O_Plane_CAS_02_dynamicLoadout_F": {
        private _pylons2 = [
            "PylonMissile_1Rnd_LG_scalpel", 3,
            "PylonRack_1Rnd_Missile_AGM_01_F", 3,
            "PylonRack_3Rnd_LG_scalpel", 2,
            "PylonRack_4Rnd_LG_scalpel", 1
        ];

        private _pylons3 = [
            "PylonMissile_1Rnd_LG_scalpel", 2,
            "PylonRack_20Rnd_Rocket_03_HE_F", 3,
            "PylonRack_20Rnd_Rocket_03_AP_F", 3,
            "PylonRack_19Rnd_Rocket_Skyfire", 3,
            "PylonRack_1Rnd_Missile_AGM_01_F", 2
        ];

        private _pylons4 = [
            "PylonMissile_1Rnd_LG_scalpel", 2,
            "PylonRack_20Rnd_Rocket_03_HE_F", 3,
            "PylonRack_20Rnd_Rocket_03_AP_F", 3,
            "PylonRack_19Rnd_Rocket_Skyfire", 3,
            "PylonRack_1Rnd_Missile_AGM_01_F", 2
        ];

        private _pylons5 = [
            "PylonRack_1Rnd_Missile_AGM_01_F", 1,
            "PylonMissile_1Rnd_Bomb_03_F", 3,
            "PylonMissile_1Rnd_BombCluster_02_cap_F", 2
        ];

        private _pylonsArray = [];

        _pylonsArray pushback ["Pylons1", "PylonRack_1Rnd_Missile_AA_03_F"];
        _pylonsArray pushback ["Pylons10", "PylonRack_1Rnd_Missile_AA_03_F"];

        private _pylonMag = (selectRandomWeighted _pylons2);
        _pylonsArray pushback ["Pylons2", _pylonMag];
        _pylonsArray pushback ["Pylons9", _pylonMag];

        _pylonMag = (selectRandomWeighted _pylons3);
        _pylonsArray pushback ["Pylons3", _pylonMag];
        _pylonsArray pushback ["Pylons8", _pylonMag];

        _pylonMag = (selectRandomWeighted _pylons4);
        _pylonsArray pushback ["Pylons4", _pylonMag];
        _pylonsArray pushback ["Pylons7", _pylonMag];

        _pylonMag = (selectRandomWeighted _pylons5);
        _pylonsArray pushback ["Pylons5", _pylonMag];
        _pylonsArray pushback ["Pylons6", _pylonMag];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };

    // To-201 Shikra
    case "O_Plane_Fighter_02_F": {
        [
            _vehicle,
            [(selectRandom _shikraSkins), 1],
            true
        ] call BIS_fnc_initVehicle;

        _vehicle removeMagazineGlobal "240Rnd_CMFlare_Chaff_Magazine";
        _vehicle addMagazine "120Rnd_CMFlare_Chaff_Magazine";

        private _pylonsArray = [];

        _pylonsArray pushBack ["pylons1", "PylonMissile_Missile_AA_R73_x1"];
        _pylonsArray pushBack ["pylons2", "PylonMissile_Missile_AA_R73_x1"];

        private _pylonsMags = [
            "PylonMissile_Missile_AGM_KH25_x1", 2,
            "PylonMissile_Bomb_KAB250_x1", 1,
            "PylonMissile_1Rnd_BombCluster_02_cap_F", 1
        ];

        private _pylonMag = (selectRandomWeighted _pylonsMags);
        _pylonsArray pushBack ["pylons3", _pylonMag];
        _pylonsArray pushBack ["pylons4", _pylonMag];

        _pylonsMags = [
            "PylonMissile_Bomb_KAB250_x1", 2,
            "PylonMissile_1Rnd_BombCluster_02_cap_F", 1,
            "PylonMissile_Missile_KH58_x1", 3
        ];

        _pylonMag = (selectRandomWeighted _pylonsMags);
        _pylonsArray pushBack ["pylons5", _pylonMag];
        _pylonsArray pushBack ["pylons6", _pylonMag];

        {
            _pylonsArray pushBack [_x, ""];
        } forEach [
            "pylonBayRight1",
            "pylonBayLeft1",
            "pylonBayRight2",
            "pylonBayLeft2",
            "pylonBayCenter1",
            "pylonBayCenter2"
        ];

        _pylonsMags = [
            "PylonMissile_Missile_AGM_KH25_INT_x1", 1,
            "PylonMissile_Bomb_KAB250_x1", 2,
            "PylonMissile_1Rnd_BombCluster_02_cap_F", 2
        ];

        _pylonMag = (selectRandomWeighted _pylonsMags);
        _pylonsArray pushBack ["pylonBayCenter3", _pylonMag];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };

    // To-201 Shikra (Stealth)
    case "O_Plane_Fighter_02_Stealth_F": {
        [
            _vehicle,
            [(selectRandom _shikraSkins), 1],
            true
        ] call BIS_fnc_initVehicle;

        _vehicle removeMagazineGlobal "240Rnd_CMFlare_Chaff_Magazine";
        _vehicle addMagazine "120Rnd_CMFlare_Chaff_Magazine";

        private _AtASR = "PylonMissile_Missile_AA_R73_x1";
        private _AtAMR = "PylonMissile_Missile_AA_R77_INT_x1";

        private _pylonsArray = [];

        _pylonsArray pushBack ["pylonBayRight1", _AtASR];
        _pylonsArray pushBack ["pylonBayLeft1", _AtASR];

        _pylonsArray pushBack ["pylonBayRight2", _AtAMR];
        _pylonsArray pushBack ["pylonBayLeft2", _AtAMR];

        _pylonsArray pushBack ["pylonBayCenter1", (selectRandom [_AtAMR, "", ""])];
        _pylonsArray pushBack ["pylonBayCenter2", (selectRandom [_AtAMR, "", ""])];
        _pylonsArray pushBack ["pylonBayCenter3", ""];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };

    // A-149 Gryphon
    case "I_Plane_Fighter_04_F": {
        _vehicle removeMagazineGlobal "240Rnd_CMFlare_Chaff_Magazine";
        _vehicle addMagazine "120Rnd_CMFlare_Chaff_Magazine";

        private _pylonsArray = [];

        _pylonsArray pushBack ["pylon1", "PylonMissile_Missile_BIM9X_x1"];
        _pylonsArray pushBack ["pylon2", "PylonMissile_Missile_BIM9X_x1"];

        _pylonsArray pushBack ["pylon3", "PylonRack_Missile_AGM_02_x1"];
        _pylonsArray pushBack ["Pylon4", "PylonRack_Missile_AGM_02_x1"];

        private _pylonMags = [
            "PylonRack_Missile_AGM_02_x2", 2,
            "PylonMissile_Bomb_GBU12_x1", 3,
            "PylonMissile_1Rnd_BombCluster_01_F", 1,
            "PylonMissile_1Rnd_BombCluster_03_F", 2
        ];

        private _pylonMag = (selectRandomWeighted _pylonMags);
        _pylonsArray pushBack ["pylon5", _pylonMag];
        _pylonsArray pushBack ["Pylon6", _pylonMag];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };

    // A-143 Buzzard (CAS)
    case "I_Plane_Fighter_03_dynamicLoadout_F": {
        private _camo = (selectRandom _buzzardTextures);

        {
            _vehicle setObjectTextureGlobal [_forEachIndex, _x];
        } forEach _camo;

        private _AtA = [
            "PylonRack_1Rnd_Missile_AA_04_F",
            "PylonRack_1Rnd_AAA_missiles",
            "PylonRack_1Rnd_GAA_missiles"
        ];

        private _middle = [
            "PylonRack_1Rnd_LG_scalpel",
            "PylonRack_3Rnd_LG_scalpel",
            "PylonRack_7Rnd_Rocket_04_HE_F",
            "PylonRack_7Rnd_Rocket_04_AP_F",
            "PylonRack_12Rnd_PG_missiles",
            "PylonRack_12Rnd_missiles"
        ];

        private _inner = [
            "PylonRack_1Rnd_Missile_AGM_02_F",
            "PylonMissile_1Rnd_Bomb_04_F",
            "PylonMissile_1Rnd_Mk82_F",
            "PylonMissile_1Rnd_BombCluster_01_F",
            "PylonMissile_1Rnd_BombCluster_03_F"
        ];

        private _pylonsArray = [];

        {
            _pylonsArray pushBack [_x, (selectRandom _AtA)];
        } forEach ["Pylons1", "Pylons7"];

        {
            _pylonsArray pushBack [_x, (selectRandom _middle)];
        } forEach ["Pylons2", "Pylons6"];

        {
            _pylonsArray pushBack [_x, (selectRandom (_middle + _inner))];
        } forEach ["Pylons3", "Pylons5"];

        _pylonsArray pushBack ["Pylons4", "PylonWeapon_300Rnd_20mm_shells"];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };

    // Mi-48 Kajman
    case "O_Heli_Attack_02_dynamicLoadout_F": {
        [_vehicle, [0]] call _totalRandomization;
    };

    // PO-30 Orca
    case "O_Heli_Light_02_dynamicLoadout_F": {
        _vehicle setObjectTextureGlobal [0, (selectRandom _orcaTextures)];

        [_vehicle] call _totalRandomization;
    };

    // Y-32 Xi'an (Infantry Transport)
    case "O_T_VTOL_02_infantry_dynamicLoadout_F": {
        [
            _vehicle,
            [(selectRandom _xianSkins), 1],
            true
        ] call BIS_fnc_initVehicle;

        [_vehicle, [0]] call _totalRandomization;
    };

    // WY-55 Hellcat
    case "I_Heli_light_03_dynamicLoadout_F": {
        [_vehicle] call _totalRandomization;
    };

    // Qilin (Minigun)
    case "O_LSV_02_armed_F": {
        [
            _vehicle,
            [(selectRandom _qilinSkins), 1],
            ["Unarmed_Doors_Hide", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // Ifrit HMG
    case "O_MRAP_02_hmg_F": {
        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            false
        ] call BIS_fnc_initVehicle;
    };

    // Ifrit GMG
    case "O_MRAP_02_gmg_F": {
        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            false
        ] call BIS_fnc_initVehicle;
    };

    // Offroad (HMG)
    case "O_G_Offroad_01_armed_F": {
        private _shield = (selectRandom [0, 1]);
        private _doors = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _offroadSkins), 1],
            ["Hide_Shield", _shield, "Hide_Rail", 1, "HideDoor1", _doors, "HideDoor2", _doors, "HideDoor3", 0, "HideBackpacks", 1, "HideBumper1", 0, "HideBumper2", 1, "HideConstruction", 0]
        ] call BIS_fnc_initVehicle;

        _vehicle forceFlagTexture "\A3\Data_F\Flags\flag_CSAT_CO.paa";
    };

    // Tempest Transport
    case "O_Truck_03_transport_F": {
        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            false
        ] call BIS_fnc_initVehicle;
    };

    // AWC 301 Nyx (AT)
    case "I_LT_01_AT_F": {
        private _camonet = (selectRandom [0, 1]);
        private _slat = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _aafSkins), 1],
            ["showTools", 0, "showCamonetHull", _camonet, "showBags", 0, "showSLATHull", _slat]
        ] call BIS_fnc_initVehicle;
    };

    // AWC 302 Nyx (AA)
    case "I_LT_01_AA_F": {
        private _camonet = (selectRandom [0, 1]);
        private _slat = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _aafSkins), 1],
            ["showTools", 0, "showCamonetHull", _camonet, "showBags", 0, "showSLATHull", _slat]
        ] call BIS_fnc_initVehicle;
    };

    // AWC 304 Nyx (Autocannon)
    case "I_LT_01_cannon_F": {
        private _camonet = (selectRandom [0, 1]);
        private _slat = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _aafSkins), 1],
            ["showTools", 0, "showCamonetHull", _camonet, "showBags", 0, "showSLATHull", _slat]
        ] call BIS_fnc_initVehicle;
    };

    // MSE-3 Marid
    case "O_APC_Wheeled_02_rcws_v2_F": {
        private _camonet = (selectRandom [0, 1]);
        private _slat = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            ["showBags", 0, "showCanisters", _camonet, "showTools", 0, "showCamonetHull", _camonet, "showSLATHull", _slat]
        ] call BIS_fnc_initVehicle;
    };

    // BTR-K Kamysh
    case "O_APC_Tracked_02_cannon_F": {
        private _camonet = (selectRandom [0, 1]);
        private _slat = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            ["showTracks", _camonet, "showCamonetHull", _camonet, "showBags", 0, "showSLATHull", _slat]
        ] call BIS_fnc_initVehicle;
    };

    // FV-720 Mora
    case "I_APC_tracked_03_cannon_F": {
        private _camoneth = (selectRandom [0, 1]);
        private _slath = (selectRandom [0, 1]);

        private _camonett = (selectRandom [0, 1]);
        private _slatt = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _aafSkins), 1],
            ["showBags", 0, "showBags2", _camoneth, "showCamonetHull", _camoneth, "showCamonetTurret", _camonett, "showTools", 0, "showSLATHull", _slath, "showSLATTurret", _slatt]
        ] call BIS_fnc_initVehicle;
    };

    // AFV-4 Gorgon
    case "I_APC_Wheeled_03_cannon_F": {
        private _camonet = (selectRandom [0, 1]);
        private _slat = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _gorgonSkins), 1],
            ["showCamonetHull", _camonet, "showBags", 0, "showBags2", 0, "showTools", 0, "showSLATHull", _slat]
        ] call BIS_fnc_initVehicle;
    };

    // ZSU-39 Tigris
    case "O_APC_Tracked_02_AA_F": {
        private _camoneth = (selectRandom [0, 1]);
        private _slat = (selectRandom [0, 1]);
        private _camonett = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            ["showTracks", _camoneth, "showCamonetHull", _camoneth, "showCamonetTurret", _camonett, "showSLATHull", _slat]
        ] call BIS_fnc_initVehicle;
    };

    // 2S9 Sochor
    case "O_MBT_02_arty_F": {
        private _camoneth = (selectRandom [0, 1]);
        private _camonett = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            ["showAmmobox", 1, "showCanisters", _camonett, "showCamonetTurret", _camonett, "showCamonetHull", _camoneth, "showLog", 0]
        ] call BIS_fnc_initVehicle;
    };

    // T-100 Varsuk
    case "O_MBT_02_cannon_F": {
        private _camoneth = (selectRandom [0, 1]);
        private _camonett = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            ["showCamonetHull", _camoneth, "showCamonetTurret", _camonett , "showLog", 0]
        ] call BIS_fnc_initVehicle;
    };

    // MBT-52 Kuma
    case "I_MBT_03_cannon_F": {
        private _camoneth = (selectRandom [0, 1]);
        private _hslath = (selectRandom [0, 1]);

        private _camonett = (selectRandom [0, 1]);
        private _hslatt = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _aafSkins), 1],
            ["HideTurret", _hslatt, "HideHull", _hslath, "showCamonetHull", _camoneth, "showCamonetTurret", _camonett]
        ] call BIS_fnc_initVehicle;
    };

    // T-140 Angara
    case "O_MBT_04_cannon_F": {
        private _camoneth = (selectRandom [0, 1]);
        private _camonett = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            ["showCamonetHull", _camoneth, "showCamonetTurret", _camonett]
        ] call BIS_fnc_initVehicle;
    };

    // T-140K Angara
    case "O_MBT_04_command_F": {
        private _camoneth = (selectRandom [0, 1]);
        private _camonett = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _csatSkins), 1],
            ["showCamonetHull", _camoneth, "showCamonetTurret", _camonett]
        ] call BIS_fnc_initVehicle;
    };
};


// Setup DataLink
if (local _vehicle) then {
    _vehicle call AW_fnc_vehicleDataLinkSettings;
} else {
    _vehicle remoteExec ["AW_fnc_vehicleDataLinkSettings", _vehicle];
};
