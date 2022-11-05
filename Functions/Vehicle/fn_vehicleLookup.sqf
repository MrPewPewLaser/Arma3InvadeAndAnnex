/*
 * Author: Whigital
 *
 * Lookup vehicle family key and return random/weighted classname
 * for vehicle creation. Used in respawn script to randomize FOB vehicles.
 *
 */

params ["_vehKey"];

private _vehType = nil;
private _typeDesc = nil;

switch (_vehKey) do {

    // Aircraft
    case "JET_CAS": {
        _vehType = selectRandomWeighted [
            "B_Plane_Fighter_01_F", 1,
            "B_Plane_CAS_01_dynamicLoadout_F", 3,
            "I_Plane_Fighter_03_dynamicLoadout_F", 2
        ];

        _typeDesc = "Attack Jet (CAS)";
    };

    // Aircraft prairie fire
    case "JET_CAS_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_air_f4b_usmc_cas", 2,
            "vn_b_air_f100d_cas", 2
        ];

        _typeDesc = "Attack Jet (CAS)";
    };

    case "JET_CAP": {
        _vehType = selectRandomWeighted [
            "I_Plane_Fighter_04_F", 1,
            "I_Plane_Fighter_03_dynamicLoadout_F", 2
        ];

        _typeDesc = "Fighter Jet (CAP)";
    };

    // Heli CAS
    case "HELI_CAS": {
        _vehType = selectRandomWeighted [
            "O_Heli_Attack_02_dynamicLoadout_black_F", 1,
            "B_Heli_Attack_01_dynamicLoadout_F", 2
        ];

        _typeDesc = "Heli Gunship (CAS)";
    };

    case "HELI_LCAS": {
        _vehType = selectRandomWeighted [
            "B_Heli_Light_01_dynamicLoadout_F", 2,
            "I_Heli_light_03_dynamicLoadout_F", 3,
            "O_Heli_Light_02_dynamicLoadout_F", 1
        ];

        _typeDesc = "Attack Heli (Light)";
    };

    // Heli Transport
    case "HELI_MED": {
        _vehType = selectRandomWeighted [
            "B_Heli_Transport_01_F", 2,
            "I_Heli_light_03_unarmed_F", 4,
            "O_Heli_Light_02_unarmed_F", 1
        ];

        _typeDesc = "Heli (Medium)";
    };

    case "HELI_BIG": {
        _vehType = selectRandomWeighted [
            "B_Heli_Transport_03_unarmed_F", 3,
            "O_Heli_Transport_04_covered_black_F", 1,
            "I_Heli_Transport_02_F", 2
        ];

        _typeDesc = "Heli (Heavy)";
    };

    //prairie fire gunships
    case "HELI_GUNSHIP_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_air_ah1g_03", 1,
            "vn_b_air_ah1g_04", 1,
            "vn_b_air_ah1g_05", 1,
            "vn_b_air_ah1g_01", 1,
            "vn_b_air_ah1g_08", 1,
            "vn_b_air_ah1g_09", 1,
            "vn_b_air_ah1g_10", 1,
            "vn_b_air_ah1g_06", 1
        ];

        _typeDesc = "Heli Gunship (CAS)";
    };

    //Heavy CAS heli prairie fire
    case "HELI_HCAS_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_air_uh1e_02_04", 1,
            "vn_b_air_uh1c_05_01", 1,
            "vn_b_air_uh1c_03_01", 1,
            "vn_b_air_uh1d_03_06", 1,
            "vn_b_air_uh1c_06_01", 1
        ];

        _typeDesc = "Attack Heli (HCAS)";
    };

    //CAS heli prairie fire
    case "HELI_CAS_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_air_uh1c_01_01", 2,
            "vn_b_air_uh1c_04_01", 2,
            "vn_b_air_uh1c_02_01", 2,
            "vn_b_air_uh1e_01_04", 2,
            "vn_b_air_ch34_04_01", 1,
            "vn_b_air_ch34_04_04", 1,
            "vn_b_air_ch34_04_02", 1
        ];

        _typeDesc = "Attack Heli (CAS)";
    };

    //Light CAS heli prairie fire
    case "HELI_LCAS_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_air_oh6a_03", 1,
            "vn_b_air_oh6a_02", 1,
            "vn_b_air_oh6a_05", 1,
            "vn_b_air_oh6a_04", 1,
            "vn_b_air_oh6a_07", 1
        ];

        _typeDesc = "Attack Heli (LCAS)";
    };

    // Heli Transport PF
    case "HELI_BIG_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_air_ch34_03_01", 3,
            "vn_b_air_ch34_01_01", 1
        ];

        _typeDesc = "Heli (Heavy)";
    };
    case "HELI_MED_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_air_uh1d_02_01", 1,
            "vn_b_air_uh1c_07_01", 1,
            "vn_b_air_uh1c_07_06", 1,
            "vn_b_air_uh1d_02_06", 1
        ];

        _typeDesc = "Heli (Medium)";
    };
    case "HELI_SML_PF": {
        _vehType = selectRandomWeighted [
             "vn_b_air_oh6a_01", 1
        ];

        _typeDesc = "Heli (Small)";
    };

    // Armor
    case "ARMOR_TANK": {
        _vehType = selectRandomWeighted [
            "B_MBT_01_TUSK_F", 1,
            "B_MBT_01_cannon_F", 2
        ];

        _typeDesc = "Armor (Tank)";
    };

    case "ARMOR_TANK_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_armor_m41_01_01", 1,
            "vn_b_armor_m41_01_02", 1
        ];

        _typeDesc = "Armor (Tank)";
    };

    case "ARMOR_IFV": {
        _vehType = selectRandom [
            "I_APC_Wheeled_03_cannon_F",
            "B_APC_Wheeled_01_cannon_F"
        ];

        _typeDesc = "Armor (IFV)";
    };


    // Cars
    case "CAR_MRAP": {
        _vehType = selectRandomWeighted [
            "B_MRAP_01_F", 3,
            "B_MRAP_01_hmg_F", 2,
            "B_MRAP_01_gmg_F", 1
        ];

        _typeDesc = "Car (MRAP)";
    };

    case "CAR_LSV": {
        _vehType = selectRandomWeighted [
            "B_LSV_01_armed_F", 1,
            "B_LSV_01_unarmed_F", 2,
            "B_CTRG_LSV_01_light_F", 2
        ];

        _typeDesc = "Car (LSV)";
    };

    case "SUPPORT_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_wheeled_m54_mg_03", 2,
            "vn_b_wheeled_m54_mg_01", 2,
            "vn_b_wheeled_m54_mg_02", 2,
            "vn_b_armor_m113_acav_04", 1,
            "vn_b_armor_m113_acav_02", 1,
            "vn_b_armor_m113_acav_05", 1,
            "vn_b_armor_m113_acav_06", 1,
            "vn_b_armor_m113_acav_04_rok_army", 1,
            "vn_b_armor_m113_acav_02_rok_army", 1,
            "vn_b_armor_m113_acav_05_rok_army", 1,
            "vn_b_armor_m113_acav_06_rok_army", 1
        ];

        _typeDesc = "Support vehicle";
    };

    case "TRANSPORT_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_armor_m113_01", 1,
            "vn_b_armor_m113_acav_03", 1,
            "vn_b_armor_m113_acav_01", 1,
            "vn_b_armor_m113_01_rok_army", 1,
            "vn_b_armor_m113_acav_01_rok_army", 1,
            "vn_b_armor_m113_acav_03_rok_army", 1,
            "vn_b_armor_m113_01_aus_army", 1
        ];

        _typeDesc = "Transport";
    };

    case "SUPPORT_LIGHT_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_wheeled_m151_mg_03", 1,
            "vn_b_wheeled_m151_mg_06", 1,
            "vn_b_wheeled_m151_mg_05", 1
        ];

        _typeDesc = "Light support vehicle";
    };

    case "TRANSPORT_LIGHT_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_wheeled_m151_02", 1,
            "vn_b_wheeled_m151_mg_02", 1,
            "vn_b_wheeled_m151_mg_04", 1,
            "vn_b_wheeled_m151_01", 1,
            "vn_b_wheeled_m54_01", 1,
            "vn_b_wheeled_m54_02", 1
        ];

        _typeDesc = "Light transport";
    };

    case "BOAT_PF": {
        _vehType = selectRandomWeighted [
            "vn_b_boat_12_04", 2,
            "vn_b_boat_13_04", 2,
            "vn_b_boat_06_02", 2,
            "vn_b_boat_05_02", 2,
            "vn_b_boat_10_01", 1,
            "vn_b_boat_09_01", 1,
            "vn_b_boat_11_01", 1
        ];

        _typeDesc = "Boat";
    };
};

[_vehType, _typeDesc]
