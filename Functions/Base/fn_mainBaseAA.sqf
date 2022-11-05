/*
Author: ansin11

description: Code that handles the AA protection for main base.

Last modified: 25/01/2018 by stan

modified: rewritten for main base AA
*/

params ["_unit"];

if (isNil "InA_Server_BaseDefensesActive") then {
    InA_Server_BaseDefensesActive = false;
};

if (isNil "InA_Server_BaseDefensesCooldown") then {
    InA_Server_BaseDefensesCooldown = false;
};

if (InA_Server_BaseDefensesActive) exitWith {
    [(parseText format ["<br /><t align='center' font='PuristaBold' size='1.4'>Base AA is already active</t>"]), true, nil, 4, 1, 0.3] remoteExec ["BIS_fnc_textTiles", _unit];
};

if (InA_Server_BaseDefensesCooldown) exitWith {
    [(parseText format ["<br /><t align='center' font='PuristaBold' size='1.4'>Base AA is cooling down</t>"]), true, nil, 4, 1, 0.3] remoteExec ["BIS_fnc_textTiles", _unit];
};

private _msg = format ["Player %1 activated Base AA", (name _unit)];
[format ["[BASE AA] %1", _msg], false] spawn AW_fnc_adminChannelMsg;

// Activate AA
{
    _x setVehicleReportOwnPosition true;
    _x setVehicleReceiveRemoteTargets true;
    _x setVehicleReportRemoteTargets true;
    _x setVehicleRadar 1;
    _x setVehicleAmmo 1;
    _x setAutonomous true;
    _x setVehicleLock "LOCKEDPLAYER";
    createVehicleCrew _x;
    (group (gunner Base_AA)) setGroupIdGlobal [format ["UAV-BaseAA"]];
} forEach [Base_AA];

InA_Server_BaseDefensesActive = true;
[parseText format ["<br /><t align='center' font='PuristaBold' size='1.4'><t color='#0090ff'>Crossroads: </t><br />Base air-defense activated.</t>"], true, nil, 3, 1, 0.3] remoteExec ["BIS_fnc_textTiles", -2];

// Deactivate and enter cooldown after 300 sec
sleep 300;

InA_Server_BaseDefensesActive = false;
InA_Server_BaseDefensesCooldown = true;

{
    _x setVehicleRadar 2;
    _x setVehicleAmmo 0;
    _x setVehicleLock "LOCKED";
    gunner _x call AW_fnc_delete;
} forEach [Base_AA];

// Cooldown complete after 900 sec
[parseText format ["<br /><t align='center' font='PuristaBold'><t size='1.4' color='#0090ff'>Crossroads: </t><t size='1.2'><br />Base air-defense going into cooldown.</t></t>"], true, nil, 3, 1, 0.3] remoteExec ["BIS_fnc_textTiles", -2];
sleep 900;

InA_Server_BaseDefensesCooldown = false;
[parseText format ["<br /><t align='center' font='PuristaBold' size='1.4'><t color='#0090ff'>Crossroads: </t><br />Base air-defense available.</t>"], true, nil, 3, 1, 0.3] remoteExec ["BIS_fnc_textTiles", -2];
