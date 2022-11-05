/*
    Initializes the variables for the main AO

*/

InA_Server_mainAOUnits = [];
InA_Server_subObjUnits = [];
InA_Server_currentAO = nil;
InA_Server_manualAO = nil;
InA_Server_MainAOShutdown = false;

// Load persistant data
private _wipePersistantData = (["AOPersistanceWipe", 0] call BIS_fnc_getParamValue) == 1;

if (_wipePersistantData) then {
    profileNamespace setVariable [format ["InA_controlledZones_%1", worldName], []];
    profileNamespace setVariable [format ["InA_capturedFOBs_%1", worldName], []];
    saveProfileNamespace;
};

private _loadPersistantSave = (["AOPersistance", 0] call BIS_fnc_getParamValue) == 1;

if (_loadPersistantSave) then {
    InA_Server_controlledZones = profileNamespace getVariable [format ["InA_controlledZones_%1", worldName], []];
    InA_Server_capturedFOBs = profileNamespace getVariable [format ["InA_capturedFOBs_%1", worldName], []];
} else {
    InA_Server_controlledZones = [];
    InA_Server_capturedFOBs = [];
};


// AO completion counters
private _aoCompletionCount = (["AOCompletionCount", -1] call BIS_fnc_getParamValue);
private _aoCount = ((count ("true" configClasses (missionConfigFile >> worldName >> "AOs"))) - (count InA_Server_BaseArray));

if ((_aoCompletionCount == -1) || {_aoCompletionCount >= _aoCount}) then {
    InA_Server_MainAOsToComplete = _aoCount;
} else {
    InA_Server_MainAOsToComplete = _aoCompletionCount;
};


// Check if the loaded data isn't past the complete point
if ((count InA_Server_controlledZones) >= InA_Server_MainAOsToComplete) then {
    InA_Server_controlledZones = [];
    InA_Server_capturedFOBs = [];
};

if ((count InA_Server_controlledZones) < count InA_Server_StaticBases) then {
    InA_Server_controlledZones append InA_Server_StaticBases;
};


// Select the last AO played so the next AO can be chosen based upon this AO
private _currentAOIndex = nil;

if (InA_Server_controlledZones isEqualTo InA_Server_StaticBases) then {
    _currentAOIndex = 0;
} else {
    _currentAOIndex = ((count InA_Server_controlledZones) - 1);
};

InA_Server_currentAO = (InA_Server_controlledZones # _currentAOIndex);


// Spawn in any FOBs we already captured
if ((count InA_Server_capturedFOBs) > 0) then {
    {
        [_x] spawn {
            [_this select 0] call AW_fnc_BaseManager;
        };

        InA_Server_controlledZones pushBackUnique _x;
    } forEach InA_Server_capturedFOBs;
};


// Set initial capture progress
private _progress = (round ((((count InA_Server_controlledZones) - (count InA_Server_StaticBases)) / InA_Server_MainAOsToComplete) * 100));
"captureProgress" setMarkerText format ["Capture progress: %1%2", _progress, "%"];

// Start this baby up
[format ["Starting up Main_Machine, HCs connected: %1", (count InA_Server_HeadlessClients)], "AO", true] call AW_fnc_log;
InA_Server_mainScriptHandle = execVM "Missions\Main\Main_Machine.sqf";
