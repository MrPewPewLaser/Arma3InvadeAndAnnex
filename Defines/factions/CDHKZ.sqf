///////////////////
//// 3CB CHDKZ ////
///////////////////

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

_factionMapping insert [
    ["#name", "CHDKZ"],
    ["#side", east],
    ["#aux_factions", ["RUSSIA", "CCM", "TLA"]],
    ["#aux_faction_weights", [1, 1.5, 1.5]],
    ["#guer_factions", ["TLA", "CCM"]]
];

//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["UK3CB_CHD_O_OFF"]],
    ["#squadleaders", ["UK3CB_CHD_O_SL"]],
    ["#teamleaders", ["UK3CB_CHD_O_TL"]],
    ["#riflemen", ["UK3CB_CHD_O_RIF_1", "UK3CB_CHD_O_RIF_2"]],
    ["#grenadiers", ["UK3CB_CHD_O_GL", "UK3CB_CHD_O_SF_GL"]],
    ["#machinegunners", ["UK3CB_CHD_O_AR", "UK3CB_CHD_O_SF_AR"]],
    ["#heavygunners", ["UK3CB_CHD_O_MG", "UK3CB_CHD_O_SF_MG"]],
    ["#marksmen", ["UK3CB_CHD_O_MK", "UK3CB_CHD_O_SF_MK"]],
    ["#snipers", ["UK3CB_CHD_O_SNI", "UK3CB_CHD_O_SF_SNI"]],
    ["#spotters", ["UK3CB_CHD_O_SPOT", "UK3CB_CHD_O_SF_SPOT"]],
    ["#ats", ["UK3CB_CHD_O_AT", "UK3CB_CHD_O_SF_AT"]],
    ["#aas", ["UK3CB_CHD_O_AA", "UK3CB_CHD_O_SF_AA"]],
    ["#medics", ["UK3CB_CHD_O_MD", "UK3CB_CHD_O_SF_MD"]],
    ["#demos", ["UK3CB_CHD_O_DEM", "UK3CB_CHD_O_SF_DEM"]],
    ["#engineers", ["UK3CB_CHD_O_ENG", "UK3CB_CHD_O_SF_ENG"]],
    ["#crews", ["UK3CB_CHD_O_CREW"]],
    ["#heli_pilots", ["UK3CB_CHD_O_HELI_PILOT"]],
    ["#heli_crews", ["UK3CB_CHD_O_HELI_CREW"]],
    ["#pilots", ["UK3CB_CHD_O_JET_PILOT"]],
    ["#aats", ["UK3CB_CHD_O_AT_ASST", "UK3CB_CHD_O_SF_AT_ASST"]],
    ["#aaas", ["UK3CB_CHD_O_AA_ASST", "UK3CB_CHD_O_SF_AA_ASST"]],
    ["#paras", ["UK3CB_CHD_O_SL", "UK3CB_CHD_O_TL", "UK3CB_CHD_O_MD", "UK3CB_CHD_O_AR", "UK3CB_CHD_O_RIF_1", "UK3CB_CHD_O_ENG", "UK3CB_CHD_O_RIF_2", "UK3CB_CHD_O_MK"]],

    ["#civs", ["UK3CB_CHC_C_CIT","UK3CB_CHC_C_HIKER","UK3CB_CHC_C_VILL","UK3CB_CHC_C_ACT","UK3CB_CHC_C_SPY","UK3CB_CHC_C_WORKER","UK3CB_CHC_C_WOOD"]]
];

// Squads
_infSquads = [
    ["UK3CB_CHD_O_SL", "UK3CB_CHD_O_TL", "UK3CB_CHD_O_MD", "UK3CB_CHD_O_AT", "UK3CB_CHD_O_AT_ASST", "UK3CB_CHD_O_MK", "UK3CB_CHD_O_AR", "UK3CB_CHD_O_RIF_1"],  2,
    ["UK3CB_CHD_O_SL", "UK3CB_CHD_O_TL", "UK3CB_CHD_O_MD", "UK3CB_CHD_O_AR", "UK3CB_CHD_O_RIF_1", "UK3CB_CHD_O_ENG", "UK3CB_CHD_O_RIF_2", "UK3CB_CHD_O_MK"],   1.75,
    ["UK3CB_CHD_O_SL", "UK3CB_CHD_O_TL", "UK3CB_CHD_O_MD", "UK3CB_CHD_O_MK", "UK3CB_CHD_O_LAT", "UK3CB_CHD_O_RIF_1", "UK3CB_CHD_O_ENG", "UK3CB_CHD_O_DEM"],    2.5,
    ["UK3CB_CHD_O_SL", "UK3CB_CHD_O_TL", "UK3CB_CHD_O_MD", "UK3CB_CHD_O_MK", "UK3CB_CHD_O_MG", "UK3CB_CHD_O_MG_ASST", "UK3CB_CHD_O_ENG", "UK3CB_CHD_O_RIF_1"], 2.25
];

// SF Squads
_sfSquads = [
    ["UK3CB_CHD_O_SF_SL", "UK3CB_CHD_O_SF_MD", "UK3CB_CHD_O_SF_RIF_1", "UK3CB_CHD_O_SF_DEM", "UK3CB_CHD_O_SF_AR", "UK3CB_CHD_O_SF_LAT", "UK3CB_CHD_O_SF_TL", "UK3CB_CHD_O_SF_MK"], 1.25
];

