/*
 * Author: Whigital
 * Description:
 * InA mission variable initialzation
 *
 *
 */

if (!isServer) exitWith {};

InA_Server_missionActive = true;

InA_Server_RespawnVehiclesArray = [];
InA_Server_blacklistPositions = [];
InA_Server_blacklistPositionTimers = createHashMap;
InA_Server_MapSpecificBlacklistPositions = [];
InA_Server_RewardMarkerHash = createHashMap;
InA_Server_prioUnits = [];
InA_Server_sideUnits = [];
InA_Server_controlledZones = [];
InA_Server_capturedFOBs = [];
InA_Server_StaticBases = [];
InA_Server_BaseArray = [];


// Collect params
InA_Server_MainAOSize = ["AOSize", 800] call BIS_fnc_getParamValue;
InA_Server_MissionMinDistance = (["MissionSpawnRange", 2500] call BIS_fnc_getParamValue);

InA_Server_MainAODistanceArray = [
    (["AOSearchRadiusMin", 2500] call BIS_fnc_getParamValue),
    (["AOSearchRadiusOuter", 2500] call BIS_fnc_getParamValue)
];

InA_Server_AISkillsFromServer = ([false, true] # (["UseServerSkillSettings", 0] call BIS_fnc_getParamValue));
InA_Server_MainAOEnemiesThreshold = (["AOEnemiesThreshold", 8] call BIS_fnc_getParamValue);
InA_Server_TransferZeusUnitsToHC = ([false, true] select (["TransferZeusUnitsToHC", 1] call BIS_fnc_getParamValue));


// Set reinforcement limits and update playercount
InA_Server_AOReinforceThresholds = createHashMap;

InA_Server_AOReinforceThresholds insert [
    ["Para", []],
    ["Vehicle", [15, 60, 1, 8]],
    ["Heli", [15, 60, 1, 6]],
    ["Jet", [15, 60, 1, 4]]
];

InA_Server_AOReinforceVehicleLimit = 0;
InA_Server_AOReinforceVehicleCount = 0;

InA_Server_AOReinforceHeliLimit = 0;
InA_Server_AOReinforceHeliCount = 0;

InA_Server_AOReinforceJetLimit = 0;
InA_Server_AOReinforceJetCount = 0;


// BaseArray setup
{
    InA_Server_StaticBases pushBack _x;
} forEach (getArray (missionConfigFile >> worldName >> "Bases" >> "staticBases"));

{
    InA_Server_BaseArray pushBack _x;
    ["InA_Event_UpdateBaseArray", _x] remoteExecCall ["AW_fnc_eventTrigger", 0, true];
    ["InA_Event_UpdateControlledZones", _x] remoteExecCall ["AW_fnc_eventTrigger", 0, true];
} forEach InA_Server_StaticBases;

private _fullArsenal = ((["GearRestriction", 1] call BIS_fnc_getParamValue) < 1);


// Init Stevies
{
    private _stevie = (missionNamespace getVariable [_x, objNull]);

    if (isNull _stevie) then {continue};

    ["InA_Event_ArsenalAdded", _stevie] remoteExec ["AW_fnc_eventTrigger", 0, _stevie];
} forEach (getArray (missionConfigFile >> worldName >> "arsenalObjects"));


// Mission blacklist positions
{
    InA_Server_MapSpecificBlacklistPositions pushBack _x;
} forEach (getArray (missionConfigFile >> worldName >> "missionBlacklistPositions"));


// Respawn point at Main Base
[west, (getMarkerPos "BASE"), "Main base"] call BIS_fnc_addRespawnPosition;


// Hide FOBs
0 = [] spawn {
    private _baseMarkers = (getArray (missionConfigFile >> worldName >> "Bases" >> "baseMarkers"));

    {
        private _allStuff = ((getMarkerPos _x) nearObjects 250);
        private _fobStuff = (_allStuff - (nearestTerrainObjects [(getMarkerPos _x), [], 250, false]));

        {
            _x hideObjectGlobal true;
        } forEach _fobStuff;
    } forEach _baseMarkers;
};


// Setup Reward marker hash
private _baseCfgRewardMarkers = (getArray (missionConfigFile >> worldName >> "AOs" >> "BASE" >> "reward_markers"));
private _baseRewardMarkers = [];

{
    if ((markerType _x) != "") then {
        _baseRewardMarkers pushBack _x;
    };
} forEach _baseCfgRewardMarkers;

if (_baseRewardMarkers isNotEqualTo []) then {
    InA_Server_RewardMarkerHash insert [["BASE", _baseRewardMarkers]];
};


// Let's start this baby up
0 = [] spawn {
    0 = execVM "scripts\vehicle\VehicleRespawn.sqf";

    if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
        0 = execVM "scripts\misc\radioChannelChart.sqf";
    };

    waitUntil {sleep 0.5; (!isNil "InA_UnitDefines_Loaded" && {InA_UnitDefines_Loaded})};

    waitUntil {
        sleep 1;
        (serverTime > 60)
    };

    // Main AOs
    0 = execVM "Missions\Main\Main_Init.sqf";

    // Sides
    if (("sideMissions" call BIS_fnc_getParamValue) == 1) then {
        0 = [] spawn {
            waitUntil {
                sleep (60 + (random 30));
                (!isNil "InA_Server_currentAO")
            };

            InA_Server_sideScriptHandle = execVM "Missions\Side\MissionControl.sqf";
        };
    };

    // Prios
    if (("prioMissions" call BIS_fnc_getParamValue) == 1) then {
        0 = [] spawn {
            waitUntil {
                sleep (90 + (random 30));
                (!isNil "InA_Server_currentAO")
            };

            InA_Server_prioScriptHandle = execVM "Missions\Priority\MissionControl.sqf";
        };
    };

    sleep 5;

    InA_Server_cleanupScriptHandle = execVM "scripts\misc\cleanup.sqf";
    InA_Server_zeusupdaterScriptHandle = execVM "scripts\zeus\zeusupdater.sqf";
};

jetspawnpos = 0;
