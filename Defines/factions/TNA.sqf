////////////////////////////////
//// Takistan National Army ////
///////////////////////////////

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
    ["#name", "TNA"],
    ["#side", east],
    ["#aux_factions", ["RUSSIA", "CCM", "TI"]],
    ["#aux_faction_weights", [1, 1.5, 1.5]],
    ["#guer_factions", ["TI", "CCM"]]
];

//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["UK3CB_TKA_O_OFF"]],
    ["#squadleaders", ["UK3CB_TKA_O_SL"]],
    ["#teamleaders", ["UK3CB_TKA_O_TL"]],
    ["#riflemen", ["UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_RIF_2"]],
    ["#lats", ["UK3CB_TKA_O_LAT"]],
    ["#grenadiers", ["UK3CB_TKA_O_GL"]],
    ["#machinegunners", ["UK3CB_TKA_O_AR"]],
    ["#heavygunners", ["UK3CB_TKA_O_MG"]],
    ["#marksmen", ["UK3CB_TKA_O_MK"]],
    ["#snipers", ["UK3CB_TKA_O_SNI"]],
    ["#spotters", ["UK3CB_TKA_O_SPOT"]],
    ["#ats", ["UK3CB_TKA_O_AT"]],
    ["#aas", ["UK3CB_TKA_O_AA"]],
    ["#medics", ["UK3CB_TKA_O_MD"]],
    ["#demos", ["UK3CB_TKA_O_DEM"]],
    ["#engineers", ["UK3CB_TKA_O_ENG"]],
    ["#crews", ["UK3CB_TKA_O_CREW_COMM", "UK3CB_TKA_O_CREW"]],
    ["#heli_pilots", ["UK3CB_TKA_O_HELI_PILOT"]],
    ["#heli_crews", ["UK3CB_TKA_O_HELI_CREW"]],
    ["#pilots", ["UK3CB_TKA_O_JET_PILOT"]],
    ["#ammos", ["UK3CB_TKA_O_MG_ASST"]],
    ["#aats", ["UK3CB_TKA_O_AT_ASST"]],
    ["#aaas", ["UK3CB_TKA_O_AA_ASST"]],
    ["#paras", ["UK3CB_TKA_O_SL", "UK3CB_TKA_O_TL", "UK3CB_TKA_O_MD", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_MG", "UK3CB_TKA_O_MG_ASST", "UK3CB_TKA_O_ENG", "UK3CB_TKA_O_RIF_1"]],

    ["#civs", ["UK3CB_TKC_C_WORKER","UK3CB_TKC_C_SPOT","UK3CB_TKC_C_DOC","UK3CB_TKC_C_CIV"]]
];

// Squads
_infSquads = [
    ["UK3CB_TKA_O_SL", "UK3CB_TKA_O_TL", "UK3CB_TKA_O_MD", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_MG", "UK3CB_TKA_O_MG_ASST", "UK3CB_TKA_O_ENG", "UK3CB_TKA_O_RIF_1"], 2,
    ["UK3CB_TKA_O_SL", "UK3CB_TKA_O_TL", "UK3CB_TKA_O_MD", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_MK", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_ENG", "UK3CB_TKA_O_DEM"],     2,

    ["UK3CB_TKA_O_SL", "UK3CB_TKA_O_TL", "UK3CB_TKA_O_MD", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_LAT", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_ENG", "UK3CB_TKA_O_DEM"],    2.5,
    ["UK3CB_TKA_O_SL", "UK3CB_TKA_O_TL", "UK3CB_TKA_O_MD", "UK3CB_TKA_O_AR", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_ENG", "UK3CB_TKA_O_AR", "UK3CB_TKA_O_RIF_1"],      2.5 
];

_sfSquads = [
    ["UK3CB_TKA_O_SF_SL", "UK3CB_TKA_O_SF_MD", "UK3CB_TKA_O_SF_AR", "UK3CB_TKA_O_SF_RIF_1", "UK3CB_TKA_O_SF_DEM", "UK3CB_TKA_O_SF_LAT", "UK3CB_TKA_O_SF_TL", "UK3CB_TKA_O_SF_MK"] , 1.75
];

_vpSquads = _sfSquads;

// Teams
_infTeams = [
    ["UK3CB_TKA_O_TL", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_RIF_2"], 1,
    ["UK3CB_TKA_O_TL", "UK3CB_TKA_O_MG", "UK3CB_TKA_O_MG_ASST", "UK3CB_TKA_O_RIF_1"],  1.15,
    ["UK3CB_TKA_O_TL", "UK3CB_TKA_O_AR", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_RIF_2"],    1.25,
    ["UK3CB_TKA_O_TL", "UK3CB_TKA_O_GL", "UK3CB_TKA_O_GL", "UK3CB_TKA_O_RIF_1"],       1.50
];

_sfTeams = [
    ["UK3CB_TKA_O_SF_TL", "UK3CB_TKA_O_SF_MD", "UK3CB_TKA_O_SF_MK","UK3CB_TKA_O_SF_LAT"],  1.25,
    ["UK3CB_TKA_O_SF_TL", "UK3CB_TKA_O_SF_MD", "UK3CB_TKA_O_SF_ENG","UK3CB_TKA_O_SF_DEM"], 1.50
];

_vpTeams = _sfTeams;

_atTeams = [
    ["UK3CB_TKA_O_TL", "UK3CB_TKA_O_AT", "UK3CB_TKA_O_AT", "UK3CB_TKA_O_AT_ASST"], 1
];

_aaTeams = [
    ["UK3CB_TKA_O_TL", "UK3CB_TKA_O_AA", "UK3CB_TKA_O_AA", "UK3CB_TKA_O_AA_ASST"], 1
];

_srTeams = [
    ["UK3CB_TKA_O_SNI", "UK3CB_TKA_O_SPOT"], 1
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
    "UK3CB_NAP_O_BRDM2_HQ", 1,
    "UK3CB_NAP_O_BRDM2",    1,
    "UK3CB_TKA_O_BTR40_MG", 0.75
];

// IFVs
_vehIFVs = [
    "UK3CB_TKA_O_BTR60",  1.5,
    "UK3CB_TKA_O_BTR70",  1.5,
    "UK3CB_TKA_O_BTR80",  1.25,
    "UK3CB_TKA_O_BTR80a", 1,
    "UK3CB_TKA_O_BMP2K",  0.75,
    "UK3CB_TKA_O_BMP2",   0.75,
    "UK3CB_TKA_O_BMP1",   0.75
];

// AAs
_vehSPAAs = [
    "UK3CB_TKA_O_ZsuTank",   2,
    "UK3CB_TKA_O_MTLB_ZU23", 1.50,
    "UK3CB_TKA_O_Ural_Zu23", 1
];

// MBTs
_vehMBTs = [
    "UK3CB_TKA_O_T34",   1.25,
    "UK3CB_TKA_O_T55",   1,
    "UK3CB_TKA_O_T72A",  0.75,
    "UK3CB_TKA_O_T72B",  0.75,
    "UK3CB_TKA_O_T72BM", 0.75
];

// Helis
_vehHelis = [
    "UK3CB_TKA_O_Mi8",             0.75,
    "UK3CB_TKA_O_Bell412_Utility", 1,
    "UK3CB_TKA_O_UH1H",            1
];

// Heli CAS
_vehHeliCAS = [
    "UK3CB_TKA_O_Mi8AMTSh",                     2,
    "UK3CB_TKA_O_Mi_24P",                       1.75,
    "UK3CB_TKA_O_Bell412_Armed_dynamicLoadout", 1,
    "UK3CB_TKA_O_UH1H_GUNSHIP",                 1
];

// Jets
_vehJets = [
    "UK3CB_TKA_O_L39_AA",    2,
    "UK3CB_TKA_O_L39_CAS",   1.5,
    "UK3CB_TKA_O_MIG21_AA",  1.5,
    "UK3CB_TKA_O_MIG21_CAS", 1.5,
    "UK3CB_TKA_O_MIG29S",    1.5,
    "UK3CB_TKA_O_Su25SM",    1.5
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

InA_FactionMappings insert [["TNA", _factionMapping]];