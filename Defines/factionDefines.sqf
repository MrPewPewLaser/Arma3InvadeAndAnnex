/*
 * Author: Whigital
 * Description:
 * Faction / Group / Unit / Vehicle definitions
 *
 */

/*

format:

[<faction_key>, <hash>] (HashMap)
    ["#name", <faction_name>] (HashMap)
    ["#side", <faction_side>] (HashMap)
    ["#infantry", <hash>] (HashMap)
        ["#squads", <array>] (HashMap)
        ["#specop_squads", <array>] (HashMap)
        ["#viper_squads", <array>] (HashMap)
        ["#teams", <array>] (HashMap)
        ["#specop_teams", <array>] (HashMap)
        ["#viper_teams", <array>] (HashMap)
        ["#at_teams", <array>] (HashMap)
        ["#aa_teams", <array>] (HashMap)
        ["#aa_teams", <array>] (HashMap)
        ["#sniper_teams", <array>] (HashMap)
    ["#vehicles", <hash>] (HashMap)
        ["#mraps", <array>] (HashMap)
        ["#ifvs", <array>] (HashMap)
        ["#spaas", <array>] (HashMap)
        ["#mbts", <array>] (HashMap)
        ["#helis", <array>] (HashMap)
        ["#cas_helis", <array>] (HashMap)
        ["#jets", <array>] (HashMap)
*/

InA_FactionMappingsDefined = false;

InA_FactionMappings = createHashMap;

private _infSquads = [];
private _infTeams = [];
private _sfSquads = [];
private _vpSquads = [];
private _sfTeams = [];
private _vpTeams = [];
private _atTeams = [];
private _aaTeams = [];
private _srTeams = [];

private _vehMRAPs = [];
private _vehIFVs = [];
private _vehSPAAs = [];
private _vehMBTs = [];
private _vehHelis = [];
private _vehHeliCAS = [];
private _vehJets = [];

private _factionMapping = createHashMap;
private _infantryMappings = createHashMap;
private _vehicleMappings = createHashMap;


//////////////
//// CSAT ////
//////////////

_factionMapping insert [
    ["#name", "CSAT"],
    ["#side", east],
    ["#aux_factions", ["AAF", "FIA", "SYND"]],
    ["#aux_faction_weights", [1, 1.5, 1.5]],
    ["#indep_factions", ["AAF"]],
    ["#guer_factions", ["FIA", "SYND"]]
];


//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["O_officer_F", "O_T_Officer_F"]],
    ["#squadleaders", ["O_Soldier_SL_F", "O_T_Soldier_SL_F","O_SoldierU_SL_F"]],
    ["#teamleaders", ["O_Soldier_TL_F", "O_T_Soldier_TL_F","O_soldierU_TL_F"]],
    ["#riflemen", ["O_Soldier_F", "O_T_Soldier_F", "O_soldierU_F"]],
    ["#lats", ["O_Soldier_LAT_F", "O_T_Soldier_LAT_F", "O_soldierU_LAT_F"]],
    ["#grenadiers", ["O_Soldier_GL_F", "O_T_Soldier_GL_F", "O_SoldierU_GL_F"]],
    ["#machinegunners", ["O_Soldier_AR_F", "O_T_Soldier_AR_F", "O_soldierU_AR_F"]],
    ["#heavygunners", ["O_HeavyGunner_F", "O_Urban_HeavyGunner_F"]],
    ["#marksmen", ["O_soldier_M_F", "O_T_Soldier_M_F", "O_soldierU_M_F"]],
    ["#sharpshooters", ["O_Sharpshooter_F", "O_Urban_Sharpshooter_F"]],
    ["#snipers", ["O_sniper_F", "O_T_Sniper_F"]],
    ["#spotters", ["O_spotter_F", "O_T_Spotter_F"]],
    ["#ats", ["O_Soldier_AT_F", "O_T_Soldier_AT_F", "O_soldierU_AT_F"]],
    ["#hats", ["O_Soldier_HAT_F", "O_T_Soldier_HAT_F"]],
    ["#aas", ["O_Soldier_AA_F", "O_T_Soldier_AA_F", "O_soldierU_AA_F"]],
    ["#medics", ["O_medic_F", "O_T_Medic_F", "O_soldierU_medic_F"]],
    ["#demos", ["O_soldier_exp_F", "O_T_Soldier_Exp_F", "O_soldierU_exp_F"]],
    ["#engineers", ["O_engineer_F", "O_T_Engineer_F", "O_engineer_U_F"]],
    ["#paras", ["O_soldier_PG_F", "O_T_Soldier_PG_F"]],
    ["#crews", ["O_crew_F", "O_T_Crew_F"]],
    ["#heli_pilots", ["O_helipilot_F", "O_T_Helipilot_F"]],
    ["#heli_crews", ["O_helicrew_F", "O_T_Helicrew_F"]],
    ["#pilots", ["O_Pilot_F", "O_T_Pilot_F"]],
    ["#repair", ["O_soldier_repair_F", "O_T_Soldier_Repair_F", "O_soldierU_repair_F"]],
    ["#ammos", ["O_Soldier_A_F", "O_T_Soldier_A_F", "O_soldierU_A_F"]],
    ["#aats", ["O_Soldier_AAT_F", "O_T_Soldier_AAT_F", "O_soldierU_AAT_F"]],
    ["#aaas", ["O_Soldier_AAA_F", "O_T_Soldier_AAA_F", "O_soldierU_AAA_F"]],
    ["#ahats", ["O_Soldier_AHAT_F", "O_T_Soldier_AHAT_F"]],

    ["#civs", ["C_man_1","C_man_polo_1_F_euro","C_man_polo_2_F_euro","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_6_F","C_man_shorts_4_F_asia"]]
];

// Squads
_infSquads = [
    ["O_Soldier_SL_F", "O_medic_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_Soldier_TL_F", "O_engineer_F", "O_soldier_M_F"],                  2,
    ["O_Soldier_SL_F", "O_medic_F", "O_HeavyGunner_F", "O_Sharpshooter_F", "O_Soldier_LAT_F", "O_Soldier_TL_F", "O_Soldier_GL_F"],                              1.75,

    ["O_Soldier_TL_F", "O_medic_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_soldier_M_F"],                                                    2.5,
    ["O_Soldier_TL_F", "O_medic_F", "O_HeavyGunner_F", "O_Sharpshooter_F", "O_Soldier_LAT_F", "O_Soldier_GL_F"],                                                2.25,

    ["O_Soldier_TL_F", "O_medic_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_Soldier_LAT_F"],                                                                     2.6,
    ["O_Soldier_TL_F", "O_medic_F", "O_HeavyGunner_F", "O_Sharpshooter_F", "O_Soldier_LAT_F"],                                                                  2.3,


    ["O_T_Soldier_SL_F", "O_T_Medic_F", "O_T_Soldier_Exp_F", "O_T_soldier_mine_F", "O_T_Soldier_A_F", "O_T_Soldier_F", "O_T_Soldier_AR_F"],                     1.75,
    ["O_T_Soldier_SL_F", "O_T_Medic_F", "O_T_Soldier_AR_F", "O_T_Soldier_GL_F", "O_T_Soldier_LAT_F", "O_T_Soldier_TL_F", "O_T_Engineer_F", "O_T_Soldier_M_F"],  2,

    ["O_T_Soldier_TL_F", "O_T_Medic_F", "O_T_Soldier_Exp_F", "O_T_soldier_mine_F", "O_T_Soldier_A_F", "O_T_Soldier_AR_F"],                                      2.5,
    ["O_T_Soldier_TL_F", "O_T_Medic_F", "O_T_Soldier_AR_F", "O_T_Soldier_LAT_F", "O_T_Engineer_F", "O_T_Soldier_M_F"],                                          2.25,

    ["O_T_Soldier_TL_F", "O_T_Medic_F", "O_T_Soldier_Exp_F", "O_T_Soldier_A_F", "O_T_Soldier_AR_F"],                                                            2.6,
    ["O_T_Soldier_TL_F", "O_T_Medic_F", "O_T_Soldier_AR_F", "O_T_Soldier_LAT_F", "O_T_Soldier_M_F"],                                                            2.3,


    ["O_SoldierU_SL_F", "O_soldierU_medic_F", "O_soldierU_AR_F", "O_SoldierU_GL_F", "O_soldierU_LAT_F", "O_soldierU_TL_F", "O_engineer_U_F", "O_soldierU_M_F"], 2,
    ["O_SoldierU_SL_F", "O_soldierU_medic_F", "O_Urban_HeavyGunner_F", "O_Urban_Sharpshooter_F", "O_soldierU_LAT_F", "O_soldierU_TL_F", "O_SoldierU_GL_F"],     1.75,

    ["O_soldierU_TL_F", "O_soldierU_medic_F", "O_soldierU_AR_F", "O_SoldierU_GL_F", "O_soldierU_LAT_F", "O_soldierU_M_F"],                                      2.5,
    ["O_soldierU_TL_F", "O_soldierU_medic_F", "O_Urban_HeavyGunner_F", "O_Urban_Sharpshooter_F", "O_soldierU_LAT_F", "O_SoldierU_GL_F"],                        2.25,

    ["O_soldierU_TL_F", "O_soldierU_medic_F", "O_soldierU_AR_F", "O_soldierU_LAT_F", "O_soldierU_M_F"],                                                         2.6,
    ["O_soldierU_TL_F", "O_soldierU_medic_F", "O_Urban_HeavyGunner_F", "O_Urban_Sharpshooter_F", "O_soldierU_LAT_F"],                                           2.3
];

