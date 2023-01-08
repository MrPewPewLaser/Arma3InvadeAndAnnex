////////////////
//// RUSSIA ////
////////////////

private _factionMapping = createHashMap;
private _infantryMappings = createHashMap;
private _vehicleMappings = createHashMap;

_factionMapping insert [
    ["#name", "Russia"],
    ["#side", east],
	["#aux_factions", ["CSAT","AAF","CHDKZ", "FIA", "SYND"]],
    ["#aux_faction_weights", [1, 1, 1, 1.5, 1.5]],
    ["#indep_factions", ["CSAT","AAF"]],
    ["#guer_factions", ["TLA"]]
];

//// Infantry ////

// Units
_infantryMappings insert [
    ["#officers", ["rhs_rva_crew_officer_armored" ,"rhs_msv_emr_officer" ,"rhs_rva_crew_officer" ,"rhs_msv_officer_armored" ,"rhs_rva_crew_officer" ,"rhs_rva_crew_officer_armored" ,"rhs_vdv_officer" ,"rhs_vdv_officer_armored" ,"rhs_vdv_flora_officer_armored" ,"rhs_vdv_flora_officer"]],
    ["#squadleaders", ["rhs_vdv_sergeant" ,"rhs_vdv_flora_sergeant" ,"rhs_vdv_mflora_sergeant" ,"rhs_vdv_recon_sergeant"]],
    ["#teamleaders", ["rhs_msv_emr_efreitor" ,"rhs_msv_efreitor" ,"rhs_vdv_flora_efreitor" ,"rhs_vdv_mflora_efreitor"]],
    ["#riflemen", ["rhs_msv_emr_arifleman", "rhs_msv_emr_arifleman_rpk", "rhs_msv_emr_grenadier", "rhs_msv_emr_rifleman", "rhs_msv_emr_RShG2", "rhs_msv_emr_LAT", "rhs_msv_arifleman", "rhs_msv_arifleman_rpk", "rhs_msv_LAT", "rhs_msv_RShG2", "rhs_vdv_mflora_grenadier", "rhs_vdv_mflora_arifleman_rpk", "rhs_vdv_mflora_rifleman_lite", "rhs_vdv_mflora_LAT", "rhs_vdv_mflora_RShG2"]],
    ["#lats", ["rhs_vdv_LAT" ,"rhs_msv_LAT" ,"rhs_msv_emr_RShG2" ,"rhs_vdv_mflora_LAT" ,"rhs_vdv_mflora_RShG2" ,"rhs_vdv_flora_LAT"]],
    ["#grenadiers", ["rhs_msv_emr_grenadier" ,"rhs_msv_grenadier" ,"rhs_vdv_grenadier" ,"rhs_vdv_grenadier_alt" ,"rhs_vdv_flora_grenadier" ,"rhs_vdv_mflora_grenadier" ,"rhs_vdv_recon_grenadier" ,"rhs_vmf_emr_grenadier"]],
    ["#machinegunners", ["rhs_vdv_flora_arifleman_rpk" ,"rhs_msv_arifleman_rpk" ,"rhs_msv_emr_arifleman_rpk" ,"rhs_mvd_izlom_arifleman_rpk" ,"rhs_vmf_flora_arifleman_rpk" ,"rhs_vmf_emr_arifleman_rpk" ]],
    ["#heavygunners", ["rhs_vdv_arifleman" ,"rhs_msv_arifleman" ,"rhs_msv_emr_arifleman" ,"rhs_mvd_izlom_arifleman" ,"rhs_vmf_recon_arifleman" ,"rhs_vdv_recon_arifleman"]],
    ["#marksmen", ["rhs_vdv_marksman_asval" ,"rhs_vdv_marksman" ,"rhs_vdv_mflora_marksman" ,"rhs_vdv_flora_marksman" ,"rhs_vdv_recon_marksman" ,"rhs_vdv_recon_marksman_asval" ,"rhs_vdv_recon_marksman_vss" ,"rhs_vmf_recon_marksman_vss" ,"rhs_vmf_recon_marksman" ,"rhs_vmf_flora_marksman" ,"rhs_vmf_emr_marksman" ,"rhs_mvd_izlom_marksman_vss" ,"rhs_mvd_izlom_marksman"]],
    ["#sharpshooters", ["rhs_vdv_marksman" ,"rhs_vdv_mflora_marksman" ,"rhs_vmf_flora_marksman" ,"rhs_vmf_emr_marksman"]],
    ["#snipers", ["rhs_vdv_marksman" ,"rhs_vdv_mflora_marksman" ,"rhs_vmf_flora_marksman" ,"rhs_vmf_emr_marksman"]],
    ["#spotters", ["rhs_vdv_flora_rifleman_lite" ,"rhs_vdv_rifleman" ,"rhs_msv_rifleman" ,"rhs_msv_emr_rifleman"]],
    ["#ats", ["rhs_vdv_mflora_at" ,"rhs_msv_emr_at" ,"rhs_msv_at" ,"rhs_vdv_flora_at" ,"rhs_vdv_at"]],
    ["#aas", ["rhs_msv_aa" ,"rhs_msv_emr_aa" ,"rhs_vdv_aa" ,"rhs_vdv_flora_aa"]],
    ["#medics", ["rhs_vdv_recon_medic" ,"rhs_vdv_mflora_medic" ,"rhs_vdv_flora_medic" ,"rhs_vdv_medic"]],
    ["#engineers", ["rhs_vdv_mflora_engineer" ,"rhs_vdv_flora_engineer" ,"rhs_vdv_engineer" ,"rhs_msv_engineer" ,"rhs_msv_emr_engineer"]],
    ["#paras", ["rhs_msv_emr_arifleman", "rhs_msv_emr_arifleman_rpk", "rhs_msv_emr_grenadier", "rhs_msv_emr_rifleman", "rhs_msv_emr_RShG2", "rhs_msv_emr_LAT", "rhs_msv_arifleman", "rhs_msv_arifleman_rpk", "rhs_msv_LAT", "rhs_msv_RShG2", "rhs_vdv_mflora_grenadier", "rhs_vdv_mflora_arifleman_rpk", "rhs_vdv_mflora_rifleman_lite", "rhs_vdv_mflora_LAT", "rhs_vdv_mflora_RShG2"]],
    ["#crews", ["rhs_msv_emr_armoredcrew" ,"rhs_msv_emr_crew" ,"rhs_msv_armoredcrew" ,"rhs_msv_crew" ,"rhs_vdv_armoredcrew" ,"rhs_vdv_crew" ,"rhs_vdv_flora_armoredcrew" ,"rhs_vdv_flora_crew"]],
    ["#heli_pilots", ["rhs_pilot_transport_heli" ,"rhssaf_airforce_o_pilot_mig29" ,"rhs_pilot" ,"rhs_pilot_combat_heli" ,"rhs_pilot_tan"]],
    ["#heli_crews", ["rhs_msv_emr_armoredcrew" ,"rhs_msv_emr_crew" ,"rhs_msv_armoredcrew" ,"rhs_msv_crew" ,"rhs_vdv_armoredcrew" ,"rhs_vdv_crew" ,"rhs_vdv_flora_armoredcrew" ,"rhs_vdv_flora_crew"]],
    ["#pilots", ["rhssaf_airforce_o_pilot_mig29" ,"rhs_pilot" ,"rhs_pilot_combat_heli" ,"rhs_pilot_tan"]],
    ["#repair", ["rhs_vdv_mflora_engineer" ,"rhs_vdv_engineer" ,"rhs_msv_engineer" ,"rhs_msv_emr_engineer"]],
    ["#civs", ["C_man_1","C_sman_polo_1_F_euro","C_man_polo_2_F_euro","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_6_F","C_man_shorts_4_F_asia"]]
];

