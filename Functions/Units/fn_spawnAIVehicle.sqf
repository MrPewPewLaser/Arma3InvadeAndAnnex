/*
    author: stanhope
    description: spawns an AI vehicle with crew
    returns: vehicle
*/

params [
    "_pos",
    "_vehType",
    ["_side", east]
];

private _veh = createVehicle [_vehType, _pos, [], 0, "NONE"];

_veh call AW_fnc_vehicleCustomizationOpfor;

private _grp = createGroup _side;
private _tmpGrp = createVehicleCrew _veh;
(units _tmpGrp) join _grp;

_veh lock 2;
_veh allowCrewInImmobile [true, true];

_veh
