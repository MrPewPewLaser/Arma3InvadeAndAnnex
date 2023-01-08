/////////////
//// CCM ////
/////////////

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

_factionMapping insert [
    ["#name", "CCM"],
    ["#side", east]
];

//// Infantry ////

// Units
_infantryMappings insert [
    ["#commanders", ["UK3CB_CCM_O_COM"]],
    ["#officers", ["UK3CB_CCM_O_OFF"]],
    ["#squadleaders", ["UK3CB_CCM_O_SL"]],
    ["#teamleaders", ["UK3CB_CCM_O_TL"]],
    ["#ats", ["UK3CB_CCM_O_AT"]],
    ["#aats", ["UK3CB_CCM_O_AT_ASST"]],
    ["#machinegunners", ["UK3CB_CCM_O_AR"]],
    ["#demos", ["UK3CB_CCM_O_DEM"]],
    ["#engineers", ["UK3CB_CCM_O_ENG"]],   
    ["#marksmen", ["UK3CB_CCM_O_MK"]],
    ["#medics", ["UK3CB_CCM_O_MD"]], 
    ["#riflemen", ["UK3CB_CCM_O_RIF_1", "UK3CB_CCM_O_RIF_2", "UK3CB_CCM_O_RIF_LITE", "UK3CB_CCM_O_RIF_BOLT"]],
    ["#snipers", ["UK3CB_CCM_O_SNI"]],
    ["#spotters", ["UK3CB_CCM_O_SPOT"]]      
];

//Squads

_infSquads = [
    ["UK3CB_CCM_O_SL", "UK3CB_CCM_O_TL", "UK3CB_CCM_O_MD", "UK3CB_CCM_O_AR", "UK3CB_CCM_O_RIF_1", "UK3CB_CCM_O_ENG", "UK3CB_CCM_O_RIF_2", "UK3CB_CCM_O_MK"],     2,
    ["UK3CB_CCM_O_SL", "UK3CB_CCM_O_TL", "UK3CB_CCM_O_MD", "UK3CB_CCM_O_MK", "UK3CB_CCM_O_RIF_BOLT", "UK3CB_CCM_O_RIF_1", "UK3CB_CCM_O_ENG", "UK3CB_CCM_O_DEM"], 1.75,
    ["UK3CB_CCM_O_SL", "UK3CB_CCM_O_TL", "UK3CB_CCM_O_MD", "UK3CB_CCM_O_AT", "UK3CB_CCM_O_AT_ASST", "UK3CB_CCM_O_MK", "UK3CB_CCM_O_AR", "UK3CB_CCM_O_RIF_1"],    2.5
];

//Teams

_infTeams = [
    ["UK3CB_CCM_O_TL", "UK3CB_CCM_O_AR", "UK3CB_CCM_O_AR", "UK3CB_CCM_O_RIF_2"],          2,
    ["UK3CB_CCM_O_TL", "UK3CB_CCM_O_RIF_2", "UK3CB_CCM_O_RIF_BOLT", "UK3CB_CCM_O_RIF_1"], 2,
    ["UK3CB_CCM_O_TL", "UK3CB_CCM_O_MK", "UK3CB_CCM_O_MK", "UK3CB_CCM_O_RIF_BOLT"],       1.75,
    ["UK3CB_CCM_O_TL", "UK3CB_CCM_O_AT", "UK3CB_CCM_O_AT_ASST", "UK3CB_CCM_O_RIF_1"],     2
];

_atTeams = [
    ["UK3CB_CCM_O_TL", "UK3CB_CCM_O_AT", "UK3CB_CCM_O_AT", "UK3CB_CCM_O_AT_ASST"], 1.5
];

_srTeams = [
    ["UK3CB_CCM_O_SNI", "UK3CB_CCM_O_SPOT"], 0.75
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#teams", _infTeams]];
_infantryMappings insert [["#at_teams", _atTeams]];
_infantryMappings insert [["#sniper_teams", _srTeams]];

_factionMapping insert [
    ["#infantry", _infantryMappings]
];

InA_FactionMappings insert [["CCM", _factionMapping]];