// Squads
_infSquads = [
    ["rhs_msv_emr_sergeant" ,"rhs_msv_emr_efreitor" ,"rhs_msv_emr_grenadier_rpg" ,"rhs_msv_emr_strelok_rpg_assist" ,"rhs_msv_emr_machinegunner" ,"rhs_msv_emr_machinegunner" ,"rhs_msv_emr_LAT"] ,2,
    ["rhs_msv_emr_sergeant" ,"rhs_msv_emr_efreitor" ,"rhs_msv_emr_grenadier_rpg" ,"rhs_msv_emr_strelok_rpg_assist" ,"rhs_msv_emr_machinegunner" ,"rhs_msv_emr_LAT" ,"rhs_msv_emr_rifleman"] ,2.25,  
    ["rhs_msv_emr_sergeant" ,"rhs_msv_emr_efreitor" ,"rhs_msv_emr_grenadier_rpg" ,"rhs_msv_emr_strelok_rpg_assist" ,"rhs_msv_emr_machinegunner" ,"rhs_msv_emr_machinegunner_assistant" ,"rhs_msv_emr_marksman"] ,2.50,
    ["rhs_msv_junior_sergeant" ,"rhs_msv_efreitor" ,"rhs_msv_machinegunner" ,"rhs_msv_rifleman" ,"rhs_msv_machinegunner" ,"rhs_msv_machinegunner_assistant" ,"rhs_msv_LAT"] ,2,
    ["rhs_msv_junior_sergeant" ,"rhs_msv_efreitor" ,"rhs_msv_grenadier_rpg" ,"rhs_msv_strelok_rpg_assist" ,"rhs_msv_machinegunner" ,"rhs_msv_LAT" ,"rhs_msv_strelok_rpg_assist" ,"rhs_msv_rifleman" ,"rhs_msv_rifleman" ,"rhs_msv_medic"] ,2.75
];
_sfSquads = [
   ["rhs_vmf_recon_sergeant" ,"rhs_vmf_recon_efreitor" ,"rhs_vmf_recon_arifleman" ,"rhs_vmf_recon_arifleman" ,"rhs_vmf_recon_machinegunner_assistant" ,"rhs_vmf_recon_marksman_vss"],    1.25,
   ["rhs_vmf_recon_sergeant" ,"rhs_vmf_recon_efreitor" ,"rhs_vmf_recon_arifleman" ,"rhs_vmf_recon_machinegunner_assistant" ,"rhs_vmf_recon_rifleman_lat" ,"rhs_vmf_recon_grenadier"],    1.25,
   ["rhs_vmf_recon_sergeant" ,"rhs_vmf_recon_efreitor" ,"rhs_vmf_recon_arifleman" ,"rhs_vmf_recon_arifleman" ,"rhs_vmf_recon_machinegunner_assistant" ,"rhs_vmf_recon_marksman_vss"],    1.25,
   ["rhs_vmf_recon_sergeant" ,"rhs_vmf_recon_efreitor" ,"rhs_vmf_recon_arifleman" ,"rhs_vmf_recon_machinegunner_assistant" ,"rhs_vmf_recon_marksman_vss" ,"rhs_vmf_recon_rifleman_lat"], 1.25
];