_sfSquads = [
    ["O_recon_TL_F", "O_recon_medic_F", "O_Pathfinder_F", "O_recon_exp_F", "O_recon_LAT_F", "O_recon_M_F", "O_recon_JTAC_F"],           1.25,
    ["O_T_Recon_TL_F", "O_T_Recon_Medic_F", "O_T_Recon_F", "O_T_Recon_Exp_F", "O_T_Recon_LAT_F", "O_T_Recon_JTAC_F", "O_T_Recon_M_F"],  1.25,

    ["O_recon_TL_F", "O_recon_medic_F", "O_Pathfinder_F", "O_recon_exp_F", "O_recon_M_F", "O_recon_JTAC_F"],                            1.5,
    ["O_T_Recon_TL_F", "O_T_Recon_Medic_F", "O_T_Recon_F", "O_T_Recon_Exp_F", "O_T_Recon_JTAC_F", "O_T_Recon_M_F"],                     1.5
];

_vpSquads = [
    ["O_V_Soldier_TL_hex_F", "O_V_Soldier_Medic_hex_F", "O_V_Soldier_JTAC_hex_F", "O_V_Soldier_M_hex_F", "O_V_Soldier_LAT_hex_F", "O_V_Soldier_Exp_hex_F"],         1,
    ["O_V_Soldier_TL_ghex_F", "O_V_Soldier_Medic_ghex_F", "O_V_Soldier_JTAC_ghex_F", "O_V_Soldier_M_ghex_F", "O_V_Soldier_LAT_ghex_F", "O_V_Soldier_Exp_ghex_F"],   1
];

// Teams
_infTeams = [
    ["O_Soldier_TL_F", "O_medic_F", "O_Soldier_AR_F", "O_Soldier_LAT_F"],                           2,
    ["O_Soldier_TL_F", "O_medic_F", "O_Soldier_GL_F", "O_soldier_M_F"],                             2,
    ["O_Soldier_TL_F", "O_medic_F", "O_HeavyGunner_F", "O_Sharpshooter_F"],                         1.75,

    ["O_T_Soldier_TL_F", "O_T_Medic_F", "O_T_Soldier_AR_F", "O_T_Soldier_LAT_F"],                   2,
    ["O_T_Soldier_TL_F", "O_T_Medic_F", "O_T_Soldier_GL_F", "O_T_Soldier_M_F"],                     2,
    ["O_T_Soldier_TL_F", "O_T_Medic_F", "O_T_Soldier_Exp_F", "O_T_soldier_mine_F"],                 1.75,

    ["O_soldierU_TL_F", "O_soldierU_medic_F", "O_soldierU_AR_F", "O_soldierU_LAT_F"],               2,
    ["O_soldierU_TL_F", "O_soldierU_medic_F", "O_SoldierU_GL_F", "O_soldierU_M_F"],                 2,
    ["O_soldierU_TL_F", "O_soldierU_medic_F", "O_Urban_HeavyGunner_F", "O_Urban_Sharpshooter_F"],   1.75
];

_sfTeams = [
    ["O_recon_TL_F", "O_recon_medic_F", "O_Pathfinder_F", "O_recon_M_F"],           1.25,
    ["O_recon_TL_F", "O_recon_medic_F", "O_recon_exp_F", "O_recon_LAT_F"],          1.25,
    ["O_recon_TL_F", "O_recon_medic_F", "O_recon_JTAC_F", "O_recon_exp_F"],         1.25,

    ["O_T_Recon_TL_F", "O_T_Recon_Medic_F", "O_T_Recon_LAT_F", "O_T_Recon_M_F"],    1.25,
    ["O_T_Recon_TL_F", "O_T_Recon_Medic_F", "O_T_Recon_F", "O_T_Recon_JTAC_F"],     1.25,
    ["O_T_Recon_TL_F", "O_T_Recon_Medic_F", "O_T_Recon_Exp_F", "O_T_Recon_F"],      1.25
];

_vpTeams = [
    ["O_V_Soldier_TL_hex_F", "O_V_Soldier_Medic_hex_F", "O_V_Soldier_LAT_hex_F", "O_V_Soldier_Exp_hex_F"],      1,
    ["O_V_Soldier_TL_hex_F", "O_V_Soldier_Medic_hex_F", "O_V_Soldier_JTAC_hex_F", "O_V_Soldier_M_hex_F"],       1,

    ["O_V_Soldier_TL_ghex_F", "O_V_Soldier_Medic_ghex_F", "O_V_Soldier_LAT_ghex_F", "O_V_Soldier_Exp_ghex_F"],  1,
    ["O_V_Soldier_TL_ghex_F", "O_V_Soldier_Medic_ghex_F", "O_V_Soldier_JTAC_ghex_F", "O_V_Soldier_M_ghex_F"],   1
];

_atTeams = [
    ["O_Soldier_TL_F", "O_Soldier_AT_F", "O_Soldier_AT_F", "O_Soldier_AAT_F"],              1.5,
    ["O_Soldier_TL_F", "O_Soldier_HAT_F", "O_Soldier_HAT_F", "O_Soldier_AHAT_F"],           1.25,
    ["O_T_Soldier_TL_F", "O_T_Soldier_AT_F", "O_T_Soldier_AT_F", "O_T_Soldier_AAT_F"],      1.5,
    ["O_T_Soldier_TL_F", "O_T_Soldier_HAT_F", "O_T_Soldier_HAT_F", "O_T_Soldier_AHAT_F"],   1.25,
    ["O_soldierU_TL_F", "O_soldierU_AT_F", "O_soldierU_AT_F", "O_soldierU_AAT_F"],          1.5
];

_aaTeams = [
    ["O_Soldier_TL_F", "O_Soldier_AA_F", "O_Soldier_AA_F", "O_Soldier_AAA_F"],          1.5,
    ["O_T_Soldier_TL_F", "O_T_Soldier_AA_F", "O_T_Soldier_AA_F", "O_T_Soldier_AAA_F"],  1.5,
    ["O_soldierU_TL_F", "O_soldierU_AA_F", "O_soldierU_AA_F", "O_soldierU_AAA_F"],      1.5
];

