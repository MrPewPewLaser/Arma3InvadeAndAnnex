/*
 * Author: Whigital
 * Description:
 * Generates array of objects/units for curator addition
 *
 */

if (!isServer) exitWith {};

private _quarterMasters = (getArray (missionConfigFile >> worldName >> "arsenalObjects"));
private _stevies = [];

{
    private _stevie = (missionNamespace getVariable [_x, objNull]);

    if (!isNull _stevie) then {
        _stevies pushBack _stevie;
    };
} forEach _quarterMasters;

private _objs = (
    (
        (entities "AllVehicles") +
        (InA_Server_RespawnVehiclesArray apply {_x # 0})
    ) - (
        (entities "Animal") +
        (entities "Logic") +
        (entities "HeadlessClient_F") +
        _stevies +
        [CVN_CIWS_1, CVN_CIWS_2, CVN_CIWS_3, CVN_RAM, CVN_SAM_2, CVN_SAM_3, Base_AA]
    )
);

_objs
