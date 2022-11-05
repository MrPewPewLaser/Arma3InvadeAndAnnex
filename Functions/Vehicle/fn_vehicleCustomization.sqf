/*
 * Author: Whigital
 *
 * Customizes vehicle appearance based on classname, called from respawn
 * and reward scripts.
 *
 */

params [
    ["_vehicle", objNull],
    ["_type", nil]
];

if (isNull _vehicle) exitWith {};

private _waspSkins = [
    "DarkGrey",
    "DarkGreyCamo"
];

private _greyhawkSkins = [
    "Blufor",
    "Indep"
];

private _gryphonSkins = [
    "CamoGrey",
    "DigitalCamoGrey"
];

private _kumaTextures = [
    "#(argb,16,16,1)color(0.08,0.088,0.075,1)",
    "#(argb,16,16,1)color(0.095,0.09,0.085,1)",
    "#(argb,16,16,1)color(0.07,0.075,0.07,1)",
    "a3\Armor_F\Data\camonet_NATO_Green_CO.paa"
];

private _blackfootTextures = [
    "A3\Air_F_Beta\heli_attack_01\data\heli_attack_01_co.paa",
    "A3\Air_F\Heli_Light_02\Data\heli_light_02_common_co.paa"
];

private _varsukTextures = [
    "#(argb,16,16,1)color(0.076,0.084,0.076,1)",
    "#(argb,16,16,1)color(0.0828,0.081,0.072,1)",
    "#(argb,16,16,1)color(0.0828,0.081,0.072,1)",
    "a3\armor_f\Data\camonet_AAF_stripe_green_CO.paa"
];

private _gorgonSkins = ["Guerilla_01", "Guerilla_02","Guerilla_03", "NATO"];

private _gorgonTextures = [
    "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa",
    "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa",
    "A3\Armor_F_Gamma\APC_Wheeled_03\Data\rcws30_co.paa",
    "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa",
    "a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
    "a3\Armor_F\Data\cage_sand_CO.paa"
];

private _hummingbirdTextures = [
    "A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_BLUFOR_CO.paa",
    "A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_ION_CO.paa"
];

private _prowlerSkins = ["Black", "Olive", "Sand", "Dazzle"];

private _rhinoSkins = ["Sand", "Green"];

private _blackfishSkins = ["Olive", "Blue"];

private _huronSkins = ["Black", "Green"];

private _xianTextures = [
    "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_CO.paa",
    "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_CO.paa",
    "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_CO.paa",
    "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_CO.paa"
];

private _mohawkTextures = [
    "#(argb,16,16,1)color(0.08,0.095,0.08,1)",
    "#(argb,16,16,1)color(0.08,0.08,0.085,1)"
];

private _kamyshTextures = [
    "#(argb,16,16,1)color(0.095,0.09,0.085,1)",
    "#(argb,16,16,1)color(0.095,0.09,0.085,1)",
    "#(argb,16,16,1)color(0.0875,0.0875,0.0875,1)",
    "a3\armor_f\Data\camonet_AAF_stripe_desert_CO.paa",
    "a3\armor_f\Data\cage_sand_CO.paa"
];

private _tigrisTextures = [
    "#(argb,16,16,1)color(0.09075,0.09375,0.09075,1)",
    "#(argb,16,16,1)color(0.09075,0.09375,0.09075,1)",
    "#(argb,16,16,1)color(0.085,0.098,0.085,1)",
    "a3\armor_f\Data\camonet_greenbeige_co.paa",
    "a3\armor_f\Data\cage_G1_CO.paa"
];

private _maridTextures = [
    "#(argb,16,16,1)color(0.08,0.09,0.08,1)",
    "#(argb,16,16,1)color(0.0875,0.0875,0.0875,1)",
    "#(argb,16,16,1)color(0.0875,0.0875,0.0975,1)",
    "a3\armor_f\Data\camonet_AAF_stripe_green_CO.paa",
    "a3\armor_f\Data\cage_G1_CO.paa"
];

private _ghosthawkSkins = ["Black", "Green", "Olive", "Sand"];

private _angaraSkins = ["Jungle", "Grey"];

private _offroadSkins = [
    "Guerilla_01", "Guerilla_02", "Guerilla_04",
    "Guerilla_05", "Guerilla_07", "Guerilla_08",
    "Guerilla_09", "Guerilla_10"
];

private _mb4wbSkins = ["Black", "Brown", "Green", "Olive"];

private _bluforSkins1 = ["Blufor", "Olive"];
private _bluforSkins2 = ["Sand", "Olive"];

private _vanbulanceSkins = ["CivAmbulance", "IdapAmbulance"];
private _vanservicesSkins = ["Black", "Green", "FIA1", "FIA2"];

private _quadSkins = ["Black", "Blufor", "Guerrilla_01", "Olive"];
private _kartSkins = ["Black", "Green", "Orange", "Red", "Yellow"];

private _darterSkins = ["Blufor", "Indep", "EAF"];
private _pelicanSkins = ["Blufor", "Civ", "EAF"];
private _pelican_M_Skins = ["Blufor", "Indfor", "EAF"];

private _speedboatSkins = ["Blufor", "Indep"];
private _assaultboatSkins = ["Black", "Digital"];
private _motorboatSkins = ["Civilian", "Rescue"];
private _waterscooterSkins = ["Grey", "Lime", "Blue", "White"];
private _sdvTextures = [
    "\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa",
    "\A3\boat_f_beta\SDV_01\data\SDV_ext_INDP_CO.paa"
];

