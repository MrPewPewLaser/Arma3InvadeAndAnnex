///////////////
//// SAF /////
//////////////

private _factionMapping = createHashMap;
private _infantryMappings = createHashMap;
private _vehicleMappings = createHashMap;

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