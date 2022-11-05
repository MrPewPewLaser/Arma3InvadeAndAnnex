/*
Author:	Quiksilver
Description: Mission control for side missions
*/

if (!isServer) exitWith {};

if (isNil "InA_sideMissionList") then {
    InA_sideMissionList = [];
    {
        InA_sideMissionList pushBack _x;
    } forEach (getArray (missionConfigFile >> worldName >> "Missions" >> "Sides"));
};

if (isNil "InA_SidePrevMissions") then {
    InA_SidePrevMissions = ["PoliceProtection", "PilotRescue"];
};

// How many side missions we want to keep track of for having recently played them.
private _InA_SidePrevMissions_MaxCount = 5;

while {InA_Server_missionActive} do {
    private _mission = selectRandom (InA_sideMissionList - InA_SidePrevMissions);

    InA_SidePrevMissions pushBack _mission;
    if (count InA_SidePrevMissions >= _InA_SidePrevMissions_MaxCount || count InA_SidePrevMissions == count InA_sideMissionList) then {
        InA_SidePrevMissions deleteAt 0;
    };

    //start the mission
    private _uri = "Missions\Side\side_%1.sqf";

    [format ["Spawning Sidemission '%1'", _mission], "SIDE"] call AW_fnc_log;

    private _currentMission = execVM format [_uri, _mission];
    InA_Server_SideMissionSpawned = false;
    _shouldTerminate = true;

    //waiting for the mission to let us know that it successfully spawned
    for "_i" from 1 to 60 do {
        sleep 1;

        if (InA_Server_SideMissionSpawned) exitWith {
            _shouldTerminate = false;
            [format ["Sidemission '%1' spawned", _mission], "SIDE"] call AW_fnc_log;
        };
    };

    if (_shouldTerminate) then {
        terminate _currentMission;
        [format ["ERROR: Sidemission '%1' failed to spawn and was terminated!", _mission], "SIDE", true] call AW_fnc_log;
    } else {
        waitUntil {sleep 10; scriptDone _currentMission};
        [format ["Sidemission '%1' finished", _mission], "SIDE"] call AW_fnc_log;
        sleep (300 + random 600);
    };

    sleep 1;
};
