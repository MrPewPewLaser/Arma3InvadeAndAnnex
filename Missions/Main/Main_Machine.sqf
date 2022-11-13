/* Author: BACONMOP
Description: Main selector for the main AO's
*/
// captureProgress
private _aosConfigPath = (missionConfigFile >> worldName >> "AOs");

while {InA_Server_missionActive} do {
    if (!isNil "InA_Server_manualAO") then {
        InA_Server_currentAO = InA_Server_manualAO;
        InA_Server_manualAO = nil;
    } else {
        InA_Server_currentAO = [InA_Server_currentAO] call AW_fnc_getAo;
    };

    "aoCircle" setMarkerSize [InA_Server_MainAOSize, InA_Server_MainAOSize];
    "aoCircle" setMarkerAlpha 0.5;
    InA_Server_mainAoSpawnCompleted = false;

    if (isNil "InA_Server_currentAO") then {
        private _msg = format ["ERROR: Aquisition of new AO failed. HCs connected: %1", (count InA_Server_HeadlessClients)];
        [_msg, "AO", true] call AW_fnc_log;
    };

    ["InA_Event_UpdateCurrentAO", InA_Server_currentAO] remoteExecCall ["AW_fnc_eventTrigger", 0, true];

    InA_Server_mainAOUnits = [];

    private _name = (_aosConfigPath >> InA_Server_currentAO >> "name") call BIS_fnc_getCfgData;

    // Delay and messatge before new AO starts spawning
    private _newAOtext = format["<t align='center' size='2.2'>Intel Received</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>Intel suggests enemy forces are assembling around %1, stay clear of the area!", _name ];
    [_newAOtext] remoteExec ["AW_fnc_globalHint", 0];

    sleep 30;

    InA_Server_MainAO_Completed = false;

    private _factionHash = InA_EnemyFactionHash;
	
    if ((toLower worldName) == "altis") then {
        private _faction = (selectRandomWeighted ["Russia", 1, "SAF", 0.35]);

        _factionHash = (InA_FactionMappings get _faction);
    };

    [format ["Spawning Main AO '%1'", _name], "AO", false] call AW_fnc_log;

    [InA_Server_currentAO, nil, _factionHash] call derp_fnc_mainAOSpawnHandler;

    private _timer = 0;

    while {!InA_Server_mainAoSpawnCompleted} do {
        sleep 1;
        _timer = _timer + 1;

        if (_timer > 120) exitWith {
            private _msg = format ["ERROR: AO %1 failed to spawn its units in under 2 minutes. HCs connected: %2", _name, (count InA_Server_HeadlessClients)];
            [_msg, "AO", true] call AW_fnc_log;
        };
    };

    //Spawn Markers and Notifications -----------------------
    "aoMarker" setMarkerText _name;
    {_x setMarkerPos (getMarkerPos InA_Server_currentAO)} forEach ["aoCircle", "aoMarker"];
    private _targetStartText = format ["<t align='center' size='2.2'>New Target</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>We have a new objective you you. High Command has decided that the enemy forces near %1 needs to be defeated.<br/><br/>Don't forget about the secondary targets.", _name];
    [_targetStartText] remoteExec ["AW_fnc_globalHint", 0];

    private _mainAoTaskName = format ["Take %1", _name];
    private _mainAoTaskDesc = format ["Clear %1 of hostile forces.", _name];

    [
        west,
        "MainAoTask",
        [
            _mainAoTaskDesc,
            _mainAoTaskName,
            InA_Server_currentAO
        ],
        (getMarkerPos InA_Server_currentAO),
        "Created",
        0,
        true,
        "attack",
        true
    ] call BIS_fnc_taskCreate;

    InA_Server_MainAO_SubObjComplete = false;
    InA_Server_MainAO_SubObjScriptHandle = [_factionHash] execVM "Missions\Main\SubObj.sqf";

    waitUntil {
        sleep 1;
        InA_Server_MainAO_SubObjComplete || !InA_Server_missionActive
    };

    [format ["AO %1 subobjective completed", InA_Server_currentAO], "AO", false] call AW_fnc_log;

    InA_MainAOTrigger = createTrigger ["EmptyDetector", (getMarkerPos InA_Server_currentAO)];
    InA_MainAOTrigger setTriggerArea [InA_Server_MainAOSize, InA_Server_MainAOSize, 0, false];
    InA_MainAOTrigger setTriggerActivation ["ANY", "PRESENT", false];
    InA_MainAOTrigger setTriggerStatements ["this","",""];

    sleep 2;

    if ((count ((list InA_MainAOTrigger) select {alive _x && {(str (side _x)) in ["EAST", "GUER"]}})) > InA_Server_MainAOEnemiesThreshold) then {
        private _heliReinf = [InA_Server_currentAO, "airCavSpawnMarker", _factionHash] call AW_fnc_airCav;
        InA_Server_mainAOUnits append _heliReinf;
        [format ["AO %1 reinf spawned", InA_Server_currentAO], "AO", false] call AW_fnc_log;
    };

    waitUntil {
        sleep 1;

        private _enemyArray = ((list InA_MainAOTrigger) select {alive _x && {(str (side _x)) in ["EAST", "GUER"]}});
        private _enemyCount = (count _enemyArray);

        ((!InA_Server_missionActive || InA_Server_MainAOShutdown) || {(!triggerActivated InA_MainAOTrigger) || {(_enemyCount < InA_Server_MainAOEnemiesThreshold)}})
    };

    [format ["AO %1 completed, starting cleanup", InA_Server_currentAO], "AO", false] call AW_fnc_log;

    // Main AO shutdown requested
    if (!InA_Server_missionActive || InA_Server_MainAOShutdown) then {
        ["Main AO cancelled, thread exiting ....", "AO", true] call AW_fnc_log;

        [InA_MainAOTrigger] call AW_fnc_delete;

        0 = ["MainAoTask", "Canceled"] spawn AW_fnc_finishTask;

        [(InA_Server_mainAOUnits + InA_Server_subObjUnits)] call AW_fnc_delete;

        "aoMarker" setMarkerText "";

        {
            _x setMarkerPos [-10000, -10000, -10000];
        } forEach ["aoCircle", "aoMarker"];

        InA_Server_mainAOUnits = [];
        InA_Server_subObjUnits = [];

        InA_Server_MainAO_Completed = true;

        break;
    };

    InA_Server_MainAO_Completed = true;

    InA_Server_controlledZones pushBackUnique InA_Server_currentAO;
    [InA_MainAOTrigger] call AW_fnc_delete;
    ["InA_Event_UpdateControlledZones", InA_Server_currentAO] remoteExecCall ["AW_fnc_eventTrigger", 0, true];

    private _targetStartText = format ["<t align='center' size='2.2'>Secured</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>Good work out there. We have provided you with some light assets to help you redeploy to the next assignment.", _name];
    [_targetStartText] remoteExec ["AW_fnc_globalHint", 0];

    0 = ["MainAoTask"] spawn AW_fnc_finishTask;

    [(InA_Server_mainAOUnits + InA_Server_subObjUnits)] call AW_fnc_delete;

    [format ["AO %1 completed and cleaned up", InA_Server_currentAO], "AO", false] call AW_fnc_log;

    "aoMarker" setMarkerText "";

    {
        _x setMarkerPos [-10000, -10000, -10000];
    } forEach ["aoCircle", "aoMarker"];

    InA_Server_mainAOUnits = [];
    InA_Server_subObjUnits = [];

    if (isClass (_aosConfigPath >> InA_Server_currentAO >> "Base")) then {
        [InA_Server_currentAO] call AW_fnc_BaseManager;
    };

    profileNamespace setVariable [format ["InA_controlledZones_%1", worldName], InA_Server_controlledZones];
    saveProfileNamespace;

    if ((count InA_Server_controlledZones) >= InA_Server_MainAOsToComplete) then {
        InA_Server_missionActive = false;
        0 = [] spawn {
            profileNamespace setVariable [format ["InA_capturedFOBs_%1", worldName], []];
            profileNamespace setVariable [format ["InA_controlledZones_%1", worldName], []];
            saveProfileNamespace;
            sleep 1;
            
            ["success", true, true, true, false] remoteExec ["BIS_fnc_endMission", 0];
        };
    };

    private _progress = (round ((((count InA_Server_controlledZones) - (count InA_Server_StaticBases)) / InA_Server_MainAOsToComplete) * 100));
    "captureProgress" setMarkerText format ["Capture progress: %1%2", _progress, "%"];

    /*
    // Admin wanted a restart
    if (!isNil "InA_Server_missionRestartAfterCurrentAO" && {InA_Server_missionRestartAfterCurrentAO}) then {
        ["missionRestart"] call AW_fnc_ServerCommand;
    };

    if (!isNil "InA_Server_serverRestartAfterCurrentAO" && {InA_Server_serverRestartAfterCurrentAO}) then {
        ["serverRestart"] call AW_fnc_ServerCommand;
    };
    */

    sleep 30;
};

if (!InA_Server_missionActive || InA_Server_MainAOShutdown) exitWith {};

[(format ["ERROR: something went wrong, the end of main_machine.sqf was reached after AO: %1.", InA_Server_currentAO]), "AO", true] call AW_fnc_log;
