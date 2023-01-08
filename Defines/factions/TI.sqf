/////////////////////////////
//// Takistan Insurgents ////
/////////////////////////////

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
    ["#name", "TI"],
    ["#side", east]
];

//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["UK3CB_TKM_O_WAR"]],
    ["#squadleaders", ["UK3CB_TKM_O_SL"]],
    ["#teamleaders", ["UK3CB_TKM_O_TL"]],
    ["#riflemen", ["UK3CB_TKM_O_RIF_1", "UK3CB_TKM_O_RIF_2"]],
	["#lats", ["UK3CB_TKM_O_LAT"]],
    ["#grenadiers", ["UK3CB_TKM_O_GL"]],
    ["#machinegunners", ["UK3CB_TKM_O_AR"]],
    ["#heavygunners", ["UK3CB_TKM_O_MG"]],
    ["#marksmen", ["UK3CB_TKM_O_MK"]],
    ["#snipers", ["UK3CB_TKM_O_SNI"]],
    ["#spotters", ["UK3CB_TKM_O_SPOT"]],
    ["#ats", ["UK3CB_TKM_O_AT"]],
    ["#aas", ["UK3CB_TKM_O_AA"]],
    ["#medics", ["UK3CB_TKM_O_MD"]],
    ["#demos", ["UK3CB_TKM_O_DEM"]],
    ["#engineers", ["UK3CB_TKM_O_ENG"]],
    ["#ammos", ["UK3CB_TKM_O_MG_ASST"]],
    ["#aats", ["UK3CB_TKM_O_AT_ASST"]],
    ["#aaas", ["UK3CB_TKM_O_AA_ASST"]]
];

// Squads
_infSquads = [
    ["UK3CB_TKM_O_SL" ,"UK3CB_TKM_O_TL" ,"UK3CB_TKM_O_MD" ,"UK3CB_TKM_O_MK" ,"UK3CB_TKM_O_MG" ,"UK3CB_TKM_O_MG_ASST" ,"UK3CB_TKM_O_ENG", "UK3CB_TKM_O_RIF_1"], 2,
    ["UK3CB_TKM_O_SL" ,"UK3CB_TKM_O_TL" ,"UK3CB_TKM_O_MD" ,"UK3CB_TKM_O_MK" ,"UK3CB_TKM_O_LAT" ,"UK3CB_TKM_O_RIF_1" ,"UK3CB_TKM_O_ENG", "UK3CB_TKM_O_DEM"],    1.75,
    ["UK3CB_TKM_O_SL" ,"UK3CB_TKM_O_TL" ,"UK3CB_TKM_O_MD" ,"UK3CB_TKM_O_AR" ,"UK3CB_TKM_O_RIF_1" ,"UK3CB_TKM_O_ENG" ,"UK3CB_TKM_O_RIF_2", "UK3CB_TKM_O_MK"],   1.50
];

_sfSquads = _infSquads;
_vpSquads = _sfSquads;

// Teams
_infTeams = [
   ["UK3CB_TKM_O_TL" ,"UK3CB_TKM_O_MK" ,"UK3CB_TKM_O_MK" ,"UK3CB_TKM_O_MK"],         1,
   ["UK3CB_TKM_O_TL" ,"UK3CB_TKM_O_MG" ,"UK3CB_TKM_O_MG_ASST" ,"UK3CB_TKM_O_RIF_1"], 2,
   ["UK3CB_TKM_O_TL" ,"UK3CB_TKM_O_RIF_2" ,"UK3CB_TKM_O_LAT" ,"UK3CB_TKM_O_RIF_1"],  2,
   ["UK3CB_TKM_O_TL" ,"UK3CB_TKM_O_AR" ,"UK3CB_TKM_O_AR" ,"UK3CB_TKM_O_RIF_2"],      2,
   ["UK3CB_TKM_O_TL" ,"UK3CB_TKM_O_GL" ,"UK3CB_TKM_O_GL" ,"UK3CB_TKM_O_MK"],         1.25
];

_sfTeams = _infTeams;
_vpTeams = _sfTeams;

_atTeams = [
    ["UK3CB_TKM_O_TL", "UK3CB_TKM_O_AT", "UK3CB_TKM_O_AT", "UK3CB_TKM_O_AT_ASST"], 1.5
];

_aaTeams = [
    ["UK3CB_TKM_O_TL", "UK3CB_TKM_O_AA", "UK3CB_TKM_O_AA", "UK3CB_TKM_O_AA_ASST"], 1.5
];

_srTeams = [
    ["UK3CB_TKM_O_SNI", "UK3CB_TKM_O_SPOT"], 0.75
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
    "UK3CB_TKM_O_BRDM2",             3,
    "UK3CB_TKM_O_BRDM2_ATGM",        3,
    "UK3CB_TKM_O_Hilux_GMG",         2.5,
	"UK3CB_TKM_O_Hilux_Dshkm",       2.5,
	"UK3CB_TKM_O_Hilux_Rocket",      2.5,
	"UK3CB_TKM_O_Hilux_Rocket_Arty", 2.5,
	"UK3CB_TKM_O_Pickup_DSHKM",      2.5,
	"UK3CB_TKM_O_UAZ_Dshkm",         2.5
];

// IFVs
_vehIFVs = [
    "UK3CB_TKM_O_BMP1",     1.75,
    "UK3CB_TKM_O_BTR40_MG", 2,
    "UK3CB_TKM_O_BTR60",    1.75
];

// AAs
_vehSPAAs = [
    "UK3CB_TKM_O_Ural_Zu23", 2,
    "UK3CB_TKM_O_V3S_Zu23",  1.75,
	"UK3CB_TKM_O_MTLB_ZU23", 1.50
];

// MBTs
_vehMBTs = [
    "UK3CB_TKM_O_T34", 1,
    "UK3CB_TKM_O_T55", 0.85
];

_vehicleMappings insert [["#mraps", _vehMRAPs]];
_vehicleMappings insert [["#ifvs", _vehIFVs]];
_vehicleMappings insert [["#spaas", _vehSPAAs]];
_vehicleMappings insert [["#mbts", _vehMBTs]];

_factionMapping insert [
    ["#infantry", _infantryMappings],
    ["#vehicles", _vehicleMappings]
];

InA_FactionMappings insert [["TI", _factionMapping]];