_srTeams = [
    ["O_sniper_F", "O_spotter_F"], 0.75,
    ["O_T_Sniper_F", "O_T_Spotter_F"], 0.75
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#specop_squads", _sfSquads]];
_infantryMappings insert [["#viper_squads", _vpSquads]];
_infantryMappings insert [["#teams", _infTeams]];
_infantryMappings insert [["#specop_teams", (_sfTeams + _vpTeams)]];
_infantryMappings insert [["#viper_teams", _vpTeams]];
_infantryMappings insert [["#at_teams", _atTeams]];
_infantryMappings insert [["#aa_teams", _aaTeams]];
_infantryMappings insert [["#sniper_teams", _srTeams]];


//// Vehicles ////

// MRAPs
_vehMRAPs = [
    "O_MRAP_02_hmg_F",          3,
    "O_MRAP_02_gmg_F",          2.25,
    "O_LSV_02_armed_F",         2.75,
    "O_G_Offroad_01_armed_F",   2.5
];

// IFVs
_vehIFVs = [
    "O_APC_Wheeled_02_rcws_v2_F",   1.75,
    "O_APC_Tracked_02_cannon_F",    2,
    "I_APC_tracked_03_cannon_F",    1.75,
    "I_APC_Wheeled_03_cannon_F",    2,
    "I_LT_01_AT_F",                 1.5,
    "I_LT_01_cannon_F",             1.5
];

// AAs
_vehSPAAs = [
    "O_APC_Tracked_02_AA_F",    2,
    "I_LT_01_AA_F",             0.5
];

// MBTs
_vehMBTs = [
    "O_MBT_02_cannon_F",    1,
    "O_MBT_04_cannon_F",    0.85,
    "O_MBT_04_command_F",   0.75,
    "I_MBT_03_cannon_F",    0.5
];

// Helis
_vehHelis = [
    "O_Heli_Attack_02_dynamicLoadout_F",    0.5,
    "O_Heli_Light_02_dynamicLoadout_F",     0.75,
    "I_Heli_light_03_dynamicLoadout_F",     0.75,
    "I_Heli_Transport_02_F",                1,
    "O_Heli_Light_02_unarmed_F",            1,
    "I_Heli_light_03_unarmed_F",            1,
    "O_Heli_Transport_04_bench_F",          1,
    "O_Heli_Transport_04_covered_F",        1
];

// Heli CAS
_vehHeliCAS = [
    "O_Heli_Attack_02_dynamicLoadout_F",    0.5,
    "O_Heli_Light_02_dynamicLoadout_F",     1,
    "I_Heli_light_03_dynamicLoadout_F",     1
];

// Jets
_vehJets = [
    "O_Plane_CAS_02_dynamicLoadout_F",      3,
    "I_Plane_Fighter_03_dynamicLoadout_F",  3,
    "I_Plane_Fighter_04_F",                 2,
    "O_Plane_Fighter_02_F",                 1,
    "O_Plane_Fighter_02_Stealth_F",         1
];


_vehicleMappings insert [["#mraps", _vehMRAPs]];
_vehicleMappings insert [["#ifvs", _vehIFVs]];
_vehicleMappings insert [["#spaas", _vehSPAAs]];
_vehicleMappings insert [["#mbts", _vehMBTs]];
_vehicleMappings insert [["#helis", _vehHelis]];
_vehicleMappings insert [["#cas_helis", _vehHeliCAS]];
_vehicleMappings insert [["#jets", _vehJets]];


_factionMapping insert [
    ["#infantry", _infantryMappings],
    ["#vehicles", _vehicleMappings]
];

InA_FactionMappings insert [["CSAT", _factionMapping]];


/////////////
//// AAF ////
/////////////

_factionMapping = createHashMap;
_infantryMappings = createHashMap;
_vehicleMappings = createHashMap;

_factionMapping insert [
    ["#name", "AAF"],
    ["#side", independent],
    ["#aux_factions", ["CSAT", "FIA", "SYND"]],
    ["#aux_faction_weights", [1, 1.5, 1.5]],
    ["#indep_factions", ["CSAT"]],
    ["#guer_factions", ["FIA", "SYND"]]
];


//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["I_officer_F"]],
    ["#squadleaders", ["I_Soldier_SL_F"]],
    ["#teamleaders", ["I_Soldier_TL_F"]],
    ["#riflemen", ["I_soldier_F"]],
    ["#lats", ["I_Soldier_LAT_F", "I_Soldier_LAT2_F"]],
    ["#grenadiers", ["I_Soldier_GL_F"]],
    ["#machinegunners", ["I_Soldier_AR_F"]],
    ["#heavygunners", ["I_Soldier_AR_F"]],
    ["#marksmen", ["I_Soldier_M_F"]],
    ["#sharpshooters", ["I_Soldier_M_F"]],
    ["#snipers", ["I_Sniper_F"]],
    ["#spotters", ["I_Spotter_F"]],
    ["#ats", ["I_Soldier_AT_F"]],
    ["#aas", ["I_Soldier_AA_F"]],
    ["#medics", ["I_medic_F"]],
    ["#demos", ["I_Soldier_exp_F"]],
    ["#engineers", ["I_engineer_F"]],
    ["#paras", ["I_soldier_F"]],
    ["#crews", ["I_crew_F"]],
    ["#heli_pilots", ["I_helipilot_F"]],
    ["#heli_crews", ["I_helicrew_F"]],
    ["#pilots", ["I_pilot_F"]],
    ["#repair", ["I_Soldier_repair_F"]],
    ["#ammos", ["I_Soldier_A_F"]],
    ["#aats", ["I_Soldier_AAT_F"]],
    ["#aaas", ["I_Soldier_AAA_F"]],
    ["#ahats", ["I_Soldier_AAT_F"]],

    ["#civs", ["C_man_1","C_man_polo_1_F_euro","C_man_polo_2_F_euro","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_6_F","C_man_shorts_4_F_asia"]]
];

// Squads
_infSquads = [
    ["I_Soldier_SL_F", "I_medic_F", "I_Soldier_AR_F", "I_Soldier_GL_F", "I_Soldier_LAT_F", "I_Soldier_TL_F", "I_engineer_F", "I_Soldier_M_F"],      2,
    ["I_Soldier_SL_F", "I_medic_F", "I_Soldier_exp_F", "I_Soldier_A_F", "I_Soldier_LAT2_F", "I_Soldier_TL_F", "I_Soldier_repair_F", "I_soldier_F"], 2,

    ["I_Soldier_TL_F", "I_medic_F", "I_Soldier_AR_F", "I_Soldier_LAT_F", "I_engineer_F", "I_Soldier_M_F"],                                          2.5,
    ["I_Soldier_TL_F", "I_medic_F", "I_Soldier_exp_F", "I_Soldier_A_F", "I_Soldier_LAT2_F", "I_Soldier_repair_F"],                                  2.5,

    ["I_Soldier_TL_F", "I_medic_F", "I_Soldier_AR_F", "I_Soldier_LAT_F", "I_Soldier_M_F"],                                                          2.25,
    ["I_Soldier_TL_F", "I_medic_F", "I_Soldier_exp_F", "I_Soldier_LAT2_F", "I_soldier_F"],                                                          2.25
];

_sfSquads = _infSquads;
_vpSquads = _sfSquads;

// Teams
_infTeams = [
    ["I_Soldier_TL_F", "I_medic_F", "I_Soldier_AR_F", "I_Soldier_M_F"],         1,
    ["I_Soldier_TL_F", "I_medic_F", "I_Soldier_exp_F", "I_engineer_F"],         1,
    ["I_Soldier_TL_F", "I_medic_F", "I_Soldier_LAT_F", "I_Soldier_repair_F"],   1,
    ["I_Soldier_TL_F", "I_medic_F", "I_Soldier_LAT2_F", "I_Soldier_A_F"],       1
];

_sfTeams = _infTeams;
_vpTeams = [];

_atTeams = [
    ["I_Soldier_TL_F", "I_Soldier_AT_F", "I_Soldier_AT_F", "I_Soldier_AAT_F"],      1,
    ["I_Soldier_TL_F", "I_Soldier_LAT2_F", "I_Soldier_LAT2_F", "I_Soldier_A_F"],    1
];

_aaTeams = [
    ["I_Soldier_TL_F", "I_Soldier_AA_F", "I_Soldier_AA_F", "I_Soldier_AAA_F"], 1
];

