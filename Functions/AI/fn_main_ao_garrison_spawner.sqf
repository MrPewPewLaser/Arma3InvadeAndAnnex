params [
    "_AO",
    "_radiusSize",
    ["_factionHash", InA_EnemyFactionHash]
];

private _grpList = [];
private _units = [];

private _buildingBlacklist = [
    "Land_Pier_small_F",
    "Land_Pier_F",
    "Land_Pier_wall_F",
    "Land_Pier_addon",
    "Land_nav_pier_m_F",
    "Land_Bridge_Asphalt_PathLod_F",
    "Land_Bridge_Concrete_PathLod_F",
    "Land_Bridge_HighWay_PathLod_F",
    "Land_Chapel_V1_F",
    "Land_Chapel_V2_F",
    "Land_Chapel_Small_V1_F",
    "Land_Chapel_Small_V2_F",
    "Land_vn_o_prop_cong_cage_01",
    "Land_vn_o_prop_cong_cage_03",
    "Land_Addon_01_V1_ruins_F",
    "Land_House_Big_01_V1_ruins_F",
    "Land_Slum_House01_F",
    "Land_Slum_House02_F",
    "Land_Slum_House03_F",
    "Land_cargo_house_slum_F",
    "Land_Metal_Shed_F",
    "Land_d_Stone_HouseBig_V1_F",
    "Land_Stone_Shed_V1_ruins_F",
    "Land_d_Stone_Shed_V1_F",
    "Land_Addon_02_V1_ruins_F",
    "Land_d_Stone_HouseSmall_V1_F",
    "Land_d_House_Small_01_V1_F",
    "Land_House_Small_01_V1_ruins_F",
    "Land_d_House_Small_02_V1_F",
    "Land_Unfinished_Building_01_ruins_F",
    "Land_i_Garage_V1_dam_F",
    "Land_Stone_HouseBig_V1_ruins_F",
    "Land_i_Addon_04_V1_F",
    "Land_House_Small_02_V1_ruins_F",
    "Land_House_Big_02_V1_ruins_F",
    "Land_u_Shed_Ind_F",
    "Land_Unfinished_Building_02_ruins_F",
    "Land_Stone_HouseSmall_V1_ruins_F",
    "Land_u_Addon_01_V1_F",
    "Land_i_Addon_03_V1_F",
    "Land_d_Addon_02_V1_F",
    "Land_d_House_Big_01_V1_F",
    "Land_u_House_Big_02_V1_F",
    "Land_d_House_Big_02_V1_F",
    "Land_Shop_02_V1_ruins_F",
    "Land_Shop_01_V1_ruins_F",
    "Land_d_Shop_02_V1_F",
    "Land_d_Shop_01_V1_F",
    "Land_i_Addon_03mid_V1_F",
    "Land_i_Garage_V2_dam_F",
    "Land_u_Barracks_V2_F",
    "Land_Addon_01_ruins_F",
    "Land_Addon_01_V1_ruins_F",
    "Land_Addon_02_ruins_F",
    "Land_Addon_02_V1_ruins_F",
    "Land_Addon_02_b_white_ruins_F",
    "Land_Addon_03_ruins_F",
    "Land_Addon_03_V1_ruins_F",
    "Land_Addon_03mid_V1_ruins_F",
    "Land_Addon_04_ruins_F",
    "Land_Addon_04_V1_ruins_F",
    "Land_Addon_05_ruins_F",
    "Land_LightHouse_F",
    "Land_LightHouse_ruins_F",
    "Land_Lighthouse_small_F",
    "Land_Lighthouse_small_ruins_F"
];

private _unitTypes = [
    "#riflemen", "#machinegunners", "#marksmen",
    "#engineers", "#medics", "#teamleaders",
    "#heavygunners", "#sharpshooters", "#lats"
];

private _AOType = (missionConfigFile >> worldName >> "AOs" >> _AO >> "type") call BIS_fnc_getCfgData;
private _fortObjs = [];

private _factions = (_factionHash get "#guer_factions");

if (_AOType == "Military") then {
    _factions = [(_factionHash get "#name")];
};
if (InA_Server_PlayerCount < 10) then {
    _radiusSize = _radiusSize min (InA_Server_MainAOSize * 0.2);
};

private _uncleanedBuildings = nearestObjects [(getMarkerPos _AO), ["house", "building"], _radiusSize * 0.5];
private _buildings = (_uncleanedBuildings select {!((typeOf _x) in _buildingBlacklist) && {(_x buildingPos -1) isNotEqualTo []}});
private _buildingCount = (count _buildings);
private _garrisonedBuildings = [];

if (_buildingCount == 0) exitWith {};

if (_buildingCount > 15) then {
    _buildingCount = 15;
};

if (InA_Server_PlayerCount < 10) then {
    _buildingCount = 10;
};

private _maxUnits = 40;
private _unitCount = 0;

for "_i" from 1 to _buildingCount do {
    if (_unitCount >= _maxUnits) then {
        break;
    };

    private _infBuilding = selectRandom _buildings;
    _buildings = _buildings - [_infBuilding];

    // Only on Altis for now ....
    if (worldName == "Altis") then {
        private _fortifications = (_infBuilding call AW_fnc_fortifyBuilding);
        _fortObjs append _fortifications;
        _garrisonedBuildings pushBack _infBuilding;
    };

    private _infbuildingpos = (_infBuilding buildingPos -1);
    _infbuildingpos = _infbuildingpos call BIS_fnc_arrayShuffle;

    private _faction = (selectRandom _factions);
    private _enemyFactionHash = (InA_FactionMappings get _faction);

    private _side = (_enemyFactionHash get "#side");
    private _garrisongroup = createGroup _side;

    {
        private _unitType = ([(selectRandom _unitTypes), _enemyFactionHash] call AW_fnc_getUnitsFromHash);
        private _unit = _garrisongroup createUnit [_unitType, _x, [], 0, "CAN_COLLIDE"];

        _unit disableAI "PATH";
        _unit setUnitPos "UP";
        _units pushBack _unit;

        _unitCount = _unitCount + 1;

        sleep 0.1;

        if (_forEachIndex >= 8) then {break};
        if (_unitCount >= _maxUnits) then {break};
        if ((count (units _garrisongroup)) >= (ceil ((count _infbuildingpos) * 0.5))) then {break};
    } forEach _infbuildingpos;

    _grpList pushBack _garrisongroup;

    _garrisongroup setCombatMode "YELLOW";
    _garrisongroup setBehaviourStrong  "AWARE";

    _garrisongroup setGroupIdGlobal [format ["AO-Inf-Garrison%1", _i]];
    [_garrisongroup] call AW_fnc_transferGroupHC;

    sleep 0.1;
};

[_grpList] call derp_fnc_AISkill;
[_units] call AW_fnc_addToAllCurators;

{
    InA_Server_mainAOUnits append _x;
} forEach [_units, _fortObjs];

// Set garrisoned building to invulnerable for the duration of the AO
if (_garrisonedBuildings isNotEqualTo []) then {
    0 = [_garrisonedBuildings] spawn {
        params ["_buildings"];

        {
            [_x, false] remoteExec ["allowDamage", 0, true];
        } forEach _buildings;

        waitUntil {
            sleep 5;
            InA_Server_MainAO_Completed
        };

        {
            [_x, true] remoteExec ["allowDamage", 0, true];
        } forEach _buildings;
    };
};
