/*
 * Author: Whigital
 * Description:
 * Transfers group to HC if enabled and available
 *
 */

params [
    ["_group", grpNull],
    ["_delayCond", []]
];

if (!isServer) exitWith {};

if (isNull _group) exitWith {};

if (InA_Server_HeadlessClients isEqualTo []) exitWith {};

if (!canSuspend) exitWith {
    _this spawn AW_fnc_transferGroupHC;
};

private _hc = (selectRandom InA_Server_HeadlessClients);

if (isNil "_hc") exitWith {};

private _abilities = [
    "AIMINGERROR",
    "ANIM",
    "AUTOCOMBAT",
    "AUTOTARGET",
    "CHECKVISIBLE",
    "COVER",
    "FSM",
    "LIGHTS",
    "MINEDETECTION",
    "MOVE",
    "NVG",
    "PATH",
    "RADIOPROTOCOL",
    "SUPPRESSION",
    "TARGET",
    "TEAMSWITCH",
    "WEAPONAIM"
];

private _delay = (_delayCond isNotEqualTo []);
private _delayTimeout = false;
private _callbackId = call AW_fnc_genUUID;


// If transfer delay requested, fire off a delay tranaction on the HC
if (_delay) then {
    _delayCond params [["_args", []], ["_code", {sleep 5}], ["_timeout", 120]];

    if (isNil "AW_fnc_transferGroupHC_callbackIds") then {
        AW_fnc_transferGroupHC_callbackIds = createHashMap;
    };

    AW_fnc_transferGroupHC_callbackIds set [_callbackId, false];

    private _waituntil = (serverTime + _timeout);

    ["InA_Event_HCTransferWaitUntil", [_callbackId, _args, _code, _timeout]] remoteExec ["AW_fnc_eventTrigger", _hc];

    waitUntil {
        sleep 1;

        ((AW_fnc_transferGroupHC_callbackIds get _callbackId) || (serverTime > _waituntil))
    };

    if !(AW_fnc_transferGroupHC_callbackIds get _callbackId) then {
        _delayTimeout = true;
    };

    (AW_fnc_transferGroupHC_callbackIds deleteAt _callbackId);
};

if (((units _group) select {alive _x}) isEqualTo []) exitWith {
    {
        deleteVehicle _x;
    } forEach (units _group);

    deleteGroup _group;
};


{
    private _unit = _x;
    private _loadout = (getUnitLoadout _x);
    private _unitAttribs = createHashMap;

    {
        _unitAttribs insert [[_x, (_unit checkAIFeature _x)]];
    } forEach _abilities;

    _unitAttribs insert [["unitPos", (unitPos _unit)]];

    _unit setVariable ["Unit_Loadout", _loadout, true];
    _unit setVariable ["Unit_Attribs", _unitAttribs, true];

    // Add EH on the receiving end for the unit
    [_unit, ["Local", {
        params ["_unit", "_isLocal"];

        if (!_isLocal) exitWith {};

        [_unit] spawn {
            params ["_unit"];

            private _unitAttribs = _unit getVariable ["Unit_Attribs", nil];

            if (!isNil "_unitAttribs") then {
                {
                    if (_x == "unitPos") then {
                        if ((unitPos _unit) != _x) then {
                            _unit setUnitPos _y;
                        };

                        continue;
                    };

                    if ((_unit checkAIFeature _x) != _y) then {
                        if (_y) then {
                            _unit enableAI _x;
                        } else {
                            _unit disableAI _x;
                        };
                    };
                } forEach _unitAttribs;
            };

            if ((uniform _unit) == "") then {
                _unit setUnitLoadout (_unit getVariable ["Unit_Loadout", (typeOf _unit)]);
            };
        };
    }]] remoteExecCall ["addEventHandler", _hc];
} forEach (units _group);

_group setGroupOwner (owner _hc);
