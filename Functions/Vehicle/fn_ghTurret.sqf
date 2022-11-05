params ["_heli"];

if (isNil "_heli" || {!(_heli isKindOf "Heli_Transport_01_base_F" )}) exitWith {};

private _turretData = [
    ["LMG_Minigun_Transport", [1]],
    ["LMG_Minigun_Transport2", [2]]
];

private _turretStatus = (_heli getVariable ["InA_turretsEnabled", true]);

if (_turretStatus) then {
    {
        _x params ["_weapon", "_turret"];

        private _owner = (_heli turretOwner _turret);

        [_heli, [_weapon, _turret]] remoteExecCall ["removeWeaponTurret", _owner];
    } forEach _turretData;

    _heli setVariable ["InA_turretsEnabled", false, true];
} else {
    {
        _x params ["_weapon", "_turret"];

        private _owner = (_heli turretOwner _turret);

        [_heli, [_weapon, _turret]] remoteExecCall ["addWeaponTurret", _owner];
    } forEach _turretData;

    _heli setVariable ["InA_turretsEnabled", true, true];
};
