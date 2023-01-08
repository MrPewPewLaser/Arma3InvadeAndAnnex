//////////////
//// TLA /////
//////////////

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
    ["#name", "TLA"],
    ["#side", east]
];

//// Infantry ////

// Units

_infantryMappings insert [
    ["#officers", ["rhsgref_tla_warlord"]],
    ["#squadleaders", ["rhsgref_tla_squadleader"]],  
    ["#demos", ["rhsgref_tla_saboteur"]], 
    ["#medics", ["rhsgref_tla_medic"]], 
    ["#engineers", ["rhsgref_tla_mechanic"]],
    ["#marksmen", ["rhsgref_tla_marksman_m14"]], 
    ["#machinegunners", ["rhsgref_tla_machinegunner_mg42"]],
    ["#heavygunners", ["rhsgref_tla_machinegunner"]],  
    ["#riflemen", ["rhsgref_tla_rifleman_vz58", "rhsgref_tla_rifleman_rpg75", "rhsgref_tla_rifleman_pm63", "rhsgref_tla_rifleman_M16", "rhsgref_tla_rifleman_m14", "rhsgref_tla_rifleman_m1", "rhsgref_tla_rifleman_l1a1", "rhsgref_tla_rifleman_akms", "rhsgref_tla_rifleman"]],
    ["#grenadiers", ["rhsgref_tla_grenadier", "rhsgref_tla_grenadier_m79"]],
    ["#crews", ["rhsgref_tla_crew"]],
    ["#ats", ["rhsgref_tla_specialist_at"]],
    ["#lats", ["rhsgref_tla_rifleman_rpg75"]]
];

// Squads
_infSquads = [
    ["rhsgref_tla_squadleader", "rhsgref_tla_rifleman_pm63", "rhsgref_tla_rifleman", "rhsgref_tla_machinegunner", "rhsgref_tla_grenadier", "rhsgref_tla_rifleman_vz58", "rhsgref_tla_machinegunner_mg42w", "rhsgref_tla_grenadier_m79", "rhsgref_tla_specialist_at", "rhsgref_tla_rifleman_M16", "rhsgref_tla_medic"],   1
];

// Teams
_infTeams = [
    ["rhsgref_tla_squadleader", "rhsgref_tla_rifleman_l1a1", "rhsgref_tla_rifleman_m1", "rhsgref_tla_rifleman_m14"], 1

];

_atTeams = [
    ["rhsgref_tla_squadleader", "rhsgref_tla_specialist_at", "rhsgref_tla_specialist_at", "rhsgref_tla_machinegunner_mg42"], 1
];

_infantryMappings insert [["#squads", _infSquads]];
_infantryMappings insert [["#teams", _infTeams]];
_infantryMappings insert [["#at_teams", _atTeams]];

_factionMapping insert [
    ["#infantry", _infantryMappings]
];

InA_FactionMappings insert [["TLA", _factionMapping]];