_srTeams = [
    ["I_Sniper_F", "I_Spotter_F"], 1
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#specop_squads", _sfSquads]];
_infantryMappings insert [["#viper_squads", _vpSquads]];
_infantryMappings insert [["#teams", _infTeams]];
_infantryMappings insert [["#specop_teams", _sfTeams]];
_infantryMappings insert [["#viper_teams", _vpTeams]];
_infantryMappings insert [["#at_teams", _atTeams]];
_infantryMappings insert [["#aa_teams", _aaTeams]];
_infantryMappings insert [["#sniper_teams", _srTeams]];


//// Vehicles ////

// MRAPs
_vehMRAPs = [
    "I_MRAP_03_hmg_F",          1,
    "I_MRAP_03_gmg_F",          1,
    "O_G_Offroad_01_armed_F",   1
];

// IFVs
_vehIFVs = [
    "I_APC_tracked_03_cannon_F",    1.5,
    "I_APC_Wheeled_03_cannon_F",    1.5,
    "I_LT_01_AT_F",                 1.25,
    "I_LT_01_cannon_F",             1,
    "O_APC_Wheeled_02_rcws_v2_F",   0.75,
    "O_APC_Tracked_02_cannon_F",    0.75
];

// AAs
_vehSPAAs = [
    "I_LT_01_AA_F",             2,
    "O_APC_Tracked_02_AA_F",    1
];

// MBTs
_vehMBTs = [
    "I_MBT_03_cannon_F",    1.25,
    "O_MBT_02_cannon_F",    0.75,
    "O_MBT_04_cannon_F",    0.75,
    "O_MBT_04_command_F",   0.5
];

// Helis
_vehHelis = [
    "I_Heli_light_03_dynamicLoadout_F", 0.75,
    "I_Heli_Transport_02_F",            1,
    "I_Heli_light_03_unarmed_F",        1
];

// Heli CAS
_vehHeliCAS = [
    "I_Heli_light_03_dynamicLoadout_F", 1
];

// Jets
_vehJets = [
    "I_Plane_Fighter_03_dynamicLoadout_F",  2,
    "I_Plane_Fighter_04_F",                 1.5
];

_vehicleMappings insert [["#mraps", _vehMRAPs]];
_vehicleMappings insert [["#ifvs", _vehIFVs]];
_vehicleMappings insert [["#spaas", _vehSPAAs]];
_vehicleMappings insert [["#mbts", _vehMBTs]];
_vehicleMappings insert [["#helis", _vehHelis]];
_vehicleMappings insert [["#cas_helis", _vehHeliCAS]];
_vehicleMappings insert [["#jets", _vehJets]];

_factionMapping insert [
    ["#infantry", _infantryMappings],
    ["#vehicles", _vehicleMappings]
];

InA_FactionMappings insert [["AAF", _factionMapping]];
//////////////
//// ChDKZ ////
//////////////
_factionMapping = createHashMap;
_infantryMappings = createHashMap;
_vehicleMappings = createHashMap;

_factionMapping insert [
    ["#name", "CHDKZ"],
    ["#side", east]
];


//// Infantry ////

// Units
_infantryMappings insert [

    ["#officers", ["rhsgref_ins_commander"]],
    ["#squadleaders", ["rhsgref_ins_squadleader"]],
    ["#teamleaders", ["rhsgref_ins_squadleader"]],
    ["#riflemen", ["rhsgref_ins_rifleman_aks74", "rhsgref_ins_rifleman_akm", "rhsgref_ins_rifleman_aksu", "rhsgref_ins_grenadier", "rhsgref_ins_rifleman_RPG26"]],
    ["#lats", ["rhsgref_ins_rifleman_RPG26"]],
    ["#grenadiers", ["rhsgref_ins_grenadier"]],
    ["#machinegunners", ["rhsgref_ins_arifleman_rpk"]],
    ["#heavygunners", ["rhsgref_ins_machinegunner"]],
    ["#marksmen", ["rhsgref_ins_militiaman_mosin"]],
    ["#sharpshooters", ["rhsgref_ins_militiaman_mosin"]],
    ["#snipers", ["rhsgref_ins_sniper"]],
    ["#spotters", ["rhsgref_ins_spotter"]],
    ["#ats", ["rhsgref_ins_grenadier_rpg"]],
    ["#aas", ["rhsgref_ins_specialist_aa"]],
    ["#medics", ["rhsgref_ins_medic"]],
    ["#demos", ["rhsgref_ins_saboteur"]],
    ["#engineers", ["rhsgref_ins_engineer"]],
    ["#crews", ["rhsgref_ins_crew"]],
    ["#heli_pilots", ["rhsgref_ins_pilot"]],
    ["#heli_crews", ["rhsgref_ins_crew"]],
    ["#pilots", ["rhsgref_ins_pilot"]],
    ["#repair", ["rhsgref_ins_engineer"]],
    ["#ammos", ["O_Soldier_A_F", "O_T_Soldier_A_F", "O_soldierU_A_F"]],
    ["#aats", ["O_Soldier_AAT_F", "O_T_Soldier_AAT_F", "O_soldierU_AAT_F"]],
    ["#aaas", ["O_Soldier_AAA_F", "O_T_Soldier_AAA_F", "O_soldierU_AAA_F"]],
    ["#ahats", ["O_Soldier_AHAT_F", "O_T_Soldier_AHAT_F"]]
  
];

// Squads
_infSquads = [
    ["rhsgref_ins_squadleader", "rhsgref_ins_machinegunner", "rhsgref_ins_grenadier", "rhsgref_ins_grenadier_rpg", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_machinegunner", "rhsgref_ins_rifleman", "rhsgref_ins_rifleman_aks74"],      2,

    ["rhsgref_ins_rifleman", "rhsgref_ins_machinegunner", "rhsgref_ins_grenadier", "rhsgref_ins_rifleman_RPG26"],                                                          2.25
];
_sfSquads = _infSquads;
_vpSquads = _sfSquads;

_atTeams = [
    ["rhsgref_ins_rifleman_aks74", "rhsgref_ins_grenadier_rpg", "rhsgref_ins_grenadier_rpg", "rhsgref_ins_machinegunner"],      1,
    ["rhsgref_ins_rifleman_aksu", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_grenadier"],    1
];

_aaTeams = [
    ["rhsgref_ins_rifleman_aksu", "rhsgref_ins_specialist_aa", "rhsgref_ins_specialist_aa", "rhsgref_ins_rifleman_aks74"], 1
];

_srTeams = [
    ["rhsgref_ins_sniper", "rhsgref_ins_spotter"], 1
];


_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#specop_squads", _sfSquads]];
_infantryMappings insert [["#viper_squads", _vpSquads]];
_infantryMappings insert [["#at_teams", _atTeams]];
_infantryMappings insert [["#aa_teams", _aaTeams]];
_infantryMappings insert [["#sniper_teams", _srTeams]];


//// Vehicles ////
//Cars
_vecCars = [
    "rhsgref_ins_uaz_ags",          0.75,
    "rhsgref_ins_uaz_dshkm",        0.75,
    "rhsgref_ins_uaz_spg9",         0.75 
];



// MRAPs
_vehMRAPs = [
    "rhsgref_BRDM2_ins",          1,
    "rhsgref_BRDM2_ATGM_ins",     1,
    "rhsgref_BRDM2UM_ins",        1,
	"rhsgref_BRDM2_HQ_ins",       1 
];

// IFVs
_vehIFVs = [
    "rhsgref_ins_btr60",   1.5,
    "rhsgref_ins_btr70",   1.5,
    "rhsgref_ins_bmd2",    1.5,
    "rhsgref_ins_bmp1d",   1.5,
    "rhsgref_ins_bmp1k",   1.25,
    "rhsgref_ins_bmp2k",   1,
    "rhsgref_ins_bmd1p",   0.75,
    "rhsgref_ins_bmd1",    0.75
];

// AAs
_vehSPAAs = [
    "rhsgref_ins_zsu234",             2

];

// MBTs
_vehMBTs = [
    "rhsgref_ins_t72bb",    2,
    "rhsgref_ins_t72bc",    2,
    "rhsgref_ins_t72ba",    2

];

// Helis
_vehHelis = [
    "rhsgref_ins_Mi8amt",            1

];




_vehicleMappings insert [["#cars", _vecCars]];
_vehicleMappings insert [["#mraps", _vehMRAPs]];
_vehicleMappings insert [["#ifvs", _vehIFVs]];
_vehicleMappings insert [["#spaas", _vehSPAAs]];
_vehicleMappings insert [["#mbts", _vehMBTs]];
_vehicleMappings insert [["#helis", _vehHelis]];


_factionMapping insert [
    ["#infantry", _infantryMappings],
    ["#vehicles", _vehicleMappings]
];

InA_FactionMappings insert [["CHDKZ", _factionMapping]];

/////////////////
//// Russia ////
////////////////
_factionMapping = createHashMap;
_infantryMappings = createHashMap;
_vehicleMappings = createHashMap;

_factionMapping insert [
    ["#name", "Russia"],
    ["#side", east],
	["#aux_factions", ["CSAT","CHDKZ", "FIA", "SYND"]],
    ["#aux_faction_weights", [1, 1, 1.5, 1.5]],
    ["#indep_factions", ["CSAT"]],
    ["#guer_factions", ["TLA"]]
];

_infantryMappings insert [
    ["#officers", ["rhs_msv_emr_officer", "rhs_msv_emr_officer_armored"]],
    ["#squadleaders", ["rhs_msv_emr_sergeant"]],
    ["#teamleaders", ["rhs_msv_emr_junior_sergeant"]],
    ["#riflemen", ["rhs_msv_emr_RShG2", "rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT"]],
    ["#lats", ["rhs_msv_emr_LAT"]],
    ["#grenadiers", ["rhs_msv_emr_grenadier"]],
    ["#machinegunners", ["rhs_msv_emr_arifleman_rpk"]],
    ["#heavygunners", ["rhs_msv_emr_arifleman", "rhs_msv_emr_machinegunner"]],
    ["#marksmen", ["rhs_msv_emr_marksman"]],
    ["#sharpshooters", ["rhs_msv_emr_marksman"]],
    ["#snipers", ["rhs_msv_emr_marksman"]],
    ["#spotters", ["rhs_msv_emr_rifleman"]],
    ["#ats", ["rhs_msv_emr_at"]],
    ["#aas", ["rhs_msv_emr_aa"]],
    ["#medics", ["rhs_msv_emr_medic"]],
    ["#engineers", ["rhs_msv_emr_engineer"]],
    ["#crews", ["rhs_msv_emr_combatcrew"]],
    ["#heli_pilots", ["rhs_pilot", "rhs_pilot_tan", "rhs_pilot_combat_heli", "rhs_pilot_transport_heli"]],
    ["#pilots", ["rhs_pilot"]],
    ["#repair", ["rhs_msv_emr_engineer"]],

    ["#civs", ["C_man_1","C_man_polo_1_F_euro","C_man_polo_2_F_euro","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_6_F","C_man_shorts_4_F_asia"]]
];

// Squads
_infSquads = [
    ["rhs_msv_emr_sergeant", "rhs_msv_emr_efreitor", "rhs_msv_emr_grenadier_rpg", "rhs_msv_emr_strelok_rpg_assist", "rhs_msv_emr_machinegunner", "rhs_msv_emr_LAT", "rhs_msv_emr_rifleman", "rhs_msv_emr_medic"],   1
];
_sfSquads = _infSquads;
_vpSquads = _sfSquads;
// Teams
_infTeams = [
    ["rhs_vdv_sergeant", "rhs_msv_emr_medic", "rhs_msv_emr_arifleman_rpk", "rhs_msv_emr_LAT"],                          2,
    ["rhs_vdv_sergeant", "rhs_msv_emr_medic", "rhs_vdv_machinegunner_assistant", "rhs_vdv_arifleman"],                  2,
    ["rhs_vdv_sergeant", "rhs_msv_emr_medic", "rhs_msv_emr_arifleman", "rhs_msv_emr_marksman"],                         1.75

];
_sfTeams = _infTeams;
_vpTeams = _sfTeams;
//AT Team
_atTeams = [
    ["rhs_msv_emr_junior_sergeant", "rhs_msv_emr_LAT", "rhs_msv_emr_at", "rhs_msv_emr_rifleman","rhs_msv_emr_strelok_rpg_assist"],              1.5

];
//AA Team
_aaTeams = [
    ["rhs_msv_emr_junior_sergeant", "rhs_msv_emr_aa", "rhs_msv_emr_aa","rhs_msv_emr_aa","rhs_msv_emr_rifleman"],          1.5
];

_srTeams = [
    ["rhs_msv_emr_marksman", "rhs_msv_emr_rifleman"], 1
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#specop_squads", _sfSquads]];
_infantryMappings insert [["#viper_squads", _vpSquads]];
_infantryMappings insert [["#teams", _infTeams]];
_infantryMappings insert [["#specop_teams", _sfTeams]];
_infantryMappings insert [["#viper_teams", _vpTeams]];
_infantryMappings insert [["#at_teams", _atTeams]];
_infantryMappings insert [["#aa_teams", _aaTeams]];
_infantryMappings insert [["#sniper_teams", _srTeams]];


//// Vehicles ////
//Cars
_vecCars = [
    "rhs_tigr_sts_msv",          0.75,
    "rhs_tigr_sts_3camo_msv",        0.75

];



// MRAPs
_vehMRAPs = [
    "rhsgref_BRDM2_ins",          1,
    "rhsgref_BRDM2_ATGM_ins",     1,
    "rhsgref_BRDM2UM_ins",        1,
	"rhsgref_BRDM2_HQ_ins",       1 
];

// IFVs
_vehIFVs = [
    "rhsgref_ins_btr60",   1.5,
    "rhsgref_ins_btr70",   1.5,
    "rhsgref_ins_bmd2",    1.5,
    "rhsgref_ins_bmp1d",   1.5,
    "rhsgref_ins_bmp1k",   1.25,
    "rhsgref_ins_bmp2k",   1,
    "rhsgref_ins_bmd1p",   0.75,
    "rhsgref_ins_bmd1",    0.75
];

// AAs
_vehSPAAs = [
    "rhsgref_ins_zsu234",             2,
    "rhs_zsu234_aa",                  2
];

// MBTs
_vehMBTs = [
    "rhsgref_ins_t72bb",    2,
    "rhsgref_ins_t72bc",    2,
	"rhs_t14_tv",           2,
    "rhs_t80",              2

];

// Helis
_vehHelis = [
    "rhsgref_ins_Mi8amt",            1,
    "RHS_Mi8mt_vv",                  1
];


// Heli CAS
_vehHeliCAS = [
    "RHS_Ka52_vvsc",                        2,
    "RHS_Mi24P_vdv",                        2,
    "RHS_Mi8MTV3_heavy_vdv",                3,
    "RHS_Mi8MTV3_vdv",                      3
];

// Jets
_vehJets = [
    "RHS_Su25SM_vvs",        3,
    "RHS_Su25SM_vvsc",       3,
    "rhs_mig29s_vmf",        1,
	"RHS_T50_vvs_generic",   1,
	"RHS_T50_vvs_054",       1
];


_vehicleMappings insert [["#cars", _vecCars]];
_vehicleMappings insert [["#mraps", _vehMRAPs]];
_vehicleMappings insert [["#ifvs", _vehIFVs]];
_vehicleMappings insert [["#spaas", _vehSPAAs]];
_vehicleMappings insert [["#mbts", _vehMBTs]];
_vehicleMappings insert [["#helis", _vehHelis]];
_vehicleMappings insert [["#cas_helis", _vehHeliCAS]];
_vehicleMappings insert [["#jets", _vehJets]];

_factionMapping insert [
    ["#infantry", _infantryMappings],
    ["#vehicles", _vehicleMappings]
];

InA_FactionMappings insert [["Russia", _factionMapping]];

///////////////
//// SAF /////
//////////////

_factionMapping = createHashMap;
_infantryMappings = createHashMap;
_vehicleMappings = createHashMap;

_factionMapping insert [
    ["#name", "SAF"],
    ["#side", east]

];

//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["rhssaf_army_o_m10_para_officer"]],
    ["#squadleaders", ["rhssaf_army_o_m10_para_sq_lead"]],
    ["#teamleaders", ["rhssaf_army_o_m10_para_ft_lead"]],
    ["#riflemen", ["rhssaf_army_o_m10_para_rifleman_at","rhssaf_army_o_m10_para_rifleman_hk416","rhssaf_army_o_m10_para_rifleman_g36t","rhssaf_army_o_m10_para_rifleman_m21","rhssaf_army_o_m10_para_rifleman_ammo"]],
    ["#lats", ["rhssaf_army_o_m10_para_rifleman_at"]],
    ["#grenadiers", ["rhssaf_army_o_m10_para_gl_m320","rhssaf_army_o_m10_para_gl_ag36"]],
    ["#machinegunners", ["rhssaf_army_o_m10_para_mgun_minimi"]],
    ["#heavygunners", ["rhssaf_army_o_m10_para_mgun_m84"]],
    ["#marksmen", ["rhssaf_army_o_m10_para_sniper_m76"]],
    ["#snipers", ["rhssaf_army_o_m10_para_sniper_m82a1"]],
    ["#spotters", ["rhssaf_army_o_m10_para_spotter"]],
    ["#ats", ["rhssaf_army_o_m10_para_spec_at"]],
    ["#aas", ["rhssaf_army_o_m10_para_spec_aa"]],
    ["#medics", ["rhssaf_army_o_m10_para_medic"]],
    ["#demos", ["rhssaf_army_o_m10_para_exp"]],
    ["#engineers", ["rhssaf_army_o_m10_para_engineer"]],
    ["#repair", ["rhssaf_army_o_m10_para_repair"]]
    
];

// Squads
_infSquads = [
    ["rhssaf_army_o_m10_digital_sq_lead", "rhssaf_army_o_m10_digital_ft_lead", "rhssaf_army_o_m10_digital_sniper_m76", "rhssaf_army_o_m10_digital_gl", "rhssaf_army_o_m10_digital_rifleman_at", "rhssaf_army_o_m10_digital_asst_mgun", "rhssaf_army_o_m10_digital_gl", "rhssaf_army_o_m10_digital_mgun_m84"],   1,
    ["rhssaf_army_o_m10_digital_sq_lead", "rhssaf_army_o_m10_digital_mgun_m84", "rhssaf_army_o_m10_digital_asst_mgun", "rhssaf_army_o_m10_digital_gl", "rhssaf_army_o_m10_digital_mgun_m84", "rhssaf_army_o_m10_digital_mgun_m84", "rhssaf_army_o_m10_digital_gl", "rhssaf_army_o_m10_digital_rifleman_at"],    1,
    ["rhssaf_army_o_m10_digital_sq_lead", "rhssaf_army_o_m10_digital_ft_lead", "rhssaf_army_o_m10_digital_rifleman_m21", "rhssaf_army_o_m10_digital_mgun_m84", "rhssaf_army_o_m10_digital_gl", "rhssaf_army_o_m10_digital_mgun_m84", "rhssaf_army_o_m10_digital_gl", "rhssaf_army_o_m10_digital_rifleman_at"],  1

];

_sfSquads = _infSquads;
_vpSquads = _sfSquads;

// Teams
_infTeams = [
    ["rhssaf_army_o_m10_digital_officer", "rhssaf_army_o_m10_digital_officer", "rhssaf_army_o_m10_digital_sq_lead", "rhssaf_army_o_m10_digital_rifleman_m21"], 1,
    ["rhssaf_army_o_m10_digital_officer", "rhssaf_army_o_m10_digital_sq_lead", "rhssaf_army_o_m10_digital_medic", "rhssaf_army_o_m10_digital_sq_lead"], 1
];

_sfTeams = _infTeams;
_vpTeams = _sfTeams;

_atTeams = [
    ["rhssaf_army_o_m10_digital_ft_lead", "rhssaf_army_o_m10_digital_mgun_m84", "rhssaf_army_o_m10_digital_spec_at", "rhssaf_army_o_m10_digital_spec_at"], 1

];

_aaTeams = [
    ["rhssaf_army_o_m10_digital_ft_lead", "rhssaf_army_o_m10_digital_mgun_m84", "rhssaf_army_m10_digital_spec_aa", "rhssaf_army_m10_digital_spec_aa"], 1
];

_srTeams = [
    ["rhssaf_army_o_m10_para_sniper_m82a1", "rhssaf_army_o_m10_para_spotter"], 1
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#specop_squads", _sfSquads]];
_infantryMappings insert [["#viper_squads", _vpSquads]];
_infantryMappings insert [["#teams", _infTeams]];
_infantryMappings insert [["#specop_teams", _sfTeams]];
_infantryMappings insert [["#viper_teams", _vpTeams]];
_infantryMappings insert [["#at_teams", _atTeams]];
_infantryMappings insert [["#aa_teams", _aaTeams]];
_infantryMappings insert [["#sniper_teams", _srTeams]];

//// Vehicles ////

//Cars
_vecCars = [
    "rhssaf_army_o_m1025_olive_m2",          0.75,
    "rhssaf_army_o_m1151_olive_pkm",         0.75

];

// MBTs
_vehMBTs = [
    "rhssaf_army_o_t72s", 1
];

// Helis
_vehHelis = [
    "rhssaf_airforce_o_ht48", 0.3,
    "rhssaf_airforce_o_ht40", 0.3
];



// Jets
_vehJets = [
    "rhssaf_airforce_o_l_18",      1,
    "rhssaf_airforce_o_l_18_101",  1

];


_vehicleMappings insert [["#cars", _vecCars]];
_vehicleMappings insert [["#mbts", _vehMBTs]];
_vehicleMappings insert [["#helis", _vehHelis]];
_vehicleMappings insert [["#jets", _vehJets]];

_factionMapping insert [
    ["#infantry", _infantryMappings],
    ["#vehicles", _vehicleMappings]
];
InA_FactionMappings insert [["SAF", _factionMapping]];

///////////////
//// TLA /////
//////////////

_factionMapping = createHashMap;
_infantryMappings = createHashMap;
_vehicleMappings = createHashMap;

_factionMapping insert [
    ["#name", "TLA"],
    ["#side", east]

];

//// Infantry ////

// Units
_infantryMappings insert [
    ["#squadleaders", ["rhsgref_tla_squadleader"]],
    ["#teamleaders", ["rhsgref_tla_warlord"]],
    ["#riflemen", ["rhsgref_tla_rifleman","rhsgref_tla_rifleman_akms","rhsgref_tla_rifleman_l1a1","rhsgref_tla_rifleman_m1","rhsgref_tla_rifleman_m14","rhsgref_tla_rifleman_M16","rhsgref_tla_rifleman_pm63","rhsgref_tla_rifleman_rpg75","rhsgref_tla_rifleman_vz58"]],
    ["#lats", ["rhsgref_tla_rifleman_rpg75"]],
    ["#grenadiers", ["rhsgref_tla_grenadier","rhsgref_tla_grenadier_m79"]],
    ["#machinegunners", ["rhsgref_tla_machinegunner_mg42"]],
    ["#heavygunners", ["rhsgref_tla_machinegunner"]],
    ["#marksmen", ["rhsgref_tla_marksman_m14"]],
    ["#ats", ["rhsgref_tla_specialist_at"]],
    ["#medics", ["rhsgref_tla_medic"]],
    ["#demos", ["rhsgref_tla_saboteur"]],
    ["#engineers", ["rhsgref_tla_mechanic"]]

    
];

// Squads
_infSquads = [
    ["rhsgref_tla_squadleader", "rhsgref_tla_rifleman_pm63", "rhsgref_tla_rifleman", "rhsgref_tla_machinegunner", "rhsgref_tla_grenadier", "rhsgref_tla_rifleman_vz58", "rhsgref_tla_machinegunner_mg42w", "rhsgref_tla_grenadier_m79", "rhsgref_tla_specialist_at", "rhsgref_tla_rifleman_M16", "rhsgref_tla_medic"],   1


];

_sfSquads = _infSquads;
_vpSquads = _sfSquads;

// Teams
_infTeams = [
    ["rhsgref_tla_squadleader", "rhsgref_tla_rifleman_l1a1", "rhsgref_tla_rifleman_m1", "rhsgref_tla_rifleman_m14"], 1

];

_sfTeams = _infTeams;
_vpTeams = _sfTeams;

_atTeams = [
    ["rhsgref_tla_squadleader", "rhsgref_tla_specialist_at", "rhsgref_tla_specialist_at", "rhsgref_tla_machinegunner_mg42"], 1
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#specop_squads", _sfSquads]];
_infantryMappings insert [["#viper_squads", _vpSquads]];
_infantryMappings insert [["#teams", _infTeams]];
_infantryMappings insert [["#specop_teams", _sfTeams]];
_infantryMappings insert [["#viper_teams", _vpTeams]];
_infantryMappings insert [["#at_teams", _atTeams]];

//// Vehicles ////

//Cars
_vecCars = [
    "rhsgref_tla_offroad_armed",      0.75,
    "rhsgref_tla_offroad_at",         0.75

];

_vehicleMappings insert [["#cars", _vecCars]];


_factionMapping insert [
    ["#infantry", _infantryMappings],
    ["#vehicles", _vehicleMappings]
];
InA_FactionMappings insert [["TLA", _factionMapping]];

//////////////
//// PAVN ////
//////////////

_factionMapping = createHashMap;
_infantryMappings = createHashMap;
_vehicleMappings = createHashMap;

_factionMapping insert [
    ["#name", "PAVN"],
    ["#side", east],
    ["#aux_factions", ["VC_M", "VC_L"]],
    ["#aux_faction_weights", [1.25, 1.5]],
    ["#indep_factions", ["VC_M"]],
    ["#guer_factions", ["VC_L"]]
];


//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["vn_o_men_nva_01"]],
    ["#squadleaders", ["vn_o_men_nva_01"]],
    ["#teamleaders", ["vn_o_men_nva_01"]],
    ["#riflemen", ["vn_o_men_nva_05"]],
    ["#lats", ["vn_o_men_nva_14"]],
    ["#grenadiers", ["vn_o_men_nva_07"]],
    ["#machinegunners", ["vn_o_men_nva_11"]],
    ["#heavygunners", ["vn_o_men_nva_11"]],
    ["#marksmen", ["vn_o_men_nva_10"]],
    ["#sharpshooters", ["vn_o_men_nva_10"]],
    ["#snipers", ["vn_o_men_nva_10"]],
    ["#spotters", ["vn_o_men_nva_12"]],
    ["#ats", ["vn_o_men_nva_14"]],
    ["#hats", ["vn_o_men_nva_14"]],
    ["#aas", ["vn_o_men_nva_43"]],
    ["#medics", ["vn_o_men_nva_08"]],
    ["#demos", ["vn_o_men_nva_05"]],
    ["#engineers", ["vn_o_men_nva_09"]],
    ["#paras", ["vn_o_men_nva_05"]],

    ["#civs", ["vn_c_men_01","vn_c_men_02","vn_c_men_03","vn_c_men_04","vn_c_men_05","vn_c_men_06","vn_c_men_07","vn_c_men_08","vn_c_men_09","vn_c_men_10"]]
];

// Squads
_infSquads = [
    ["vn_o_men_nva_01", "vn_o_men_nva_08", "vn_o_men_nva_11", "vn_o_men_nva_07", "vn_o_men_nva_14", "vn_o_men_nva_01", "vn_o_men_nva_09", "vn_o_men_nva_10"],   1,
    ["vn_o_men_nva_01", "vn_o_men_nva_09", "vn_o_men_nva_10", "vn_o_men_nva_14", "vn_o_men_nva_01", "vn_o_men_nva_05", "vn_o_men_nva_08", "vn_o_men_nva_11"],   0.9,

    ["vn_o_men_nva_01", "vn_o_men_nva_08", "vn_o_men_nva_11", "vn_o_men_nva_07", "vn_o_men_nva_14", "vn_o_men_nva_10"],                                         1.2,
    ["vn_o_men_nva_01", "vn_o_men_nva_09", "vn_o_men_nva_14", "vn_o_men_nva_05", "vn_o_men_nva_08", "vn_o_men_nva_11"],                                         1.2
];

_sfSquads = _infSquads;
_vpSquads = _sfSquads;

// Teams
_infTeams = [
    ["vn_o_men_nva_01", "vn_o_men_nva_08", "vn_o_men_nva_11", "vn_o_men_nva_14"], 1,
    ["vn_o_men_nva_01", "vn_o_men_nva_08", "vn_o_men_nva_07", "vn_o_men_nva_10"], 1
];

_sfTeams = _infTeams;
_vpTeams = _sfTeams;

_atTeams = [
    ["vn_o_men_nva_01", "vn_o_men_nva_14", "vn_o_men_nva_14", "vn_o_men_nva_05"], 1,
    ["vn_o_men_nva_01", "vn_o_men_nva_14", "vn_o_men_nva_14", "vn_o_men_nva_07"], 0.5,
    ["vn_o_men_nva_01", "vn_o_men_nva_14", "vn_o_men_nva_14", "vn_o_men_nva_10"], 0.75
];

_aaTeams = [
    ["vn_o_men_nva_01", "vn_o_men_nva_43", "vn_o_men_nva_43", "vn_o_men_nva_05"], 1
];

_srTeams = [
    ["vn_o_men_nva_10", "vn_o_men_nva_12"], 1
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#specop_squads", _sfSquads]];
_infantryMappings insert [["#viper_squads", _vpSquads]];
_infantryMappings insert [["#teams", _infTeams]];
_infantryMappings insert [["#specop_teams", _sfTeams]];
_infantryMappings insert [["#viper_teams", _vpTeams]];
_infantryMappings insert [["#at_teams", _atTeams]];
_infantryMappings insert [["#aa_teams", _aaTeams]];
_infantryMappings insert [["#sniper_teams", _srTeams]];


//// Vehicles ////

// MRAPs
_vehMRAPs = [
    "vn_o_wheeled_z157_mg_01", 15
];

// IFVs
_vehIFVs = [
    "vn_o_wheeled_btr40_mg_01", 1,
    "vn_o_wheeled_btr40_mg_02", 1
];

// AAs
_vehSPAAs = [
    "vn_o_wheeled_z157_mg_02_nva65",    1,
    "vn_o_wheeled_btr40_mg_03_nva65",   0.75
];

// MBTs
_vehMBTs = [
    "vn_o_armor_type63_01", 1,
    "vn_o_armor_pt76b_01",  1,
    "vn_o_armor_pt76a_01",  1
];

// Helis
_vehHelis = [
    "vn_o_air_mi2_04_03", 0.3,
    "vn_o_air_mi2_04_02", 0.3,
    "vn_o_air_mi2_03_06", 0.3,
    "vn_o_air_mi2_05_01", 0.1,
    "vn_o_air_mi2_03_03", 0.3,
    "vn_o_air_mi2_01_01", 0.9,
    "vn_o_air_mi2_01_03", 0.9
];

// Heli CAS
_vehHeliCAS = [
    "vn_o_air_mi2_04_03", 1,
    "vn_o_air_mi2_04_02", 1,
    "vn_o_air_mi2_03_06", 1,
    "vn_o_air_mi2_05_01", 0.5,
    "vn_o_air_mi2_03_03", 1
];

// Jets
_vehJets = [
    "vn_o_air_mig19_mr",    1,
    "vn_o_air_mig19_hbmb",  1,
    "vn_o_air_mig19_gun",   2,
    "vn_o_air_mig19_cap",   3,
    "vn_o_air_mig19_cas",   1,
    "vn_o_air_mig19_bmb",   1
];

_vehicleMappings insert [["#mraps", _vehMRAPs]];
_vehicleMappings insert [["#ifvs", _vehIFVs]];
_vehicleMappings insert [["#spaas", _vehSPAAs]];
_vehicleMappings insert [["#mbts", _vehMBTs]];
_vehicleMappings insert [["#helis", _vehHelis]];
_vehicleMappings insert [["#cas_helis", _vehHeliCAS]];
_vehicleMappings insert [["#jets", _vehJets]];

_factionMapping insert [
    ["#infantry", _infantryMappings],
    ["#vehicles", _vehicleMappings]
];

InA_FactionMappings insert [["PAVN", _factionMapping]];


/////////////
//// FIA ////
/////////////

_factionMapping = createHashMap;
_infantryMappings = createHashMap;

_factionMapping insert [
    ["#name", "FIA"],
    ["#side", east]
];


//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["O_G_officer_F"]],
    ["#squadleaders", ["O_G_Soldier_SL_F"]],
    ["#teamleaders", ["O_G_Soldier_TL_F"]],
    ["#riflemen", ["O_G_Soldier_F"]],
    ["#lats", ["O_G_Soldier_LAT_F"]],
    ["#grenadiers", ["O_G_Soldier_GL_F"]],
    ["#machinegunners", ["O_G_Soldier_AR_F"]],
    ["#heavygunners", ["O_G_Soldier_AR_F"]],
    ["#marksmen", ["O_G_soldier_M_F"]],
    ["#sharpshooters", ["O_G_Sharpshooter_F"]],
    ["#snipers", ["O_G_Sharpshooter_F"]],
    ["#spotters", ["O_G_Soldier_lite_F"]],
    ["#ats", ["O_G_Soldier_LAT2_F"]],
    ["#hats", ["O_G_Soldier_LAT2_F"]],
    ["#aas", ["O_G_Soldier_LAT_F"]],
    ["#medics", ["O_G_medic_F"]],
    ["#demos", ["O_G_Soldier_exp_F"]],
    ["#engineers", ["O_G_engineer_F"]],
    ["#paras", ["O_G_Soldier_F"]]
];

// Squads
_infSquads = [
    ["O_G_Soldier_SL_F", "O_G_medic_F", "O_G_Soldier_AR_F", "O_G_Soldier_GL_F", "O_G_Soldier_LAT_F", "O_G_Soldier_TL_F", "O_G_engineer_F", "O_G_soldier_M_F"],  1,
    ["O_G_Soldier_SL_F", "O_G_medic_F", "O_G_Sharpshooter_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_TL_F", "O_G_Soldier_AR_F", "O_G_engineer_F"],  0.9,

    ["O_G_Soldier_TL_F", "O_G_medic_F", "O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_engineer_F", "O_G_soldier_M_F"],                                          1.2,
    ["O_G_Soldier_TL_F", "O_G_medic_F", "O_G_Sharpshooter_F", "O_G_Soldier_LAT_F", "O_G_Soldier_AR_F", "O_G_engineer_F"],                                       1.2,

    ["O_G_Soldier_TL_F", "O_G_medic_F", "O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_soldier_M_F"],                                                            1.3,
    ["O_G_Soldier_TL_F", "O_G_medic_F", "O_G_Sharpshooter_F", "O_G_Soldier_LAT_F", "O_G_engineer_F"],                                                           1.3
];

// Teams
_infTeams = [
    ["O_G_Soldier_SL_F", "O_G_medic_F", "O_G_Soldier_AR_F", "O_G_Soldier_GL_F"],    1,
    ["O_G_Soldier_SL_F", "O_G_medic_F", "O_G_Sharpshooter_F", "O_G_Soldier_LAT_F"], 0.9,
    ["O_G_Soldier_SL_F", "O_G_medic_F", "O_G_soldier_M_F", "O_G_engineer_F"],       1,
    ["O_G_Soldier_SL_F", "O_G_medic_F", "O_G_Soldier_exp_F", "O_G_Soldier_LAT_F"],  0.9,
    ["O_G_Soldier_SL_F", "O_G_medic_F", "O_G_Soldier_AR_F", "O_G_Soldier_LAT2_F"],  1,
    ["O_G_Soldier_SL_F", "O_G_medic_F", "O_G_Soldier_exp_F", "O_G_Soldier_GL_F"],   0.9
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#teams", _infTeams]];

_factionMapping insert [
    ["#infantry", _infantryMappings]
];

InA_FactionMappings insert [["FIA", _factionMapping]];


//////////////
//// SYND ////
//////////////

_factionMapping = createHashMap;
_infantryMappings = createHashMap;

_factionMapping insert [
    ["#name", "Syndikat"],
    ["#side", independent]
];


//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Para_2_F"]],
    ["#squadleaders", ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Para_2_F"]],
    ["#teamleaders", ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Para_2_F"]],
    ["#riflemen", ["I_C_Soldier_Para_1_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Para_7_F"]],
    ["#lats", ["I_C_Soldier_Bandit_2_F", "I_C_Soldier_Para_5_F"]],
    ["#grenadiers", ["I_C_Soldier_Bandit_6_F", "I_C_Soldier_Para_6_F"]],
    ["#machinegunners", ["I_C_Soldier_Bandit_3_F", "I_C_Soldier_Para_4_F"]],
    ["#heavygunners", ["I_C_Soldier_Bandit_3_F", "I_C_Soldier_Para_4_F"]],
    ["#marksmen", ["I_C_Soldier_Para_1_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Para_7_F"]],
    ["#sharpshooters", ["I_C_Soldier_Para_1_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Para_7_F"]],
    ["#snipers", ["I_C_Soldier_Para_1_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Para_7_F"]],
    ["#spotters", ["I_C_Soldier_Para_1_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Para_7_F"]],
    ["#ats", ["I_C_Soldier_Bandit_2_F", "I_C_Soldier_Para_5_F"]],
    ["#hats", ["I_C_Soldier_Bandit_2_F", "I_C_Soldier_Para_5_F"]],
    ["#aas", ["I_C_Soldier_Bandit_2_F", "I_C_Soldier_Para_5_F"]],
    ["#medics", ["I_C_Soldier_Bandit_1_F", "I_C_Soldier_Para_3_F"]],
    ["#demos", ["I_C_Soldier_Bandit_8_F", "I_C_Soldier_Para_8_F"]],
    ["#engineers", ["I_C_Soldier_Bandit_8_F", "I_C_Soldier_Para_8_F"]],
    ["#paras", ["I_C_Soldier_Para_1_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Para_7_F"]]
];

// Squads
_infSquads = [
    ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_6_F", "I_C_Soldier_Bandit_2_F", "I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_8_F", "I_C_Soldier_Para_1_F"], 1,
    ["I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Para_5_F", "I_C_Soldier_Para_7_F", "I_C_Soldier_Para_2_F", "I_C_Soldier_Para_4_F", "I_C_Soldier_Para_8_F"],             0.9,

    ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_2_F", "I_C_Soldier_Bandit_8_F", "I_C_Soldier_Para_1_F"],                                                     1.2,
    ["I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Para_5_F", "I_C_Soldier_Para_4_F", "I_C_Soldier_Para_8_F"],                                                             1.2,

    ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_2_F", "I_C_Soldier_Bandit_8_F", "I_C_Soldier_Para_1_F"],                                                                               1.3,
    ["I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Para_5_F", "I_C_Soldier_Para_4_F", "I_C_Soldier_Para_8_F"],                                                                                       1.3
];

// Teams
_infTeams = [
    ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Para_6_F"],     1,
    ["I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Bandit_2_F"],       0.9,
    ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_3_F"],   1,
    ["I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Para_8_F", "I_C_Soldier_Para_5_F"],           0.9,
    ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_2_F"],   1,
    ["I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Bandit_8_F", "I_C_Soldier_Para_6_F"],         0.9
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#teams", _infTeams]];

_factionMapping insert [
    ["#infantry", _infantryMappings]
];

InA_FactionMappings insert [["SYND", _factionMapping]];


//////////////
//// VC_M ////
//////////////

_factionMapping = createHashMap;
_infantryMappings = createHashMap;

_factionMapping insert [
    ["#name", "Viet Cong (Main)"],
    ["#side", east]
];


//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["vn_o_men_vc_01"]],
    ["#squadleaders", ["vn_o_men_vc_01"]],
    ["#teamleaders", ["vn_o_men_vc_01"]],
    ["#riflemen", ["vn_o_men_vc_06"]],
    ["#lats", ["vn_o_men_vc_14"]],
    ["#grenadiers", ["vn_o_men_vc_07"]],
    ["#machinegunners", ["vn_o_men_vc_11"]],
    ["#heavygunners", ["vn_o_men_vc_11"]],
    ["#marksmen", ["vn_o_men_vc_10"]],
    ["#sharpshooters", ["vn_o_men_vc_10"]],
    ["#snipers", ["vn_o_men_vc_10"]],
    ["#spotters", ["vn_o_men_vc_01"]],
    ["#ats", ["vn_o_men_vc_14"]],
    ["#hats", ["vn_o_men_vc_14"]],
    ["#aas", ["vn_o_men_vc_14"]],
    ["#medics", ["vn_o_men_vc_08"]],
    ["#demos", ["vn_o_men_vc_09"]],
    ["#engineers", ["vn_o_men_vc_09"]],
    ["#paras", ["vn_o_men_vc_06"]]
];

// Squads
_infSquads = [
    ["vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_11", "vn_o_men_vc_07", "vn_o_men_vc_14", "vn_o_men_vc_01", "vn_o_men_vc_09", "vn_o_men_vc_10"],   1,
    ["vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_09", "vn_o_men_vc_14", "vn_o_men_vc_01", "vn_o_men_vc_06", "vn_o_men_vc_11", "vn_o_men_vc_06"],   0.9,

    ["vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_11", "vn_o_men_vc_07", "vn_o_men_vc_14", "vn_o_men_vc_10"],                                       1.2,
    ["vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_09", "vn_o_men_vc_14", "vn_o_men_vc_06", "vn_o_men_vc_11"],                                       1.2
];

// Teams
_infTeams = [
    ["vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_11", "vn_o_men_vc_07"], 1,
    ["vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_09", "vn_o_men_vc_14"], 0.9,
    ["vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_10", "vn_o_men_vc_06"], 1,
    ["vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_07", "vn_o_men_vc_11"], 1
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#teams", _infTeams]];

_factionMapping insert [
    ["#infantry", _infantryMappings]
];

InA_FactionMappings insert [["VC_M", _factionMapping]];


//////////////
//// VC_L ////
//////////////

_factionMapping = createHashMap;
_infantryMappings = createHashMap;

_factionMapping insert [
    ["#name", "Viet Cong (Locals)"],
    ["#side", east]
];


//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["vn_o_men_vc_local_01"]],
    ["#squadleaders", ["vn_o_men_vc_local_01"]],
    ["#teamleaders", ["vn_o_men_vc_local_15"]],
    ["#riflemen", ["vn_o_men_vc_local_06"]],
    ["#lats", ["vn_o_men_vc_local_28"]],
    ["#grenadiers", ["vn_o_men_vc_local_21"]],
    ["#machinegunners", ["vn_o_men_vc_local_11"]],
    ["#heavygunners", ["vn_o_men_vc_local_11"]],
    ["#marksmen", ["vn_o_men_vc_local_10"]],
    ["#sharpshooters", ["vn_o_men_vc_local_10"]],
    ["#snipers", ["vn_o_men_vc_local_10"]],
    ["#spotters", ["vn_o_men_vc_local_15"]],
    ["#ats", ["vn_o_men_vc_local_28"]],
    ["#hats", ["vn_o_men_vc_local_28"]],
    ["#aas", ["vn_o_men_vc_local_28"]],
    ["#medics", ["vn_o_men_vc_local_08"]],
    ["#demos", ["vn_o_men_vc_local_09"]],
    ["#engineers", ["vn_o_men_vc_local_09"]],
    ["#paras", ["vn_o_men_vc_local_06"]]
];

// Squads
_infSquads = [
    ["vn_o_men_vc_local_01", "vn_o_men_vc_local_08", "vn_o_men_vc_local_11", "vn_o_men_vc_local_21", "vn_o_men_vc_local_28", "vn_o_men_vc_local_15", "vn_o_men_vc_local_09", "vn_o_men_vc_local_10"], 1,
    ["vn_o_men_vc_local_01", "vn_o_men_vc_local_08", "vn_o_men_vc_local_09", "vn_o_men_vc_local_28", "vn_o_men_vc_local_11", "vn_o_men_vc_local_15", "vn_o_men_vc_local_21", "vn_o_men_vc_local_11"], 0.9,

    ["vn_o_men_vc_local_01", "vn_o_men_vc_local_08", "vn_o_men_vc_local_11", "vn_o_men_vc_local_21", "vn_o_men_vc_local_09", "vn_o_men_vc_local_10"], 1.2,
    ["vn_o_men_vc_local_01", "vn_o_men_vc_local_08", "vn_o_men_vc_local_09", "vn_o_men_vc_local_28", "vn_o_men_vc_local_11", "vn_o_men_vc_local_11"], 1.2
];

// Teams
_infTeams = [
    ["vn_o_men_vc_local_15", "vn_o_men_vc_local_08", "vn_o_men_vc_local_21", "vn_o_men_vc_local_10"], 1,
    ["vn_o_men_vc_local_15", "vn_o_men_vc_local_08", "vn_o_men_vc_local_11", "vn_o_men_vc_local_28"], 0.9,
    ["vn_o_men_vc_local_15", "vn_o_men_vc_local_08", "vn_o_men_vc_local_06", "vn_o_men_vc_local_09"], 1
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#teams", _infTeams]];

_factionMapping insert [
    ["#infantry", _infantryMappings]
];

InA_FactionMappings insert [["VC_L", _factionMapping]];


InA_FactionMappingsDefined = true;
