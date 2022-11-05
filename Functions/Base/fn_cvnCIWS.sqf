/*
Author: ansin11
description: Code that handles the AA protection for the carrier.

Last modified: 19/10/2017 by stan
modified: put some more things in the forEach loop
*/

params ["_unit"];

if (isNil "InA_Server_CarrierDefensesActive") then {
    InA_Server_CarrierDefensesActive = false
};

if (isNil "InA_Server_CarrierDefensesCooldown") then {
    InA_Server_CarrierDefensesCooldown = false
};

if (InA_Server_CarrierDefensesActive) exitWith {
    [(parseText format ["<br /><t align='center' font='PuristaBold' size='1.4'>Carrier AA is already active</t>"]), true, nil, 4, 1, 0.3] remoteExec ["BIS_fnc_textTiles", _unit];
};

if (InA_Server_CarrierDefensesCooldown) exitWith {
    [(parseText format ["<br /><t align='center' font='PuristaBold' size='1.4'>Carrier AA is cooling down</t>"]), true, nil, 4, 1, 0.3] remoteExec ["BIS_fnc_textTiles", _unit];
};

private _msg = format ["Player %1 activated Carrier AA", (name _unit)];
[format ["[BASE AA] %1", _msg], false] spawn AW_fnc_adminChannelMsg;

// Activate AA
private _AAs = [CVN_CIWS_1, CVN_CIWS_2, CVN_CIWS_3, CVN_RAM, CVN_SAM_2, CVN_SAM_3];

{
    _x setVehicleReportOwnPosition true;
    _x setVehicleReceiveRemoteTargets true;
    _x setVehicleReportRemoteTargets true;
    _x setVehicleRadar 1;
    _x setVehicleAmmo 1;
    _x setAutonomous true;
    _x setVehicleLock "LOCKEDPLAYER";
    createVehicleCrew _x;
    (group (gunner _x)) setGroupIdGlobal [format ['UAV-CarrierAA-%1', _forEachIndex]];
} forEach _AAs;

InA_Server_CarrierDefensesActive = true;
[parseText format ["<br /><t align='center' font='PuristaBold' size='1.4'><t color='#0090ff'>Crossroads: </t><br />Carrier air-defense activated.</t>"], true, nil, 3, 1, 0.3] remoteExec ["BIS_fnc_textTiles", -2];

// Deactivate and enter cooldown after 300 sec
sleep 300;

InA_Server_CarrierDefensesActive = false;
InA_Server_CarrierDefensesCooldown = true;

{
    _x setVehicleRadar 2;
    _x setVehicleAmmo 0;
    _x setVehicleLock "LOCKED";
    (gunner _x) call AW_fnc_delete;

} forEach _AAs;

// Cooldown complete after 900 sec
[parseText format ["<br /><t align='center' font='PuristaBold'><t size='1.4' color='#0090ff'>Crossroads: </t><t size='1.2'><br />Carrier air-defense going into cooldown.</t></t>"], true, nil, 3, 1, 0.3] remoteExec ["BIS_fnc_textTiles", -2];
sleep 900;

InA_Server_CarrierDefensesCooldown = false;
[parseText format ["<br /><t align='center' font='PuristaBold' size='1.4'><t color='#0090ff'>Crossroads: </t><br />Carrier air-defense available.</t>"], true, nil, 3, 1, 0.3] remoteExec ["BIS_fnc_textTiles", -2];
