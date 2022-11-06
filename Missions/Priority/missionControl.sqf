/*
Author: Quiksilver
Description: Priority Mission control
*/

if (!isServer) exitWith {};

private _delay = 1500 + (random 600);
private _loopTimeout = 10;

if (isNil "InA_prioMissionList") then {
    InA_prioMissionList = [];

    {
        InA_prioMissionList pushBack _x;
    } forEach (getArray (missionConfigFile >> worldName >> "Missions" >> "Prios"));
};

waitUntil {
    sleep 10;
    !isNil "InA_Server_currentAO" && {!(InA_Server_currentAO in InA_Server_controlledZones)}
};

if (isNil "InA_PrevPrioObj") then {
    InA_PrevPrioObj = [];

    private _prevCount = (ceil ((count InA_prioMissionList) * 0.5));

    for [{_i = 0}, {_i < _prevCount}, {_i = (_i + 1)}] do {
        InA_PrevPrioObj set [_i, "#dummy#"];
    };
};

while {InA_Server_missionActive} do {
    private _minPlayerCount = 15 + (round (random 5));

    if (InA_Server_PlayerCount >= _minPlayerCount) then {

        private _viableOptions = (InA_prioMissionList - InA_PrevPrioObj);

        private _mission = (selectRandom _viableOptions);

        InA_PrevPrioObj deleteAt 0;
        InA_PrevPrioObj pushBack _mission;

        private _uri = "missions\Priority\prio_%1.sqf";

        [format ["Spawning Priomission '%1'", _mission], "PRIO"] call AW_fnc_log;

        private _currentMission = execVM format [_uri, _mission];
        InA_Server_PrioMissionSpawned = false;
        _shouldterminate = true;

        for "_i" from 1 to 60 do {
            sleep 1;

            if (InA_Server_PrioMissionSpawned) exitWith {
                _shouldterminate = false;
                [format ["Priomission '%1' spawned", _mission], "PRIO"] call AW_fnc_log;
            };
        };

        if (_shouldterminate) then {
            terminate _currentMission;
            [format ["ERROR: Priomission '%1' failed to spawn and was terminated!", _mission], "PRIO", true] call AW_fnc_log;
            continue;
        };

        waitUntil {sleep 5;	scriptDone _currentMission};

        [format ["Priomission '%1' completed", _mission], "PRIO"] call AW_fnc_log;

        sleep _delay;
    };

    sleep _loopTimeout;
};