_vpSquads = _sfSquads;

// Teams
_infTeams = [
   ["rhs_vmf_flora_officer" ,"rhs_vmf_flora_officer_armored" ,"rhs_vmf_flora_officer_armored" ,"rhs_vmf_flora_rifleman"], 2,
   ["rhs_vmf_flora_sergeant" ,"rhs_vmf_flora_machinegunner" ,"rhs_vmf_flora_at" ,"rhs_vmf_flora_strelok_rpg_assist"], 2,
   ["rhs_msv_officer" ,"rhs_msv_officer_armored" ,"rhs_msv_officer_armored" ,"rhs_msv_rifleman"], 2,
   ["rhs_msv_sergeant" ,"rhs_msv_machinegunner" ,"rhs_msv_at" ,"rhs_msv_strelok_rpg_assist"], 2,
   ["rhs_msv_emr_sergeant" ,"rhs_msv_emr_machinegunner" ,"rhs_msv_emr_grenadier_rpg" ,"rhs_msv_emr_strelok_rpg_assist"], 2,
   ["rhs_msv_emr_officer" ,"rhs_msv_emr_officer_armored" ,"rhs_msv_emr_officer_armored" ,"rhs_msv_emr_rifleman"], 2
];

_sfTeams = [
   ["rhs_vmf_recon_officer" ,"rhs_vmf_recon_officer_armored" ,"rhs_vmf_recon_officer_armored" ,"rhs_vmf_recon_rifleman_akms"], 2,
   ["rhs_vmf_recon_sergeant" ,"rhs_vmf_recon_arifleman" ,"rhs_vmf_recon_machinegunner_assistant"], 2,
   ["rhs_vmf_recon_efreitor" ,"rhs_vmf_recon_rifleman_lat" ,"rhs_vmf_recon_grenadier"], 2
];

_vpTeams = _sfTeams;

_atTeams = [
    ["rhs_vmf_flora_junior_sergeant", "rhs_vmf_flora_at", "rhs_vmf_flora_strelok_rpg_assist", "rhs_vmf_flora_at" ,"rhs_vmf_flora_rifleman"], 1.5,
    ["rhs_vdv_junior_sergeant", "rhs_vdv_at", "rhs_vdv_strelok_rpg_assist", "rhs_vdv_at" ,"rhs_vdv_rifleman"],           1.25,
    ["rhs_msv_junior_sergeant", "rhs_msv_at", "rhs_msv_strelok_rpg_assist", "rhs_msv_at" ,"rhs_msv_rifleman"],      1.5,
    ["rhs_msv_emr_junior_sergeant", "rhs_msv_emr_at", "rhs_msv_emr_strelok_rpg_assist", "rhs_msv_emr_at" ,"rhs_msv_emr_rifleman"],   1.25

];

_aaTeams = [
    ["rhs_vmf_flora_junior_sergeant", "rhs_vmf_flora_aa", "rhs_vmf_flora_aa", "rhs_vmf_flora_aa", "rhs_vmf_flora_rifleman"], 1.5,
    ["rhs_vdv_junior_sergeant", "rhs_vdv_aa", "rhs_vdv_aa", "rhs_vdv_aa", "rhs_vdv_rifleman"],                               1.5,
    ["rhs_msv_emr_junior_sergeant", "rhs_msv_emr_aa", "rhs_msv_emr_aa", "rhs_msv_emr_aa", "rhs_msv_emr_rifleman"],           1.5,
    ["rhs_msv_junior_sergeant", "rhs_msv_aa", "rhs_msv_aa", "rhs_msv_aa", "rhs_msv_rifleman"],                               1.5
];

_srTeams = [
    ["rhs_vdv_marksman", "rhs_vdv_rifleman"], 0.75,
    ["rhs_vdv_recon_marksman", "rhs_vdv_recon_rifleman"], 0.75,
    ["rhs_vmf_flora_marksman", "rhs_vmf_flora_rifleman"], 0.75,
    ["rhs_vdv_flora_marksman", "rhs_vdv_flora_rifleman"], 0.75
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
    "rhsgref_ins_zsu234",  2,
    "rhs_zsu234_aa",       2
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

InA_FactionMappings insert [["RUSSIA", _factionMapping]];