switch (typeOf _vehicle) do {
    /**************/
    /**** Jets ****/
    /**************/

    // A-164 Wipeout (CAS)
    case "B_Plane_CAS_01_dynamicLoadout_F": {

        private _first = "PylonRack_1Rnd_Missile_AA_04_F";
        private _second = (selectRandomWeighted ["PylonRack_7Rnd_Rocket_04_HE_F", 2, "PylonRack_12Rnd_missiles", 3, "PylonRack_7Rnd_Rocket_04_AP_F", 2]);
        private _third = (selectRandomWeighted ["PylonRack_1Rnd_Missile_AGM_02_F", 2, "PylonRack_1Rnd_LG_scalpel", 2, "PylonRack_3Rnd_Missile_AGM_02_F", 1, "PylonRack_3Rnd_LG_scalpel", 1]);
        private _forth = (selectRandomWeighted ["PylonRack_1Rnd_Missile_AGM_02_F", 1, "PylonRack_1Rnd_LG_scalpel", 1, "PylonMissile_1Rnd_Bomb_04_F", 2]);
        private _fifth = "PylonMissile_1Rnd_Bomb_04_F";

        private _pylonsArray = [];

        _pylonsArray pushBack [1, _first];
        _pylonsArray pushBack [10, _first];

        _pylonsArray pushBack [2, _second];
        _pylonsArray pushBack [9, _second];

        _pylonsArray pushBack [3, _third];
        _pylonsArray pushBack [8, _third];

        _pylonsArray pushBack [4, _forth];
        _pylonsArray pushBack [7, _forth];

        _pylonsArray pushBack [5, _fifth];
        _pylonsArray pushBack [6, _fifth];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAS", true];
    };

    // F/A-181 Black Wasp II
    case "B_Plane_Fighter_01_F": {
        [
            _vehicle,
            [(selectRandom _waspSkins), 1]
        ] call BIS_fnc_initVehicle;

        _vehicle removeMagazineGlobal "240Rnd_CMFlare_Chaff_Magazine";
        _vehicle addMagazine "120Rnd_CMFlare_Chaff_Magazine";

        private _pylonsArray = [];
        private _assetType = "CAP";

        if (!isNil "_type" && {_type in ["CAS", "JET_CAS"]}) then {
            private _mag = (selectRandomWeighted ["PylonRack_Missile_AGM_02_x1", 2, "PylonMissile_Bomb_GBU12_x1", 1]);
            _pylonsArray pushBack [1, _mag];
            _pylonsArray pushBack [2, _mag];

            private _mag = (selectRandomWeighted ["PylonRack_Missile_AGM_02_x1", 2, "PylonRack_Missile_AGM_02_x2", 1, "PylonMissile_Bomb_GBU12_x1", 2, "PylonRack_Bomb_GBU12_x2", 1, "PylonRack_Missile_HARM_x1", 1]);
            _pylonsArray pushBack [3, _mag];
            _pylonsArray pushBack [4, _mag];

            _pylonsArray pushBack [5, "PylonMissile_Missile_BIM9X_x1"];
            _pylonsArray pushBack [6, "PylonMissile_Missile_BIM9X_x1"];

            _pylonsArray pushBack [7, ""];
            _pylonsArray pushBack [8, ""];
            _pylonsArray pushBack [9, ""];
            _pylonsArray pushBack [10, ""];

            _pylonsArray pushBack [11, "PylonMissile_Bomb_GBU12_x1"];
            _pylonsArray pushBack [12, "PylonMissile_Bomb_GBU12_x1"];

            _assetType = "CAS";
        } else {
            private _mag = (selectRandomWeighted ["PylonRack_Missile_BIM9X_x1", 2, "PylonRack_Missile_BIM9X_x2", 1]);
            _pylonsArray pushBack [1, _mag];
            _pylonsArray pushBack [2, _mag];

            _mag = (selectRandomWeighted ["PylonRack_Missile_AMRAAM_D_x1", 2, "PylonRack_Missile_AMRAAM_D_x2", 1]);
            _pylonsArray pushBack [3, _mag];
            _pylonsArray pushBack [4, _mag];

            _pylonsArray pushBack [5, "PylonMissile_Missile_BIM9X_x1"];
            _pylonsArray pushBack [6, "PylonMissile_Missile_BIM9X_x1"];

            _pylonsArray pushBack [7, "PylonMissile_Missile_AMRAAM_D_INT_x1"];
            _pylonsArray pushBack [8, "PylonMissile_Missile_AMRAAM_D_INT_x1"];
            _pylonsArray pushBack [9, ""];
            _pylonsArray pushBack [10, ""];

            _pylonsArray pushBack [11, ""];
            _pylonsArray pushBack [12, ""];
        };

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", _assetType, true];
    };

    // F/A-181 Black Wasp II (Stealth)
    case "B_Plane_Fighter_01_Stealth_F": {
        [
            _vehicle,
            [(selectRandom _waspSkins), 1]
        ] call BIS_fnc_initVehicle;

        _vehicle removeMagazineGlobal "240Rnd_CMFlare_Chaff_Magazine";
        _vehicle addMagazineGlobal "120Rnd_CMFlare_Chaff_Magazine";

        private _pylonsArray = [];

        //====select random loadout=====
        private _AMRAAMcount = [2, 4, 6] selectRandomWeighted [1, 3, 2];

        //========outer AA bays=========
        _pylonsArray pushBack [5, "PylonMissile_Missile_BIM9X_x1"];
        _pylonsArray pushBack [6, "PylonMissile_Missile_BIM9X_x1"];

        //=====outer and middle inner bay
        if (_AMRAAMcount == 2) then {
            _pylonsArray pushBack [7, "PylonMissile_Missile_AMRAAM_D_INT_x1"];
            _pylonsArray pushBack [8, "PylonMissile_Missile_AMRAAM_D_INT_x1"];

            for [{_i = 9}, {_i < 13}, {_i = (_i + 1)}] do {
                _pylonsArray pushBack [_i, ""];
            };
        };

        if (_AMRAAMcount == 4) then {
            for [{_i = 7}, {_i < 11}, {_i = _i + 1}] do {
                _pylonsArray pushBack [_i, "PylonMissile_Missile_AMRAAM_D_INT_x1"];
            };

            _pylonsArray pushBack [11, ""];
            _pylonsArray pushBack [12, ""];
        };

        //=====inner pylons inner bay====
        if (_AMRAAMcount == 6) then {
            for [{_i = 7}, {_i < 13}, {_i = _i + 1}] do {
                _pylonsArray pushBack [_i, "PylonMissile_Missile_AMRAAM_D_INT_x1"];
            };
        };

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAP", true];
    };

    // A-149 Gryphon
    case "I_Plane_Fighter_04_F": {
        [
            _vehicle,
            [(selectRandom _gryphonSkins), 1]
        ] call BIS_fnc_initVehicle;

        private _assetType = "CAP";

        _vehicle removeMagazineGlobal "240Rnd_CMFlare_Chaff_Magazine";
        _vehicle addMagazine "120Rnd_CMFlare_Chaff_Magazine";

        private _pylonsArray = [];

        if (!isNil "_type" && {_type in ["CAS", "JET_CAS"]}) then {
            // CAS
            private _wingtipAA = selectRandom ["PylonMissile_Missile_BIM9X_x1", "PylonRack_Missile_AMRAAM_C_x1"];
            private _middlepylon = "PylonRack_Missile_AGM_02_x1";

            private _innerpylon = selectRandomWeighted [
                "PylonMissile_Bomb_GBU12_x1", 2,
                "PylonRack_Missile_AGM_02_x1", 2,
                "PylonRack_Missile_AGM_02_x2", 1
            ];

            //=========wingtips===========
            _pylonsArray pushBack [1, _wingtipAA];
            _pylonsArray pushBack [2, _wingtipAA];

            //======middle pylons=========
            _pylonsArray pushBack [3, _middlepylon];
            _pylonsArray pushBack [4, _middlepylon];

            //======inner pylons===========
            _pylonsArray pushBack [5, _innerpylon];
            _pylonsArray pushBack [6, _innerpylon];

            _assetType = "CAS";
        } else {
            // CAP
            private _wingtipAA = "";
            private _middlepylon = "";
            private _innerpylon = selectRandom ["PylonRack_Missile_BIM9X_x2", "PylonRack_Missile_AMRAAM_C_x2"];

            if (_innerpylon == "PylonRack_Missile_BIM9X_x2") then {
                _wingtipAA = selectRandom ["PylonMissile_Missile_BIM9X_x1", "PylonRack_Missile_AMRAAM_C_x1"];
                _middlepylon = selectRandom ["PylonRack_Missile_AMRAAM_C_x1"];
            };

            if (_innerpylon == "PylonRack_Missile_AMRAAM_C_x2") then {
                _wingtipAA = selectRandom ["PylonMissile_Missile_BIM9X_x1"];
                _middlepylon = selectRandom ["PylonRack_Missile_AMRAAM_C_x1", "PylonRack_Missile_BIM9X_x1"];
            };

            //=========wingtips===========
            _pylonsArray pushBack [1, _wingtipAA];
            _pylonsArray pushBack [2, _wingtipAA];
            //======middle pylons=========
            _pylonsArray pushBack [3, _middlepylon];
            _pylonsArray pushBack [4, _middlepylon];
            //======inner pylons===========
            _pylonsArray pushBack [5, _innerpylon];
            _pylonsArray pushBack [6, _innerpylon];
        };

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", _assetType, true];
    };

    // To-201 Shikra
    case "O_Plane_Fighter_02_F": {
        [
            _vehicle,
            ["CamoGreyHex", 1]
        ] call BIS_fnc_initVehicle;

        _vehicle removeMagazineGlobal "240Rnd_CMFlare_Chaff_Magazine";
        _vehicle addMagazine "120Rnd_CMFlare_Chaff_Magazine";

        private _loadouts = [
            // CAS 1
            ["PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AGM_KH25_x1", "PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Bomb_KAB250_x1", "PylonMissile_Bomb_KAB250_x1", "PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "", "", "PylonMissile_Missile_KH58_INT_x1"],
            // CAS 2
            ["PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AGM_KH25_x1", "PylonMissile_Missile_AGM_KH25_x1", "PylonMissile_Missile_AGM_KH25_x1", "PylonMissile_Missile_AGM_KH25_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "", "", "PylonMissile_1Rnd_BombCluster_02_cap_F"],
            // CAS 3
            ["PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Bomb_KAB250_x1", "PylonMissile_Bomb_KAB250_x1", "PylonMissile_Missile_KH58_x1", "PylonMissile_Missile_KH58_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "", "", "PylonMissile_Missile_AGM_KH25_INT_x1"]
        ];

        private _loadout = (selectRandom _loadouts);
        private _pylonsArray = [];

        {
            private _pylonId = (_forEachIndex + 1);
            _pylonsArray pushback [_pylonId, _x];
        } forEach _loadout;

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAS", true];
    };

    // To-201 Shikra (Stealth)
    case "O_Plane_Fighter_02_Stealth_F": {
        [
            _vehicle,
            ["CamoGreyHex", 1]
        ] call BIS_fnc_initVehicle;

        _vehicle removeMagazineGlobal "240Rnd_CMFlare_Chaff_Magazine";
        _vehicle addMagazine "120Rnd_CMFlare_Chaff_Magazine";

        private _loadouts = [
            ["", "", "", "", "", "", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "", "", "PylonMissile_Missile_AA_R77_INT_x1"],
            ["", "", "", "", "", "", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_INT_x1", "PylonMissile_Missile_AA_R77_INT_x1", ""],
            ["", "", "", "", "", "", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_INT_x1", "PylonMissile_Missile_AA_R77_INT_x1", "PylonMissile_Missile_AA_R77_INT_x1"]
        ];

        private _loadout = (selectRandom _loadouts);
        private _pylonsArray = [];

        {
            private _pylonId = (_forEachIndex + 1);
            _pylonsArray pushback [_pylonId, _x];
        } forEach _loadout;

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAP", true];
    };

    // A-143 Buzzard
    case "I_Plane_Fighter_03_dynamicLoadout_F": {
        [
            _vehicle,
            ["Grey", 1]
        ] call BIS_fnc_initVehicle;

        private _assetType = "CAP";
        private _pylonsArray = [];

        _pylonsArray pushBack [4, "PylonWeapon_300Rnd_20mm_shells"];

        if (!isNil "_type" && {_type in ["CAS", "JET_CAS"]}) then {
            // CAS
            private _outer = "PylonRack_1Rnd_AAA_missiles";
            private _middle = (selectRandom ["PylonRack_1Rnd_LG_scalpel", "PylonRack_3Rnd_LG_scalpel", "PylonRack_12Rnd_PG_missiles"]);
            private _inner = (selectRandom ["PylonRack_1Rnd_Missile_AGM_02_F", "PylonMissile_1Rnd_Bomb_04_F"]);

            _pylonsArray pushBack [1, _outer];
            _pylonsArray pushBack [7, _outer];

            _pylonsArray pushBack [2, _middle];
            _pylonsArray pushBack [6, _middle];

            _pylonsArray pushBack [3, _inner];
            _pylonsArray pushBack [5, _inner];

            _assetType = "CAS";
        } else {
            // CAP
            private _outer = selectRandom ["PylonRack_1Rnd_AAA_missiles", "PylonRack_1Rnd_Missile_AA_04_F"];
            private _middle = selectRandom [_outer, "PylonRack_1Rnd_GAA_missiles"];
            private _inner = "PylonRack_1Rnd_GAA_missiles";

            _pylonsArray pushBack [1, _outer];
            _pylonsArray pushBack [7, _outer];

            _pylonsArray pushBack [2, _middle];
            _pylonsArray pushBack [6, _middle];

            _pylonsArray pushBack [3, _inner];
            _pylonsArray pushBack [5, _inner];
        };

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", _assetType, true];
    };

    //Priarie fire F4B Phantom (navy, cap)
    case "vn_b_air_f4b_navy_cap": {
        private _rockets = selectRandomWeighted [
            "vn_rocket_ffar_f4_in_lau3_m229_he_x19", 0.2,
            "vn_rocket_ffar_f4_in_lau59_m229_he_x21", 0.8,
            "vn_rocket_ffar_f4_in_lau3_m151_he_x19", 0.4,
            "vn_rocket_ffar_f4_in_lau59_m151_he_x21", 0.8,
            "vn_rocket_ffar_f4_in_lau3_m151_he_x57", 0.2
        ];

        private _naplam = selectRandomWeighted [
            "vn_bomb_f4_out_750_blu1b_fb_mag_x2", 0.5,
            "vn_bomb_f4_out_500_blu1b_fb_mag_x2", 0.8,
            "vn_bomb_f4_out_500_blu1b_fb_mag_x4", 0.25
        ];

        private _selectedForward = selectRandom  ["vn_missile_aim120c_mag_x1", "vn_missile_aim7e2_mag_x1"];
        private _selectedAft = "vn_missile_aim7e2_mag_x1";
        if (_selectedForward == "vn_missile_aim120c_mag_x1") then {
            if (random 1 > 0.8) then {
                _selectedAft = _selectedForward;
            } else {
                _selectedAft = "";
            };
        };
        private _sidewinders = selectRandomWeighted ["vn_missile_f4_lau7_aim9e_mag_x2", 3, "vn_missile_f4_lau7_aim9x_mag_x2", 1];

        private _pylonsArray = [
            [1, _naplam],
            [2, _naplam],
            [3, _rockets],
            [4, _rockets],
            [5, "vn_gunpod_suu23_v_1200_mag"],
            [6, _sidewinders],
            [7, _sidewinders],
            [8, _selectedForward],
            [9, _selectedForward],
            [10, _selectedAft],
            [11, _selectedAft]
        ];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };

    //F4 Phantom cas
    case "vn_b_air_f4b_usmc_cas": {
        private _outer = [
            "vn_gunpod_suu23_v_1200_mag", 0.5,
            "vn_rocket_ffar_f4_out_lau3_m156_wp_x19", 0.6,
            "vn_rocket_ffar_f4_out_lau59_m151_he_x21", 0.7,
            "vn_rocket_ffar_f4_out_lau3_m151_he_x19", 0.6,
            "vn_rocket_ffar_f4_out_lau3_m151_he_x57", 0.6,
            "vn_rocket_ffar_f4_out_lau59_m229_he_x21", 0.6,
            "vn_rocket_ffar_f4_out_lau3_m229_he_x19", 0.6,
            "vn_rocket_ffar_f4_out_lau3_m229_he_x57", 0.6,
            "vn_rocket_ffar_f4_out_lau3_mk32_atap_x4", 0.2,
            "vn_bomb_f4_out_500_mk82_he_mag_x2", 0.1,
            "vn_bomb_f4_out_500_mk82_he_mag_x3", 0.15,
            "vn_bomb_f4_out_500_mk82_he_mag_x4", 0.2,
            "vn_bomb_f4_out_500_mk82_he_mag_x6", 0.25,
            "vn_bomb_f4_out_500_mk82_se_mag_x2", 0.1,
            "vn_bomb_f4_out_500_mk82_se_mag_x3", 0.15,
            "vn_bomb_f4_out_500_mk82_se_mag_x4", 0.2,
            "vn_bomb_f4_out_500_mk82_se_mag_x6", 0.25,
            "vn_bomb_f4_out_500_mk82_dc_mag_x2", 0.1,
            "vn_bomb_f4_out_500_mk82_dc_mag_x3", 0.15,
            "vn_bomb_f4_out_750_m117_he_mag_x2", 0.1,
            "vn_bomb_f4_out_750_m117_he_mag_x3", 0.2,
            "vn_bomb_f4_out_1000_mk83_he_mag_x1", 0.1,
            "vn_bomb_f4_out_1000_mk83_he_mag_x2", 0.2,
            "vn_bomb_f4_out_2000_mk84_he_mag_x1", 0.1,
            "vn_bomb_f4_out_2000_gbu8_he_mag_x1", 0.3,
            "vn_bomb_f4_out_500_mk20_cb_mag_x1", 0.1,
            "vn_bomb_f4_out_500_mk20_cb_mag_x2", 0.2,
            "vn_bomb_f4_out_500_mk20_cb_mag_x3", 0.3,
            "vn_bomb_f4_out_500_blu1b_fb_mag_x2", 0.5,
            "vn_bomb_f4_out_500_blu1b_fb_mag_x4", 0.7,
            "vn_bomb_f4_out_750_blu1b_fb_mag_x2", 0.5,
            "vn_bomb_f4_out_100_m47_wp_mag_x2", 0.05,
            "vn_bomb_f4_out_100_m47_wp_mag_x3", 0.1,
            "vn_bomb_f4_out_100_m47_wp_mag_x4", 0.2,
            "vn_bomb_f4_out_100_m47_wp_mag_x6", 0.4,
            "vn_missile_f4_out_agm45_mag_x1", 0.5,
            "vn_missile_f4_out_agm12c_mag_x1", 0.5,
            "vn_bomb_f4_out_750_cbu85_cb_mag_x2", 0.2,
            "vn_bomb_f4_out_750_cbu85_cb_mag_x3", 0.4,
            "vn_bomb_f4_out_500_gbu12_he_mag_x1", 0.5,
            "vn_bomb_f4_out_500_gbu12_he_mag_x2", 0.4,
            "vn_bomb_f4_out_500_gbu12_he_mag_x3", 0.3,
            "vn_missile_f4_out_agm88_mag_x1", 0.5,
            "vn_missile_agm65_rail_mag_x1", 0.5
        ];
        private _inner = [
            "vn_rocket_ffar_f4_lau3_m156_wp_x19", 0.2,
            "vn_rocket_ffar_f4_lau59_m151_he_x21", 0.4,
            "vn_rocket_ffar_f4_lau3_m151_he_x19", 0.2,
            "vn_rocket_ffar_f4_lau3_m151_he_x57", 0.6,
            "vn_rocket_ffar_f4_lau59_m229_he_x21", 0.4,
            "vn_rocket_ffar_f4_lau3_m229_he_x19", 0.2,
            "vn_rocket_ffar_f4_lau3_m229_he_x57", 0.6,
            "vn_rocket_ffar_f4_lau3_mk32_atap_x12", 0.1,
            "vn_rocket_ffar_f4_in_lau3_mk32_atap_x12", 0.1,
            "vn_rocket_ffar_f4_out_lau3_mk32_atap_x12", 0.1,
            "vn_bomb_f4_500_mk82_he_mag_x3", 0.2,
            "vn_bomb_f4_500_mk82_se_mag_x3", 0.2,
            "vn_bomb_f4_500_mk82_dc_mag_x3", 0.2,
            "vn_bomb_f4_750_m117_he_mag_x3", 0.3,
            "vn_bomb_1000_mk83_he_mag_x1", 0.1,
            "vn_bomb_f4_1000_mk83_he_mag_x2", 0.2,
            "vn_bomb_2000_mk84_he_mag_x1", 0.1,
            "vn_bomb_2000_gbu8_he_mag_x1", 0.4,
            "vn_bomb_f4_500_mk20_cb_mag_x3", 0.4,
            "vn_bomb_f4_500_blu1b_fb_mag_x2", 0.6,
            "vn_bomb_f4_750_blu1b_fb_mag_x2", 0.6,
            "vn_bomb_f4_100_m47_wp_mag_x3", 0.5,
            "vn_missile_agm45_mag_x1", 0.5,
            "vn_missile_agm12c_mag_01_x1", 0.5,
            "vn_bomb_f4_750_cbu85_cb_mag_x3", 0.6,
            "vn_bomb_500_gbu12_he_mag_x1", 0.5,
            "vn_bomb_f4_500_gbu12_he_mag_x3", 0.3,
            "vn_missile_agm88_mag_x1", 0.5,
            "vn_missile_agm65_rail_mag_x3", 0.4
        ];
        private _center = [
            "vn_rocket_ffar_f4_in_lau3_m156_wp_x19", 0.4,
            "vn_rocket_ffar_f4_in_lau59_m151_he_x21", 0.6,
            "vn_rocket_ffar_f4_in_lau3_m151_he_x19", 0.4,
            "vn_rocket_ffar_f4_in_lau3_m151_he_x57", 0.8,
            "vn_rocket_ffar_f4_in_lau59_m229_he_x21", 0.6,
            "vn_rocket_ffar_f4_in_lau3_m229_he_x19", 0.4,
            "vn_rocket_ffar_f4_in_lau3_m229_he_x57", 0.8,
            "vn_bomb_f4_in_500_mk82_he_mag_x2", 0.4,
            "vn_bomb_f4_in_500_mk82_he_mag_x4", 0.6,
            "vn_bomb_f4_in_500_mk82_he_mag_x6", 0.8,
            "vn_bomb_f4_in_500_mk82_se_mag_x2", 0.4,
            "vn_bomb_f4_in_500_mk82_se_mag_x4", 0.6,
            "vn_bomb_f4_in_500_mk82_se_mag_x6", 0.8,
            "vn_bomb_f4_in_500_mk82_dc_mag_x2", 0.4,
            "vn_bomb_f4_in_750_m117_he_mag_x2", 0.4,
            "vn_bomb_f4_in_1000_mk83_he_mag_x2", 0.4,
            "vn_bomb_f4_in_2000_mk84_he_mag_x1", 0.4,
            "vn_bomb_f4_in_2000_gbu8_he_mag_x1", 0.4,
            "vn_bomb_f4_in_500_mk20_cb_mag_x2", 0.4,
            "vn_bomb_f4_in_500_blu1b_fb_mag_x2", 0.4,
            "vn_bomb_f4_in_500_blu1b_fb_mag_x4", 0.6,
            "vn_bomb_f4_in_750_blu1b_fb_mag_x2", 0.4,
            "vn_bomb_f4_in_100_m47_wp_mag_x2", 0.4,
            "vn_bomb_f4_in_100_m47_wp_mag_x4", 0.6,
            "vn_bomb_f4_in_100_m47_wp_mag_x6", 0.8,
            "vn_bomb_f4_in_750_cbu85_cb_mag_x2", 0.4,
            "vn_bomb_f4_in_750_cbu85_cb_mag_x3", 0.6,
            "vn_bomb_f4_in_500_gbu12_he_mag_x2", 0.4,
            "vn_bomb_f4_in_500_gbu12_he_mag_x3", 0.6
        ];
        private _innerAddon = ["vn_missile_f4_lau7_aim9e_mag_x2", 3,"vn_missile_f4_lau7_aim9x_mag_x2", 1, "", 0.5];
        private _belly = ["vn_missile_aim7e2_mag_x1", 9,"vn_missile_aim120c_mag_x1", 0.5, "", 0.5];

        private _outerSelected = selectRandomWeighted _outer;
        private _innerSelected = selectRandomWeighted _inner;
        private _innerAddonSelected = selectRandomWeighted _innerAddon;
        private _bellySelectedForward = selectRandomWeighted _belly;
        private _bellySelectedAft = _bellySelectedForward;
        if (random 1 > 0.25) then {
            _bellySelectedAft = "";
        };

        while {_innerSelected == _outerSelected} do {
            _innerSelected = selectRandomWeighted _inner;
        };

        private _centerSelected = "vn_gunpod_suu23_v_1200_mag";
        if (_outerSelected == "vn_gunpod_suu23_v_1200_mag") then {
            _centerSelected = selectRandomWeighted _center;
        };

        private _pylonsArray = [
            [1, _outerSelected],
            [2, _outerSelected],
            [3, _innerSelected],
            [4, _innerSelected],
            [5, _centerSelected],
            [6, _innerAddonSelected],
            [7, _innerAddonSelected],
            [8, _bellySelectedForward],
            [9, _bellySelectedForward],
            [10, _bellySelectedAft],
            [11, _bellySelectedAft]
        ];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };

    //F100 cas
    case "vn_b_air_f100d_cas": {
        private _outer = [
            //White phospores
            "vn_rocket_ffar_f4_lau59_m156_wp_x7", 0.5,
            "vn_rocket_ffar_f4_lau3_m156_wp_x19", 0.7,
            "vn_bomb_100_m47_wp_mag_x1", 0.2, //WP bomb

            //HE rockets
            "vn_rocket_ffar_f4_lau59_m151_he_x7", 0.2,
            "vn_rocket_ffar_f4_lau59_m229_he_x7", 0.2,
            "vn_rocket_ffar_f4_lau3_m151_he_x19", 0.7,
            "vn_rocket_ffar_f4_lau59_m151_he_x21", 0.7,

            //ATAP
            "vn_rocket_ffar_f4_lau3_mk32_atap_x4", 0.2,

            //Bombs
            "vn_bomb_500_mk82_he_mag_x1", 0.2,
            "vn_bomb_500_mk82_dc_mag_x1", 0.2,//Daisy cutter
            "vn_bomb_500_mk82_se_mag_x1", 0.3,//SnakeEye
            "vn_bomb_750_m117_he_mag_x1", 0.2,
            "vn_bomb_500_mk20_cb_mag_x1", 0.1,//Rockeye clubser bomb

            //Naplam bomb
            "vn_bomb_750_blu1b_fb_mag_x1", 0.5,
            "vn_bomb_500_blu1b_fb_mag_x1", 0.5
        ];

        private _middle = [
            //Bombs
            "vn_bomb_500_mk82_he_mag_x1", 0.2,
            "vn_bomb_500_mk82_dc_mag_x1", 0.2,//Daisy cutter
            "vn_bomb_500_mk82_se_mag_x1", 0.3,//SnakeEye
            "vn_bomb_750_m117_he_mag_x1", 0.2,
            "vn_bomb_500_mk20_cb_mag_x1", 0.1,//Rockeye clubser bomb

            //Naplam bomb
            "vn_bomb_750_blu1b_fb_mag_x1", 0.5,
            "vn_bomb_500_blu1b_fb_mag_x1", 0.5
        ];
        private _inner = [
            //White phospores
            "vn_rocket_ffar_f4_lau3_m156_wp_x19", 0.2,
            "vn_bomb_100_m47_wp_mag_x1", 0.2, //WP bomb
            "vn_bomb_f4_100_m47_wp_mag_x2", 0.1,
            "vn_bomb_f4_100_m47_wp_mag_x3", 0.05,

            //HE rockets
            "vn_rocket_ffar_f4_lau3_m151_he_x19", 0.7,
            "vn_rocket_ffar_f4_lau59_m151_he_x21", 0.7,

            //ATAP
            "vn_rocket_ffar_f4_lau3_mk32_atap_x4", 0.2,

            //Bombs
            "vn_bomb_f4_500_mk82_he_mag_x2", 0.5,
            "vn_bomb_f4_500_mk82_he_mag_x3", 0.3,
            "vn_bomb_f4_500_mk82_se_mag_x2", 0.2,//Daisy cutter
            "vn_bomb_f4_500_mk82_se_mag_x3", 0.1,//Daisy cutter
            "vn_bomb_f4_500_mk82_dc_mag_x2", 0.5,//SnakeEye
            "vn_bomb_f4_500_mk82_dc_mag_x3", 0.3,//SnakeEye
            "vn_bomb_750_m117_he_mag_x1", 0.2,
            "vn_bomb_500_mk20_cb_mag_x1", 0.1,//Rockeye clubser bomb
            "vn_bomb_f4_500_mk20_cb_mag_x2", 0.1,

            //Naplam bomb
            "vn_bomb_750_blu1b_fb_mag_x1", 0.5,
            "vn_bomb_500_blu1b_fb_mag_x1", 0.5,

            //AA missiles
            "vn_missile_aim9e_mag_x1", 1,
            "vn_missile_f100_lau7_aim9e_mag_x2", 2,

            //ARMs
            "vn_missile_agm45_03_mag_x1", 0.5,

            //AGM
            "vn_missile_agm12c_mag_01_x1", 0.5
        ];

        private _outerSelected = selectRandomWeighted _outer;
        private _middleSelected = selectRandomWeighted _middle;
        private _innerSelected = selectRandomWeighted _inner;

        while {_middleSelected == _outerSelected} do {
            _middleSelected = selectRandomWeighted _middle;
        };
        while {_innerSelected == _outerSelected || _innerSelected == _middleSelected} do {
            _innerSelected = selectRandomWeighted _inner;
        };

        private _pylonsArray = [
            [1, _outerSelected],
            [2, _outerSelected],
            [3, _middleSelected],
            [4, _middleSelected],
            [5, _innerSelected],
            [6, _innerSelected]
        ];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };


    /**************/
    /**** UAVs ****/
    /**************/

    // UCAV Sentinel
    case "B_UAV_05_F": {
        [
            _vehicle,
            [(selectRandom _waspSkins), 1],
            ["wing_fold_l", 1]
        ] call BIS_fnc_initVehicle;

        private _pylonsArray = [];

        {
            private _mag = (selectRandomWeighted ["PylonMissile_Bomb_GBU12_x1", 3, "PylonMissile_Missile_AGM_02_x2", 2]);
            _pylonsArray pushBack [_x, _mag, [0]];
        } forEach [1, 2];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAS", true];
    };

    // MQ-4A Greyhawk
    case "B_UAV_02_dynamicLoadout_F": {
        [
            _vehicle,
            [(selectRandom _greyhawkSkins), 1]
        ] call BIS_fnc_initVehicle;

        private _pylonsArray = [];

        {
            private _mag = (selectRandomWeighted ["PylonMissile_1Rnd_Bomb_04_F", 4, "PylonRack_1Rnd_LG_scalpel", 2, "PylonRack_3Rnd_LG_scalpel", 1]);
            _pylonsArray pushBack [_x, _mag, [0]];
        } forEach [1, 2];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAS", true];
    };

    // AR-2 Darter
    case "B_UAV_01_F": {
        [
            _vehicle,
            [(selectRandom _darterSkins), 1]
        ] call BIS_fnc_initVehicle;
    };

    // AL-6 Pelican
    case "B_UAV_06_F": {
        [
            _vehicle,
            [(selectRandom _pelicanSkins), 1]
        ] call BIS_fnc_initVehicle;
    };

    // AL-6 Pelican (Medical)
    case "B_UAV_06_medical_F": {
        [
            _vehicle,
            [(selectRandom _pelican_M_Skins), 1]
        ] call BIS_fnc_initVehicle;
    };


    /**********************/
    /**** Attack Helis ****/
    /**********************/

    // MI-48 Kajman
    case "O_Heli_Attack_02_dynamicLoadout_black_F": {
        private _pylonsArray = [];

        private _loadout = (selectRandomWeighted [["PylonRack_4Rnd_LG_scalpel", [0]], 1, ["PylonRack_3Rnd_LG_scalpel", [0]], 2, ["PylonRack_1Rnd_Missile_AGM_01_F", [0]], 3, ["PylonMissile_1Rnd_LG_scalpel", [0]], 3]);

        {
            _loadout params ["_mag", "_owner"];
            _pylonsArray pushBack [_x, _mag, _owner];
        } forEach [1, 4];

        {
            (selectRandom [["PylonRack_20Rnd_Rocket_03_AP_F", [0]], ["PylonRack_20Rnd_Rocket_03_HE_F", [0]], ["PylonRack_19Rnd_Rocket_Skyfire", [0]]]) params ["_mag", "_owner"];
            _pylonsArray pushBack [_x, _mag, _owner];
        } forEach [2, 3];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAS", true];
        _vehicle setVariable ["InA_isGunship", true, true];
    };

    // AH-99 Blackfoot
    case "B_Heli_Attack_01_dynamicLoadout_F": {
        _vehicle setObjectTextureGlobal [0, (selectRandom _blackfootTextures)];

        private _pylonsArray = [];
        private _loadout = (selectRandomWeighted [["PylonMissile_1Rnd_LG_scalpel", [0]], 1, ["PylonRack_12Rnd_PG_missiles", [0]], 2, ["PylonRack_12Rnd_missiles", [0]], 2]);

        {
            _loadout params ["_mag", "_owner"];
            _pylonsArray pushBack [_x, _mag, _owner];
        } forEach [1, 6];

        {
            _pylonsArray pushBack [_x, "PylonMissile_1Rnd_AAA_missiles", [0]];
        } forEach [2, 5];

        _loadout = (selectRandomWeighted [["PylonMissile_1Rnd_LG_scalpel", [0]], 1, ["PylonRack_12Rnd_PG_missiles", [0]], 2]);

        {
            _loadout params ["_mag", "_owner"];
            _pylonsArray pushBack [_x, _mag, _owner];
        } forEach [3, 4];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAS", true];
    };

    // AH-9 Pawnee
    case "B_Heli_Light_01_dynamicLoadout_F": {
        _vehicle setObjectTextureGlobal [0, (selectRandom _hummingbirdTextures)];

        private _pylonsArray = [];

        switch ((selectRandom [0, 1, 2])) do {
            case 0: {
                _pylonsArray pushBack [1, "PylonRack_1Rnd_AAA_missiles"];
                _pylonsArray pushBack [2, "PylonRack_12Rnd_PG_missiles"];
            };
            case 1: {
                _pylonsArray pushBack [1, "PylonRack_1Rnd_LG_scalpel"];
                _pylonsArray pushBack [2, "PylonRack_12Rnd_missiles"];
            };
            case 2: {
                _pylonsArray pushBack [1, "PylonRack_7Rnd_Rocket_04_HE_F"];
                _pylonsArray pushBack [2, "PylonRack_7Rnd_Rocket_04_AP_F"];
            };
        };

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAS", true];
    };

    // WY-55 Hellcat
    case "I_Heli_light_03_dynamicLoadout_F": {
        _vehicle setObjectTextureGlobal [0, "\a3\air_F_EPB\Heli_Light_03\Data\Heli_Light_03_base_CO.paa"];

        private _pylonsArray = [];

        private _weaponsWeighted = [
            "PylonRack_3Rnd_LG_scalpel",         1,
            "PylonMissile_1Rnd_LG_scalpel",      2,
            "PylonWeapon_300Rnd_20mm_shells",    2,
            "PylonRack_12Rnd_missiles",          3,
            "PylonRack_12Rnd_PG_missiles",       3,
            "PylonRack_7Rnd_Rocket_04_HE_F",     4,
            "PylonRack_7Rnd_Rocket_04_AP_F",     4
        ];

        private _loadout = selectRandom ["RANDOM", "AADAGR", "DAR", "APHE", "RANDOM", "ATGMDAR", "AADAGR", "DAR", "APHE", "ATGMDAR", "RANDOM", "DAR", "APHE", "2xATMG", "6xATGM", "8xATGM", "RANDOM"];

        switch (_loadout) do {
            case "AADAGR": {
                _pylonsArray pushBack [1, "PylonRack_1Rnd_AAA_missiles"];
                _pylonsArray pushBack [2, "PylonRack_12Rnd_PG_missiles"];
            };
            case "DAR": {
                _pylonsArray pushBack [1, "PylonRack_12Rnd_missiles"];
                _pylonsArray pushBack [2, "PylonRack_12Rnd_missiles"];
            };
            case "APHE": {
                _pylonsArray pushBack [1, "PylonRack_12Rnd_missiles"];
                _pylonsArray pushBack [2, "PylonRack_12Rnd_missiles"];
            };
            case "ATGMDAR": {
                _pylonsArray pushBack [1, "PylonRack_12Rnd_missiles"];
                _pylonsArray pushBack [2, "PylonMissile_1Rnd_LG_scalpel"];
            };
            case "2xATMG": {
                _pylonsArray pushBack [1, "PylonMissile_1Rnd_LG_scalpel"];
                _pylonsArray pushBack [2, "PylonMissile_1Rnd_LG_scalpel"];
            };
            case "6xATGM": {
                _pylonsArray pushBack [1, "PylonRack_3Rnd_LG_scalpel"];
                _pylonsArray pushBack [2, "PylonRack_3Rnd_LG_scalpel"];
            };
            case "8xATGM": {
                _pylonsArray pushBack [1, "PylonRack_4Rnd_LG_scalpel"];
                _pylonsArray pushBack [2, "PylonRack_4Rnd_LG_scalpel"];
            };
            case "RANDOM": {
                {
                    private _mag = (selectRandomWeighted _weaponsWeighted);
                    _pylonsArray pushBack [_x, _mag];
                } forEach [1, 2];
            };
        };

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];

        _vehicle setVariable ["InA_AssetType", "CAS", true];
    };

    // PO-30 Orca
    case "O_Heli_Light_02_dynamicLoadout_F": {
        _vehicle setObjectTextureGlobal [0, "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"];

        private _pylonsArray = [];

        _pylonsArray pushBack [1, "PylonWeapon_2000Rnd_65x39_belt"];

        private _mag = (selectRandomWeighted ["PylonRack_12Rnd_missiles", 4, "PylonRack_12Rnd_PG_missiles", 4, "PylonMissile_1Rnd_LG_scalpel", 1, "PylonRack_19Rnd_Rocket_Skyfire", 2]);

        _pylonsArray pushBack [2, _mag];

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };


    /***************/
    /**** VTOLs ****/
    /***************/

    // V-44 X Blackfish (Armed)
    case "B_T_VTOL_01_armed_F": {
        [
            _vehicle,
            [(selectRandom _blackfishSkins), 1]
        ] call BIS_fnc_initVehicle;

        _vehicle setVariable ["InA_AssetType", "CAS", true];
        _vehicle setVariable ["InA_isGunship", true, true];
    };

    // Y-32 Xi'an (Infantry transport)
    case "O_T_VTOL_02_infantry_dynamicLoadout_F": {
        {
            _vehicle setObjectTextureGlobal [_forEachIndex, _x];
        } forEach _xianTextures;

        private _pylonsArray = [];

        if (!isNil "_type" && {_type == "CAS"}) then {
            private _weaponOuter = selectRandom ["PylonMissile_1Rnd_LG_scalpel", "PylonRack_3Rnd_LG_scalpel", "PylonRack_3Rnd_LG_scalpel", "PylonRack_3Rnd_LG_scalpel", "PylonRack_4Rnd_LG_scalpel", "PylonRack_1Rnd_Missile_AGM_01_F"];

            _pylonsArray pushBack [1, _weaponOuter, [0]];
            _pylonsArray pushBack [4, _weaponOuter, [0]];

            private _weaponInner = selectRandom ["PylonMissile_1Rnd_Bomb_03_F", "PylonRack_1Rnd_Missile_AA_03_F", "PylonRack_19Rnd_Rocket_Skyfire", "PylonRack_20Rnd_Rocket_03_HE_F"];
            _pylonsArray pushBack [2, _weaponInner, [0]];

            if (_weaponInner == "PylonRack_20Rnd_Rocket_03_HE_F") then {
                _weaponInner = "PylonRack_20Rnd_Rocket_03_AP_F";
            };

            _pylonsArray pushBack [3, _weaponInner, [0]];

            _vehicle setVariable ["InA_isGunship", true, true];
        } else {
            _vehicle removeWeapon ("gatling_30mm_VTOL_02");

            for "_i" from 0 to 5 do {
                _pylonsArray pushBack [_i, ""];
            };
        };

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };


    // Y-32 Xi'an (Vehicle transport)
    case "O_T_VTOL_02_vehicle_dynamicLoadout_F": {
        {
            _vehicle setObjectTextureGlobal [_forEachIndex, _x];
        } forEach _xianTextures;

        private _pylonsArray = [];

        if (!isNil "_type" && {_type == "CAS"}) then {
            private _weaponOuter = selectRandom ["PylonMissile_1Rnd_LG_scalpel", "PylonRack_3Rnd_LG_scalpel", "PylonRack_3Rnd_LG_scalpel", "PylonRack_3Rnd_LG_scalpel", "PylonRack_4Rnd_LG_scalpel", "PylonRack_1Rnd_Missile_AGM_01_F"];

            _pylonsArray pushBack [1, _weaponOuter, [0]];
            _pylonsArray pushBack [4, _weaponOuter, [0]];

            private _weaponInner = selectRandom ["PylonMissile_1Rnd_Bomb_03_F", "PylonRack_1Rnd_Missile_AA_03_F", "PylonRack_19Rnd_Rocket_Skyfire", "PylonRack_20Rnd_Rocket_03_HE_F"];
            _pylonsArray pushBack [2, _weaponInner, [0]];

            if (_weaponInner == "PylonRack_20Rnd_Rocket_03_HE_F") then {
                _weaponInner = "PylonRack_20Rnd_Rocket_03_AP_F";
            };

            _pylonsArray pushBack [3, _weaponInner, [0]];

            _vehicle setVariable ["InA_isGunship", true, true];
        } else {
            _vehicle removeWeapon ("gatling_30mm_VTOL_02");

            for "_i" from 0 to 5 do {
                _pylonsArray pushBack [_i, ""];
            };
        };

        [_vehicle, _pylonsArray] remoteExec ["AW_fnc_setPylonLoadout", _vehicle];
    };


    /*************************/
    /**** Transport Helis ****/
    /*************************/

    // MH-9 Hummingbird
    case "B_Heli_Light_01_F": {
        _vehicle setObjectTextureGlobal [0, (selectRandom _hummingbirdTextures)];
    };

    // UH-80 Ghosthawk
    case "B_Heli_Transport_01_F": {
        [
            _vehicle,
            [(selectRandom _ghosthawkSkins), 1]
        ] call BIS_fnc_initVehicle;

        [_vehicle, ["LMG_Minigun_Transport", [1]]] remoteExec ["removeWeaponTurret", _vehicle];
        [_vehicle, ["LMG_Minigun_Transport2", [2]]] remoteExec ["removeWeaponTurret", _vehicle];

        _vehicle setVariable ["InA_turretsEnabled", false, true];

        [
            _vehicle, ["Enable turrets", {
                params ["_target", "_caller", "_actionId", "_arguments"];
                [_target] remoteExecCall ["AW_fnc_ghTurret", 2];
                systemChat "Turrets enabled. Use this action again to disable turrets.";
            }, [], -20, false, true, "", "(_this == (driver _target)) && {(!(_target getVariable ['InA_turretsEnabled', false]))}", -1, false
        ]] remoteExecCall ["addAction", 0, true];

        [
            _vehicle, ["Disable turrets", {
                params ["_target", "_caller", "_actionId", "_arguments"];
                [_target] remoteExecCall ["AW_fnc_ghTurret", 2];
                systemChat "Turrets disabled. Use this action again to enable turrets.";
            }, [], -20, false, true, "", "(_this == (driver _target)) && {(_target getVariable ['InA_turretsEnabled', false])}", -1, false
        ]] remoteExecCall ["addAction", 0, true];
    };

    // CH-67 Huron (Unarmed)
    case "B_Heli_Transport_03_unarmed_F": {
        [
            _vehicle,
            [(selectRandom _huronSkins), 1]
        ] call BIS_fnc_initVehicle;
    };

    // MI-290 Taru (Bench)
    case "O_Heli_Transport_04_bench_black_F": {};

    // MI-290 Taru (Heavy Lifter)
    case "O_Heli_Transport_04_black_F": {
        [_vehicle] remoteExec ["AW_fnc_taruPodInit", 0, true];
    };

    // CH-49 Mohawk
    case "I_Heli_Transport_02_F": {
        private _color = (selectRandom _mohawkTextures);

        {
            _vehicle setObjectTextureGlobal [_forEachIndex, _color];
        } forEach [0, 1, 2];
    };


    /*********************/
    /**** UAV Turrets ****/
    /*********************/

    // Praetorian 1C
    case "B_AAA_System_01_F": {
        [
            _vehicle,
            ["Sand", 1]
        ] call BIS_fnc_initVehicle;
    };

    // Mk49 Spartan
    case "B_SAM_System_01_F": {
        [
            _vehicle,
            ["Sand", 1]
        ] call BIS_fnc_initVehicle;
    };


    /***************/
    /**** Tonks ****/
    /***************/

    // T-140K Angara
    case "O_MBT_04_command_F": {
        [
            _vehicle,
            [(selectRandom _angaraSkins), 1],
            ["showCamonetHull", (selectRandom [0, 1]), "showCamonetTurret", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // T-140 Angara
    case "O_MBT_04_cannon_F": {
        [
            _vehicle,
            [(selectRandom _angaraSkins), 1],
            ["showCamonetHull", (selectRandom [0, 1]),"showCamonetTurret", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // M2A4 Slammer
    case "B_MBT_01_cannon_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins2), 1],
            ["showBags", 0, "showCamonetTurret", (selectRandom [0, 1]), "showCamonetHull", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // M2A4 Slammer (Urban Purpose)
    case "B_MBT_01_TUSK_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins2), 1],
            ["showBags", 0, "showCamonetTurret", (selectRandom [0, 1]), "showCamonetHull", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // MBT-52 Kuma
    case "I_MBT_03_cannon_F": {
        [_vehicle, _kumaTextures] spawn {
            params ["_vehicle", "_textures"];

            private _customization = [
                _vehicle,
                false,
                ["HideTurret", 1, "HideHull", 1, "showCamonetHull", 1, "showCamonetTurret", 1]
            ] spawn BIS_fnc_initVehicle;

            waitUntil {sleep 0.1; scriptDone _customization};

            {
                _vehicle setObjectTextureGlobal [_forEachIndex, _x];
            } forEach _textures;
        };
    };

    // T-100 Varsuk
    case "O_MBT_02_cannon_F": {
        [_vehicle, _varsukTextures] spawn {
            params ["_vehicle", "_textures"];

            private _customization = [
                _vehicle,
                false,
                ["showCamonetHull", 1, "showCamonetTurret", 1, "showLog", 0]
            ] spawn BIS_fnc_initVehicle;

            waitUntil {sleep 0.1; scriptDone _customization};

            {
                _vehicle setObjectTextureGlobal [_forEachIndex, _x];
            } forEach _textures;
        };
    };


    /**************/
    /**** IFVs ****/
    /**************/

    // AFV-4 Gorgon
    case "I_APC_Wheeled_03_cannon_F": {
        private _skin = (selectRandom _gorgonSkins);

        _vehicle setVariable ["InA_VehicleSkin", _skin];

        if (_skin != "NATO") then {
            [
                _vehicle,
                [_skin, 1],
                ["showCamonetHull", (selectRandom [0, 1]), "showBags", 0, "showBags2", 0, "showTools", 0, "showSLATHull", (selectRandom [0, 1])]
            ] call BIS_fnc_initVehicle;
        } else {
            [_vehicle, _gorgonTextures] spawn {
                params ["_vehicle", "_textures"];

                private _customization = [
                    _vehicle,
                    false,
                    ["showCamonetHull", (selectRandom [0, 1]), "showBags", 0, "showBags2", 0, "showTools", 0, "showSLATHull", (selectRandom [0, 1])]
                ] spawn BIS_fnc_initVehicle;

                waitUntil {sleep 0.1; scriptDone _customization};

                {
                    _vehicle setObjectTextureGlobal [_forEachIndex, _x];
                } forEach _textures;
            };
        };
    };

    // AWC 301 Nyx (AT)
    case "I_LT_01_AT_F": {
        [
            _vehicle,
            ["Indep_Olive", 1],
            ["showTools", 0, "showCamonetHull", (selectRandom [0, 1]), "showBags", 0, "showSLATHull", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    }; 

    // AWC 303 Nyx (Recon)
    case "I_LT_01_scout_F": {
        [
            _vehicle,
            ["Indep_Olive", 1],
            ["showTools", 0, "showCamonetHull", (selectRandom [0, 1]), "showBags", 0, "showSLATHull", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // AWC 302 Nyx (AA)
    case "I_LT_01_AA_F": {
        [
            _vehicle,
            ["Indep_Olive", 1],
            ["showTools", 0, "showCamonetHull", (selectRandom [0, 1]), "showBags", 0, "showSLATHull", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // AWC 304 Nyx (Autocannon)
    case "I_LT_01_cannon_F": {
        [
            _vehicle,
            ["Indep_Olive", 1],
            ["showTools", 0, "showCamonetHull", (selectRandom [0, 1]), "showBags", 0, "showSLATHull", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // FV-720 Mora
    case "I_APC_tracked_03_cannon_F": {
        [
            _vehicle,
            ["EAF_01", 1],
            ["showBags", 0, "showBags2", 0, "showCamonetHull", (selectRandom [0, 1]), "showCamonetTurret", 1, "showTools", 0, "showSLATHull", (selectRandom [0, 1]), "showSLATTurret", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // BTR-K Kamysh
    case "O_APC_Tracked_02_cannon_F": {
        [_vehicle, _kamyshTextures] spawn {
            params ["_vehicle", "_textures"];

            private _customization = [
                _vehicle,
                false,
                ["showTracks", 0, "showCamonetHull", 1, "showBags", 0, "showSLATHull", (selectRandom [0, 1])]
            ] spawn BIS_fnc_initVehicle;

            waitUntil {sleep 0.1; scriptDone _customization};

            {
                _vehicle setObjectTextureGlobal [_forEachIndex, _x];
            } forEach _textures;
        };
    };

    // AMV-7 Marshall
    case "B_APC_Wheeled_01_cannon_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins2), 1],
            ["showBags", 1, "showCamonetHull", (selectRandom [0, 1]), "showCamonetTurret", 1, "showSLATHull", (selectRandom [0, 1]), "showSLATTurret", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };


    /****************/
    /**** SPAAGs ****/
    /****************/

    // ZSU-39 Tigris
    case "O_APC_Tracked_02_AA_F": {
        [_vehicle, _tigrisTextures] spawn {
            params ["_vehicle", "_textures"];

            private _customization = [
                _vehicle,
                false,
                ["showTracks", 0, "showCamonetHull", 1, "showCamonetTurret", (selectRandom [0, 1]), "showSLATHull", (selectRandom [0, 1])]
            ] spawn BIS_fnc_initVehicle;

            waitUntil {sleep 0.1; scriptDone _customization};

            {
                _vehicle setObjectTextureGlobal [_forEachIndex, _x];
            } forEach _textures;
        };
    };

    // IFV-6a Cheetah
    case "B_APC_Tracked_01_AA_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins2), 1],
            ["showCamonetTurret", (selectRandom [0, 1]), "showCamonetHull", (selectRandom [0, 1]), "showBags", 0]
        ] call BIS_fnc_initVehicle;
    };


    /**************/
    /**** APCs ****/
    /**************/

    // MSE-3 Marid
    case "O_APC_Wheeled_02_rcws_v2_F": {
        [_vehicle, _maridTextures] spawn {
            params ["_vehicle", "_textures"];

            private _customization = [
                _vehicle,
                false,
                ["showBags", 0, "showCanisters", 0, "showTools", 0, "showCamonetHull", 1, "showSLATHull", (selectRandom [0, 1])]
            ] spawn BIS_fnc_initVehicle;

            waitUntil {sleep 0.1; scriptDone _customization};

            {
                _vehicle setObjectTextureGlobal [_forEachIndex, _x];
            } forEach _textures;
        };
    };

    // Rhino MGS
    case "B_AFV_Wheeled_01_cannon_F": {
        [
            _vehicle,
            [(selectRandom _rhinoSkins), 1],
            ["showCamonetHull", (selectRandom [0, 1]), "showCamonetTurret", 1, "showSLATHull", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // Rhino MGS (Urban Purpose)
    case "B_AFV_Wheeled_01_up_cannon_F": {
        [
            _vehicle,
            [(selectRandom _rhinoSkins), 1],
            ["showCamonetHull", (selectRandom [0, 1]), "showCamonetTurret", 1, "showSLATHull", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;
    };

    // CRV-6e Bobcat
    case "B_APC_Tracked_01_CRV_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins2), 1],
            ["showAmmobox", 1, "showWheels", 1, "showCamonetHull", (selectRandom [0, 1]), "showBags", 1]
        ] call BIS_fnc_initVehicle;
    };


    /****************/
    /**** HEMTTs ****/
    /****************/

    // HEMTT (Ammo)
    case "B_Truck_01_ammo_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins1), 1]
        ] call BIS_fnc_initVehicle;
    };

    // HEMTT (Fuel)
    case "B_Truck_01_fuel_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins1), 1]
        ] call BIS_fnc_initVehicle;
    };

    // HEMTT (Repair)
    case "B_Truck_01_Repair_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins1), 1]
        ] call BIS_fnc_initVehicle;
    };

    // HEMTT (Medical)
    case "B_Truck_01_medical_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins1), 1]
        ] call BIS_fnc_initVehicle;
    };


    /***************/
    /**** MRAPs ****/
    /***************/

    // Strider HMG
    case "I_MRAP_03_hmg_F": {
        [
            _vehicle,
            ["Blufor", 1]
        ] call BIS_fnc_initVehicle;
    };

    // Strider GMG
    case "I_MRAP_03_gmg_F": {
        [
            _vehicle,
            ["Blufor", 1]
        ] call BIS_fnc_initVehicle;
    };

    // Hunter
    case "B_MRAP_01_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins1), 1]
        ] call BIS_fnc_initVehicle;
    };

    // Hunter HMG
    case "B_MRAP_01_hmg_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins1), 1]
        ] call BIS_fnc_initVehicle;
    };

    // Hunter GMG
    case "B_MRAP_01_gmg_F": {
        [
            _vehicle,
            [(selectRandom _bluforSkins1), 1]
        ] call BIS_fnc_initVehicle;
    };


    /**************/
    /**** Cars ****/
    /**************/

    // Qilin (AT)
    case "O_LSV_02_AT_F": {
        [
            _vehicle,
            ["Black", 1]
        ] call BIS_fnc_initVehicle;
    };

    // Qilin (Minigun)
    case "O_LSV_02_armed_F": {
        [
            _vehicle,
            ["Black", 1]
        ] call BIS_fnc_initVehicle;
    };

    // Offroad (HMG)
    case "B_G_Offroad_01_armed_F": {
        [
            _vehicle,
            [(selectRandom _offroadSkins), 1],
            ["HideDoor1", 0, "HideDoor2", 0, "HideDoor3", 0, "HideBackpacks", 0, "HideBumper1", 0, "HideBumper2", 1, "HideConstruction", 0]
        ] call BIS_fnc_initVehicle;
    };

    // Offroad
    case "B_G_Offroad_01_F": {
        [
            _vehicle,
            [(selectRandom _offroadSkins), 1],
            ["HideDoor1", 0, "HideDoor2", 0, "HideDoor3", 0, "HideBackpacks", 0, "HideBumper1", 0, "HideBumper2", 1, "HideConstruction", 0]
        ] call BIS_fnc_initVehicle;
    };

    // Offroad (Repair)
    case "B_G_Offroad_01_repair_F": {
        [
            _vehicle,
            [(selectRandom _offroadSkins), 1],
            ["BeaconsServicesStart", 0, "HideDoor1", 0, "HideDoor2", 0, "HideDoor3", (selectRandom [0, 1])]
        ] call BIS_fnc_initVehicle;

        _vehicle addEventHandler ["GetOut", {
            params ["_vehicle", "_role", "_unit", "_turret"];

            if (_role == "driver") then {
                [_vehicle, {
                    params ["_vehicle"];

                    if ((getCustomSoundController [_vehicle, "CustomSoundController1"]) > 0.5) then {
                        [_vehicle, "CustomSoundController1", 0, 0.4] remoteExec ["BIS_fnc_setCustomSoundController"];
                    };
                }] remoteExec ["call", _vehicle];
            };
        }];
    };

    // Offroad (AT)
    case "B_G_Offroad_01_AT_F": {
        [
            _vehicle,
            [(selectRandom _offroadSkins), 1],
            ["HideDoor1", 0, "HideDoor2", 0, "HideDoor3", 0, "HideBackpacks", 0, "HideBumper1", 0, "HideBumper2", 1, "HideConstruction", 0]
        ] call BIS_fnc_initVehicle;
    };

    // MB 4WD (AT)
    case "I_C_Offroad_02_AT_F": {
        private _doors = (selectRandom [0, 1]);
        private _rear = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _mb4wbSkins), 1],
            ["hideLeftDoor", _doors, "hideRightDoor", _doors, "hideRearDoor", _rear, "hideFenders", 0, "hideHeadSupportFront", 0, "hideSpareWheel", 0]
        ] call BIS_fnc_initVehicle;

    };

    // MB 4WD (LMG)
    case "I_C_Offroad_02_LMG_F": {
        private _doors = (selectRandom [0, 1]);
        private _rear = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _mb4wbSkins), 1],
            ["hideLeftDoor", _doors, "hideRightDoor", _doors, "hideRearDoor", _rear, "hideFenders", 0, "hideHeadSupportFront", 0, "hideSpareWheel", 0]
        ] spawn BIS_fnc_initVehicle;
    };

    // Van (Services)
    case "C_Van_02_service_F": {
        [
            _vehicle,
            [(selectRandom _vanservicesSkins), 1],
            ["Door_1_source", 0, "Door_2_source", 0, "Door_3_source", 0, "Door_4_source", 0, "Hide_Door_1_source", 0, "Hide_Door_2_source", 0, "Hide_Door_3_source", 0, "Hide_Door_4_source", 0, "lights_em_hide", 0, "ladder_hide", 1, "spare_tyre_holder_hide", 1, "spare_tyre_hide", 1, "reflective_tape_hide", 1, "roof_rack_hide", 1, "LED_lights_hide", 0, "sidesteps_hide", 0, "rearsteps_hide", 0, "side_protective_frame_hide", 1, "front_protective_frame_hide", 1, "beacon_front_hide", 0, "beacon_rear_hide", 0]
        ] call BIS_fnc_initVehicle;

        _vehicle addEventHandler ["GetOut", {
            params ["_vehicle", "_role", "_unit", "_turret"];

            if (_role == "driver") then {
                [_vehicle, {
                    params ["_vehicle"];

                    if ((getCustomSoundController [_vehicle, "CustomSoundController1"]) > 0.5) then {
                        [_vehicle, "CustomSoundController1", 0, 0.4] remoteExec ["BIS_fnc_setCustomSoundController"];
                    };
                }] remoteExec ["call", _vehicle];
            };
        }];
    };

    // Van (Ambulance)
    case "C_Van_02_medevac_F": {
        [
            _vehicle,
            [(selectRandom _vanbulanceSkins), 1],
            ["Door_1_source", 0, "Door_2_source", 0, "Door_3_source", 0, "Door_4_source", 0, "Hide_Door_1_source", 0, "Hide_Door_2_source", 0, "Hide_Door_3_source", 0, "Hide_Door_4_source", 0, "lights_em_hide", 0, "ladder_hide", 1, "spare_tyre_holder_hide", 1, "spare_tyre_hide", 1, "reflective_tape_hide", 0, "roof_rack_hide", 1, "LED_lights_hide", 0, "sidesteps_hide", 0, "rearsteps_hide", 0, "side_protective_frame_hide", 1, "front_protective_frame_hide", 1, "beacon_front_hide", 0, "beacon_rear_hide", 0]
        ] call BIS_fnc_initVehicle;

        _vehicle addEventHandler ["GetOut", {
            params ["_vehicle", "_role", "_unit", "_turret"];

            if (_role == "driver") then {
                [_vehicle, {
                    params ["_vehicle"];

                    if ((getCustomSoundController [_vehicle, "CustomSoundController1"]) > 0.5) then {
                        [_vehicle, "CustomSoundController1", 0, 0.4] remoteExec ["BIS_fnc_setCustomSoundController"];
                    };
                }] remoteExec ["call", _vehicle];
            };
        }];
    };

    // Prowler (Light)
    case "B_CTRG_LSV_01_light_F": {
        private _doorsFront = (selectRandom [0, 1]);
        private _doorsRear = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _prowlerSkins), 1],
            ["HideDoor1", _doorsFront, "HideDoor2", _doorsRear, "HideDoor3", _doorsFront, "HideDoor4", _doorsRear]
        ] call BIS_fnc_initVehicle;
    };

    // Prowler (Unarmed)
    case "B_LSV_01_unarmed_F": {
        private _doorsFront = (selectRandom [0, 1]);
        private _doorsRear = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _prowlerSkins), 1],
            ["HideDoor1", _doorsFront, "HideDoor2", _doorsRear, "HideDoor3", _doorsFront, "HideDoor4", _doorsRear]
        ] call BIS_fnc_initVehicle;
    };

    // Prowler (HMG)
    case "B_LSV_01_armed_F": {
        private _doorsFront = (selectRandom [0, 1]);
        private _doorsRear = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _prowlerSkins), 1],
            ["HideDoor1", _doorsFront, "HideDoor2", _doorsRear, "HideDoor3", _doorsFront, "HideDoor4", _doorsRear]
        ] call BIS_fnc_initVehicle;
    };

    // Prowler (AT)
    case "B_LSV_01_AT_F": {
        private _doorsFront = (selectRandom [0, 1]);
        private _doorsRear = (selectRandom [0, 1]);

        [
            _vehicle,
            [(selectRandom _prowlerSkins), 1],
            ["HideDoor1", _doorsFront, "HideDoor2", _doorsRear, "HideDoor3", _doorsFront, "HideDoor4", _doorsRear]
        ] call BIS_fnc_initVehicle;
    };

    // Quadbike
    case "B_Quadbike_01_F": {
        [
            _vehicle,
            [(selectRandom _quadSkins), 1]
        ] call BIS_fnc_initVehicle;
    };

    // Kart
    case "C_Kart_01_F": {
        [
            _vehicle,
            [(selectRandom _kartSkins), 1]
        ] call BIS_fnc_initVehicle;

        _vehicle addWeapon "TruckHorn3";
    };


    /***************/
    /**** Boats ****/
    /***************/

    // Speedboat Minigun
    case "B_Boat_Armed_01_minigun_F": {
        [
            _vehicle,
            [(selectRandom _speedboatSkins), 1]
        ] call BIS_fnc_initVehicle;
    };

    // Assault Boat
    case "B_Boat_Transport_01_F": {
        [
            _vehicle,
            [(selectRandom _assaultboatSkins), 1]
        ] call BIS_fnc_initVehicle;
    };

    // Motorboat
    case "C_Boat_Civil_01_F": {
        [
            _vehicle,
            [(selectRandom _motorboatSkins), 1]
        ] call BIS_fnc_initVehicle;
    };

    // Water Scooter
    case "C_Scooter_Transport_01_F": {
        [
            _vehicle,
            [(selectRandom _waterscooterSkins), 1]
        ] call BIS_fnc_initVehicle;
    };

    // SDV
    case "B_SDV_01_F": {
        _vehicle setObjectTextureGlobal [0, (selectRandom _sdvTextures)];
    };
};


// Setup DataLink
if (local _vehicle) then {
    _vehicle call AW_fnc_vehicleDataLinkSettings;
} else {
    _vehicle remoteExec ["AW_fnc_vehicleDataLinkSettings", _vehicle];
};