_vpSquads = _sfSquads;

// Teams
_infTeams = [
    ["UK3CB_CHD_O_TL", "UK3CB_CHD_O_AR", "UK3CB_CHD_O_AR", "UK3CB_CHD_O_RIF_2"],      2,
    ["UK3CB_CHD_O_TL", "UK3CB_CHD_O_RIF_2", "UK3CB_CHD_O_LAT", "UK3CB_CHD_O_RIF_1"],  2,
    ["UK3CB_CHD_O_TL", "UK3CB_CHD_O_MG", "UK3CB_CHD_O_MG_ASST", "UK3CB_CHD_O_RIF_1"], 1.75,
    ["UK3CB_CHD_O_TL", "UK3CB_CHD_O_MK", "UK3CB_CHD_O_MK", "UK3CB_CHD_O_MK"],         2
];

//SF Teams
_sfTeams = [
    ["UK3CB_CHD_O_SF_SL", "UK3CB_CHD_O_SF_DEM", "UK3CB_CHD_O_SF_ENG", "UK3CB_CHD_O_SF_DEM"], 1.25,
    ["UK3CB_CHD_O_SF_TL", "UK3CB_CHD_O_SF_MD", "UK3CB_CHD_O_SF_MK", "UK3CB_CHD_O_SF_LAT"],   1.25
];

_vpTeams = _sfTeams;

_atTeams = [
    ["UK3CB_CHD_O_TL", "UK3CB_CHD_O_AT", "UK3CB_CHD_O_AT", "UK3CB_CHD_O_AT_ASST"], 1.5
];

_aaTeams = [
    ["UK3CB_CHD_O_TL", "UK3CB_CHD_O_AA", "UK3CB_CHD_O_AA", "UK3CB_CHD_O_AA_ASST"], 1.5
];

_srTeams = [
    ["UK3CB_CHD_O_SNI", "UK3CB_CHD_O_SPOT"],       0.75,
    ["UK3CB_CHD_O_SF_SNI", "UK3CB_CHD_O_SF_SPOT"], 0.75
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#specop_squads", _sfSquads]];
_infantryMappings insert [["#viper_squads", _vpSquads]];
_infantryMappings insert [["#teams", _infTeams]];
_infantryMappings insert [["#specop_teams", _sfTeams ]];
_infantryMappings insert [["#viper_teams", _vpTeams]];
_infantryMappings insert [["#at_teams", _atTeams]];
_infantryMappings insert [["#aa_teams", _aaTeams]];
_infantryMappings insert [["#sniper_teams", _srTeams]];

//// Vehicles ////

// MRAPs
_vehMRAPs = [
    "UK3CB_CHD_O_BRDM2_UM",   3,
    "UK3CB_CHD_O_BRDM2_HQ",   2.25,
    "UK3CB_CHD_O_BRDM2",      2.75,
    "UK3CB_CHD_O_BRDM2_ATGM", 2.5
];

// IFVs
_vehIFVs = [
    "UK3CB_CHD_O_BMP2K", 1.75,
    "UK3CB_CHD_O_BMP1",  2,
    "UK3CB_CHD_O_BMP2",  1.75
];

// AAs
_vehSPAAs = [
    "UK3CB_CHD_O_ZsuTank",    3,
    "UK3CB_CHD_O_Ural_Zu23",  2,
    "UK3CB_CHD_O_Gaz66_ZU23", 1.75,
    "UK3CB_CHD_O_MTLB_ZU23",  2.25
];

// MBTs
_vehMBTs = [
    "UK3CB_CHD_O_T34",   0.5,
    "UK3CB_CHD_O_T55",   0.85,
    "UK3CB_CHD_O_T72A",  1,
    "UK3CB_CHD_O_T72B",  1.25,
    "UK3CB_CHD_O_T72BM", 1.25,
    "UK3CB_CHD_O_T72BA", 1.5, 
    "UK3CB_CHD_O_T72BB", 1.75   
];

// Helis
_vehHelis = [
    "rhsgref_ins_Mi8amt", 0.5,
    "RHS_Mi8AMT_vdv",     0.75,
    "RHS_Mi8T_vdv",       0.75,
    "RHS_Mi8t_vv",        1
];

// Heli CAS
_vehHeliCAS = [
    "RHS_Ka52_vvs",      1,
    "RHS_Mi24P_vdv",     2,
    "RHS_Mi8MTV3_vdv",   1.75,
    "RHS_Ka52_vvsc",     1.5,
    "RHS_Mi8AMTSh_vvsc", 1.25,
    "RHS_Mi24P_vvs",     1
];

// Jets
_vehJets = [
    "rhs_ka60_grey",   2.75,
    "rhs_mig29s_vmf",  3,
    "rhs_mig29s_vvsc", 3,
    "RHS_Su25SM_vvsc", 2,
    "rhs_mig29s_vvs",  1,
    "RHS_Su25SM_vvs",  1
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

InA_FactionMappings insert [["CHDKZ", _factionMapping]];