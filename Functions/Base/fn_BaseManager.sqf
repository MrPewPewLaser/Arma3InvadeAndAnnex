/*
Author:  BACONMOP
Description: For new Spawned bases

Last edited: 20/10/2017 by stanhope
Edited: Names of respawn markers + teleporter
*/
params ["_base"];

if (!isServer) exitWith {};

if (isRemoteExecuted && {!([remoteExecutedOwner] call AW_fnc_isStaff)}) exitWith {
    private _caller = objNull;
    private _players = allPlayers;

    private _playerIdx = (_players findIf {(owner _x) == remoteExecutedOwner});

    if (_playerIdx != -1) then {
        _caller = (_players # _playerIdx);
    };

    private _msg = (format ["%1 :: Non Staff player %1 (%2) tried to spawn a FOB (%3)!", _fnc_scriptName, (name _caller), (getPlayerUID _caller), _base]);
    [_msg, "VIOLATION", true] call AW_fnc_log;
};

InA_Server_capturedFOBs pushBackUnique _base;
profileNamespace setVariable [format ["InA_capturedFOBs_%1", worldName], InA_Server_capturedFOBs];
saveProfileNamespace;

private _aoConfigPath = (missionConfigFile >> worldName >> "AOs" >> _base);
private _baseType = (getText (_aoConfigPath >> "Base" >> "baseType"));

// Respawn Position & markers -------------------------------
private _baseRespawnMarker = (getText (_aoConfigPath >> "Base" >> "spawn"));
private _respawnMarkerPos = (getMarkerPos _baseRespawnMarker);
private _basevisMarker = (getText (_aoConfigPath >> "Base" >> "marker"));
private _baseArsenal = (getText (_aoConfigPath >> "Base" >> "arsenal"));

_basevisMarker setMarkerPos _respawnMarkerPos;

if (_basevisMarker in InA_Server_BaseArray) exitWith {[format ["FOB %1 creation was requested but it has already been created", _base], "ERROR"] call AW_fnc_log;};

InA_Server_BaseArray pushBackUnique _basevisMarker;
["InA_Event_UpdateBaseArray", _basevisMarker] remoteExecCall ["AW_fnc_eventTrigger", 0, true];

InA_Server_controlledZones pushBackUnique _base;
["InA_Event_UpdateControlledZones", _base] remoteExecCall ["AW_fnc_eventTrigger", 0, true];

// Reward markers
private _baseCfgRewardMarkers = (getArray (_aoConfigPath >> "Base" >> "reward_markers"));

if (_baseCfgRewardMarkers isNotEqualTo []) then {
    private _baseRewardMarkers = [];

    {
        if ((markerType _x) != "") then {
            _baseRewardMarkers pushBack _x;
        };
    } forEach _baseCfgRewardMarkers;

    if (_baseRewardMarkers isNotEqualTo []) then {
        InA_Server_RewardMarkerHash insert [[_basevisMarker, _baseRewardMarkers]];
    };
};


// Create the crate -----------------------
private _arsenalPos = (getMarkerPos [_baseArsenal, true]);
private _arsenal = [_arsenalPos, nil, nil, true, _base] call AW_fnc_arsenalCreate;

if ((_baseType == "FOB") && {_baseRespawnMarker != ""}) then {
    private _respawnMarker = [west, _respawnMarkerPos, _basevisMarker] call BIS_fnc_addRespawnPosition;

    // Vehicles ---------------------------------------
    private _baseVehicles = (getArray (_aoConfigPath >> "Base" >> "vehicles"));

    {
        _x params ["_veh", "_mkr", "_timer"];

        private _vehType = nil;

        if (!(isClass (configFile >> "CfgVehicles" >> _veh))) then {
            private _vehArray = [_veh] call AW_fnc_vehicleLookup;
            _vehType = (_vehArray # 0);
        } else {
            _vehType = _veh;
        };

        private _spawnPos = (getMarkerPos _mkr);
        private _vehicle = createVehicle [_vehType, [0,0,0] getPos [random 50, random 360], [], 50, "NONE"];
        _vehicle setDir (markerDir _mkr);
        if (_vehicle isKindOf "Ship") then {
            _vehicle setPosASL [(_spawnPos # 0), (_spawnPos # 1), 1];
        } else {
            _vehicle setPosATL [(_spawnPos # 0), (_spawnPos # 1), 0.3];
        };

        [[_vehicle]] call AW_fnc_addToAllCurators;
        [_vehicle, _timer, _base, _veh, (getPosWorld _vehicle)] spawn AW_fnc_vBaseMonitor;
    } forEach _baseVehicles;
};

private _fobStuff = (((allMissionObjects "all") + (allSimpleObjects [])) select {(_x distance2D _respawnMarkerPos) < 250});

// Unhide
{
    if (isObjectHidden _x) then {
        _x hideObjectGlobal false;
    };
} forEach _fobStuff;

private _createGroundServiceMarker = {
    params ["_name", "_pos"];
    private _mrk = createMarker [_name,_pos];
    _mrk setMarkerShape "ICON";
    _mrk setMarkerType "b_maint";
    _mrk setMarkerText "Ground service";
    _mrk setMarkerSize [0.5, 0.5];
};
private _createAirServiceMarker = {
    params ["_name", "_pos"];
    private _mrk = createMarker [_name,_pos];
    _mrk setMarkerShape "ICON";
    _mrk setMarkerType "o_maint";
    _mrk setMarkerColor "colorBLUFOR";
    _mrk setMarkerText "Air service";
    _mrk setMarkerSize [0.5, 0.5];
};

// Altis service pads
if (isClass (_aoConfigPath >> "ServicePads")) then {
    private _airRepairMarkers = (getArray (_aoConfigPath >> "ServicePads" >> "Air"));
    private _groundRepairMarkers = (getArray (_aoConfigPath >> "ServicePads" >> "Ground"));

    {
        _x call AW_fnc_repairInitAirServicePoint;
    } forEach _airRepairMarkers;

    {
        _x call AW_fnc_repairInitGroundServicePoint;
    } forEach _groundRepairMarkers;
};

//FOB specific stuff
switch (_base) do {
	case "Terminal":{
        private _docksScript = [_arsenal] spawn {
            params ["_arsenal"];

            private _pole = createVehicle ["Flag_NATO_F", [0, 0, 0], [], 50, "NONE"];
            _pole allowDamage false;
            _pole setDir 166;
            _pole setPosATL [15341.8, 15797.3, 10.5938];

            private _docksMarker = createMarker ["term_docks_ico", [15338.5, 15797.1]];
            _docksMarker setMarkerShape "ICON";
            _docksMarker setMarkerType "b_naval";
            _docksMarker setMarkerColor "colorBLUFOR";
            _docksMarker setMarkerText "Boats";
            _docksMarker setMarkerSize [0.5, 0.5];

            private _rewardMarker = createMarker ["term_rewards_ico", [15314.1,17336.2]];
            _rewardMarker setMarkerShape "ICON";
            _rewardMarker setMarkerType "b_unknown";
            _rewardMarker setMarkerColor "colorBLUFOR";
            _rewardMarker setMarkerText "Rewards";
            _rewardMarker setMarkerSize [0.5, 0.5];

            // Teleport to Guardian docks
            [_arsenal, {
                params ["_arsenal"];

                if (!hasInterface) exitWith {};

                private _act = _arsenal addAction [
                    "<t color='#009ACD'>Teleport to Docks</t>",
                    {
                        params ["_target", "_caller", "_actionId", "_arguments"];

                        cutText ["","BLACK OUT"];
                        sleep 1;
                        [_caller, "Terminal_Docks"] remoteExec ["AW_fnc_baseTeleport", 2];
                        sleep 1;
                        cutText ["","BLACK IN"];
                    },
                    nil,
                    -100,
                    false,
                    true,
                    "",
                    "true",
                    10
                ];
            }] remoteExec ["call", 0, true];

            // Teleport to Guardian from docks
            [_pole, {
                params ["_pole"];

                if (!hasInterface) exitWith {};

                private _act = _pole addAction [
                    "<t color='#009ACD'>Teleport to FOB Guardian</t>",
                    {
                        params ["_target", "_caller", "_actionId", "_arguments"];

                        cutText ["","BLACK OUT"];
                        sleep 1;
                        [_caller, "Terminal"] remoteExec ["AW_fnc_baseTeleport", 2];
                        sleep 1;
                        cutText ["","BLACK IN"];
                    },
                    nil,
                    -100,
                    false,
                    true,
                    "",
                    "true",
                    10
                ];
            }] remoteExec ["call", 0, true];
        };
    };

    case "AAC_Airfield": {};
    case "Stadium": {};
    case "Molos_Airfield": {};
    case "Corton":{
        cortonGroundServiceTrigger setPos (getPos cortonGroundServicePad);
        ["GuardianGroundService",(getPos cortonGroundServicePad)] call _createGroundServiceMarker;
        cortonAirServiceTrigger setPos (getPos cortonAirServicePad);
        ["GuardianAirService",(getPos cortonAirServicePad)] call _createAirServiceMarker;
    };
    case "AO_SanBayBan": {
        sbbServiceGroundTrigger setPos (getPos sbbGroundServicePad);
        ["ssbGroundService",(getPos sbbGroundServicePad)] call _createGroundServiceMarker;
        sbbServiceAirTrigger setPos (getPos sbbAirServicePad);
        ["ssbAirService",(getPos sbbAirServicePad)] call _createAirServiceMarker;
    };
    case "AO_MaiLoc": {
        mlServiceTrigger setPos (getPos mlGroundServicePad);
        ["mlGroundService",(getPos mlGroundServicePad)] call _createGroundServiceMarker;
    };
    case "AO_PemPatBase": {
        CrocodileServiceTrigger setPos (getPos ppGroundServicePad);
        ["ppGroundService",(getPos ppGroundServicePad)] call _createGroundServiceMarker;
    };
    case "AO_DaoTrai": {
        dtServiceTrigger setPos (getPos dtGroundServicePad);
        ["dtGroundService",(getPos dtGroundServicePad)] call _createGroundServiceMarker;
    };
     case "AO_PleikuBoatBase": {
        pbServiceTrigger setPos (getPos pbGroundServicePad);
        ["pbGroundService",(getPos pbGroundServicePad)] call _createGroundServiceMarker;
    };
	default {
        private _text = format ["ERROR: AW_fnc_BaseManager did not recognize '%1' as an FOB", _base];
        [_text, "BASE", true] call AW_fnc_log;
	};
};

// Notification ----------------------------------------
private _txt = format["<t align='center' size='2.2'>Base Taken</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>Good Job. We have now setup a base at that location.<br/><br/>We have provided you with some vehicles at that the new FOB.", markerText _basevisMarker];
[_txt] remoteExec ["AW_fnc_globalHint", 0];
