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

if (!isServer) exitWith {};

scriptName "factionDefines";

InA_FactionMappingsDefined = false;

InA_FactionMappings = createHashMap;

// Vanilla factions
#include "factions\CSAT.sqf"
#include "factions\AAF.sqf"
#include "factions\FIA.sqf"
#include "factions\SYND.sqf"
#include "factions\CSAT_T.sqf"

// Prairie Fire factions
#include "factions\PAVN.sqf"
#include "factions\VC_M.sqf"
#include "factions\VC_L.sqf"

// Western Sahara factions
#include "factions\SFIA.sqf"
#include "factions\TURA.sqf"

// 3CB factions
#include "factions\CCM.sqf"
#include "factions\TLA.sqf"
#include "factions\RUSSIA.sqf"
#include "factions\CDHKZ.sqf"
#include "factions\TNA.sqf"
#include "factions\TI.sqf"
#include "factions\SAF.sqf"


InA_EnemyFaction = "CSAT";
private _requiredAddons = ["A3_Data_F_AoW_Loadorder"];
private _factionIdx = (["EnemyFaction", -1] call BIS_fnc_getParamValue);

if (_factionIdx == -1) then {
    ["EnemyFaction parameter missing, defaulting to CSAT ....", (str _thisScript)] call AW_fnc_log;
} else {
    switch _factionIdx do {
        case 0: {
            InA_EnemyFaction = "CSAT";
        };

        case 1: {
            InA_EnemyFaction = "CSAT_T";
        };

        case 2: {
            InA_EnemyFaction = "AAF";
        };

        case 3: {
            InA_EnemyFaction = "PAVN";
            _requiredAddons = ["loadorder_f_vietnam"];
        };

        case 4: {
            InA_EnemyFaction = "SFIA";
            _requiredAddons = ["data_f_lxWS_Loadorder"];
        };
        case 5: {
            InA_EnemyFaction = "CHDKZ";
            //_requiredAddons = ["UK3CB_Factions_Equipment", "UK3CB_Factions_Vehicles_Military_Loadorder", "UK3CB_Factions_Weapons"];
        };
        case 6: {
            InA_EnemyFaction = "TNA";
        };
        case 7: {
            InA_EnemyFaction = "RUSSIA";
        };
        default {
            [(format ["Unknown EnemyFaction parameter (%1), defaulting to CSAT ....", _factionIdx]), (str _thisScript)] call AW_fnc_log;
        };
    };
};

if !(InA_EnemyFaction in InA_FactionMappings) then {
    [(format ["Faction '%1' not defined in FactionMapping, defaulting to CSAT ....", InA_EnemyFaction]), (str _thisScript)] call AW_fnc_log;
    InA_EnemyFaction = "CSAT";
};

private _cfgPatches = (("true" configClasses (configFile >> "CfgPatches")) apply {toLower (configName _x)});
_requiredAddons = (_requiredAddons apply {toLower _x});

private _hasRequiredAddons = ((_requiredAddons arrayIntersect _cfgPatches) isEqualTo _requiredAddons);

if (!_hasRequiredAddons) then {
    [(format ["Required addon(s) (%2) for faction '%1' not loaded, defaulting to CSAT ....", InA_EnemyFaction, _requiredAddons]), (str _thisScript)] call AW_fnc_log;
    InA_EnemyFaction = "CSAT";
};

InA_EnemyFactionHash = (InA_FactionMappings get InA_EnemyFaction);

InA_FactionMappingsDefined = true;