/*
Author:	Quiksilver

Description:
	Anti-Air Battery.
	To make them more dangerous, they have buffed skill and unlimited ammo.
*/
private _basepos = getMarkerPos "BASE";

//-------------------- 1. FIND POSITION FOR OBJECTIVE
private _flatPos = [(getMarkerPos InA_Server_currentAO), 5000, 25, 0.2] call AW_fnc_findSafePos;

// Clear the area
private _terrainObjs = (nearestTerrainObjects [_flatPos, [], 40, false, true]);

{
    _x hideObjectGlobal true;
} forEach _terrainObjs;

//-------------------- 2. SPAWN OBJECTIVES & ammo truck(for ambiance and plausibiliy of unlimited ammo)
private _unitsArray = []; 			// for crew and h-barriers
private _PTdir = random 360;

//create the group and an officer to keep the group CSAT
private _priorityGroup = createGroup east;
_priorityGroup setGroupIdGlobal ["PRIO-AAA"];
_priorityGroup createUnit [(["#officers"] call AW_fnc_getUnitsFromHash), _flatPos, [], 0, "NONE"];

//create the actuall vehicles
priorityObjLaunchers = [];

{
    private _dir = (360/(count AW_OPFOR_mission_aa_launchersList)) * _foreachindex;
    private _veh = createVehicle [_x, (_flatpos getPos [12, _dir]), [], 0, "CAN_COLLIDE"];
    if (_x == "B_AAA_System_01_F" || _x == "B_SAM_System_02_F") then {
        [_veh,["Green",1],true] call BIS_fnc_initVehicle;
    };
    _veh setVehicleAmmo 0;
    _veh setFuel 0;
    _veh setDir (_PTdir + (random 5));
    sleep 0.1;
    createVehicleCrew _veh;
    (crew _veh) join _priorityGroup;
    sleep 0.1;
    _veh setVehicleRadar 1;
    _veh setVehicleReceiveRemoteTargets true;
    _veh setVehicleReportRemoteTargets true;
    _veh lock 3;
    _veh allowCrewInImmobile true;
    _veh doWatch _basepos;
    priorityObjLaunchers pushBack _veh;
} forEach AW_OPFOR_mission_aa_launchersList;

ammoTruck = createVehicle [AW_OPFOR_mission_aa_ammoVeh, (_flatpos getPos [32, random 360]), [], 0, "NONE"];
ammoTruck setDir _PTdir;
ammoTruck lock 3;

_unitsArray pushBack ammoTruck;

//delete that officer again
((units _priorityGroup) select 0) call AW_fnc_delete;

_priorityGroup setBehaviour "COMBAT";
_priorityGroup setCombatMode "RED";
_priorityGroup allowFleeing 0;

//add stuff to the right arrays and zeus
_unitsArray append (units _priorityGroup);

[_unitsArray] call AW_fnc_addToAllCurators;
sleep 0.1;

//-------------------- 4. SPAWN H-BARRIER RING
private _distance = 24;
private _dir = 0;
private _barriers = 12;
for "_c" from 1 to _barriers do
{
    private _pos = _flatpos getPos [_distance, _dir];
    private _barrier = AW_OPFOR_mission_aa_barrier createVehicle _pos;
    waitUntil {alive _barrier};
    _barrier setDir _dir;
    _dir = _dir + (360/_barriers);
    _barrier allowDamage false;
    _barrier setVectorUp surfaceNormal position _barrier;
    _unitsArray pushBack _barrier;
};
sleep 0.1;

//-------------------- 5. SPAWN FORCE PROTECTION
private _vehAmount = [
    nil,                // MBTs
    nil,                // SPAAs
    (1 + (random 1)),   // IFVs
    (1 + (random 1))    // MRAPs
];

private _infAmount = [
    (2 + (random 1)),   // Squads
    (1 + (random 1)),   // SF Squads
    1,                  // AA Teams
    1,                  // AT Teams
    nil,                // Snipers
    nil,                // Teams
    nil                 // SF Teams
];

private _enemiesArray = [
    _flatPos,
    "PRIO",
    "#rnd",
    _vehAmount,
    _infAmount,
    25,
    400
] call AW_fnc_spawnEnemyUnits;

_unitsArray append _enemiesArray;


sleep 0.1;

{
    //-------------------- reduce dammage
    _x setVariable ["selections", []];
    _x setVariable ["gethit", []];
    _x addEventHandler [ "HandleDamage", {
            params ["_unit","_selection","_inputDamage","","","",""];
            _selections = _unit getVariable ["selections", []];
            _gethit = _unit getVariable ["gethit", []];

            if !(_selection in _selections) then
            {
                _selections set [count _selections, _selection];
                _gethit set [count _gethit, 0];
            };
            _i = _selections find _selection;
            _olddamage = _gethit select _i;
            _damage = _olddamage + (_inputDamage - _olddamage) * 0.35;
            _gethit set [_i, _damage];
            _damage;
    }];

    // Add extra mag so vehicle can reload
    switch (typeOf _x) do {
        case "O_APC_Tracked_02_AA_F": {
            _x removeMagazinesTurret ["SmokeLauncherMag", [0,0]];
            _x removeWeaponTurret ["SmokeLauncher", [0,0]];

            _x addMagazineTurret ["680Rnd_35mm_AA_shells_Tracer_Green", [0]];
            _x addMagazineTurret ["680Rnd_35mm_AA_shells_Tracer_Green", [0]];
            _x addMagazineTurret ["680Rnd_35mm_AA_shells_Tracer_Green", [0]];

            _x addMagazineTurret ["4Rnd_Titan_long_missiles_O", [0]];
            _x addMagazineTurret ["4Rnd_Titan_long_missiles_O", [0]];
        };

        case "B_AAA_System_01_F": {
            _x addMagazineTurret ["magazine_Cannon_Phalanx_x1550", [0]];
            _x addMagazineTurret ["magazine_Cannon_Phalanx_x1550", [0]];
        };

        case "B_SAM_System_02_F": {
            _x addMagazineTurret ["magazine_Missile_rim162_x8", [0]];
            _x addMagazineTurret ["magazine_Missile_rim162_x8", [0]];
            _x addMagazineTurret ["magazine_Missile_rim162_x8", [0]];
        };

        case "vn_o_nva_65_static_zpu4": {
            _x addMagazineTurret ["vn_zpu4_v_4800_mag", [0]];
            _x addMagazineTurret ["vn_zpu4_v_4800_mag", [0]];
            _x addMagazineTurret ["vn_zpu4_v_4800_mag", [0]];
        };

        case "vn_sa2": {
            _x addMagazineTurret ["vn_sa2_mag_x4", [0]];
            _x addMagazineTurret ["vn_sa2_mag_x4", [0]];
            _x addMagazineTurret ["vn_sa2_mag_x4", [0]];
        };
    };

    _x addEventHandler ["Reloaded", {
        params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];

        if (alive ammoTruck) then {
            _unit setVehicleAmmo 1;
        };
    }];
} forEach priorityObjLaunchers;

//-------------------- 7. BRIEFING
private _fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];
{ _x setMarkerPos _fuzzyPos; } forEach ["priorityMarker", "priorityCircle"];

"priorityMarker" setMarkerText "Priority Target: Anti-Air Battery";

[
    west,
    "prioAATask",
    [
        "OPFOR forces are setting up an Anti-Air battery to hit you guys damned hard! We've picked up their positions with thermal imaging scans and have marked it on your map. This is a priority target, boys! They're just setting up now.  Previous sites looked like this: <br/><br/><img image='Media\Briefing\prioAA.jpg' width='300' height='150'/>",
        "Priority Target: Anti-Air",
        "priorityCircle"
    ],
    (getMarkerPos "priorityCircle"),
    "Created",
    0,
    true,
    "attack",
    true
] call BIS_fnc_taskCreate;

InA_Server_PrioMissionSpawned = true;
InA_Server_PrioMissionUp = true;


//-------------------- 8. CORE LOOP
//set some stuff
private _shooterList = +priorityObjLaunchers;
private _disabledShooters = 0;

sleep 30; //so pilots have a chance to get to safety

while {InA_Server_PrioMissionUp} do {
    sleep 6;

	//check if we can still fire
	{
		if (canFire _x) then {
			_x doWatch _basepos;
            _x setVehicleAmmo 1;
		} else {
			_shooterList = _shooterList - [_x];
			_disabledShooters = _disabledShooters + 1;
		};
	} forEach _shooterList;

    if (_disabledShooters >= AW_OPFOR_mission_aa_shooters) then {break};

	//start selecting targets
	_targetList = _flatPos nearEntities [["Air"],4000];

	//if there are no air contacts proceed please
	if ((count _targetList) < 1) then { continue; };

    //select all blufor units
    private _targetListEnemy = [];
    {
        if ((side _x) == west) then {
            _targetListEnemy pushBack _x;
        };
    } forEach _targetList;

    if ((count _targetListEnemy) < 1) then { continue; };

    //I know where you are, now the AI does too
    {_priorityGroup reveal [_x,4];} forEach _targetListEnemy;

    private _targetSelect = selectRandom _targetListEnemy;
    {
        if (!canFire _x) then { continue; };

        _x doWatch _targetSelect;
        _x doTarget _targetSelect;
        _x doFire _targetSelect;
    } forEach _shooterList;
};

if (!InA_Server_PrioMissionUp) then {
    {
        _x setDamage 1;
    } forEach _shooterList;
};

//-------------------- 9. DE-BRIEF
0 = ["prioAATask"] spawn AW_fnc_finishTask;

"priorityMarker" setMarkerText "";
{_x setMarkerPos [-10000,-10000,-10000];} forEach ["priorityMarker","priorityCircle"];

//-------------------- 10. DELETE
sleep 120;
_toDelete = _unitsArray  + priorityObjLaunchers;
{ _x call AW_fnc_delete } forEach _toDelete;

{
    if (isObjectHidden _x) then {_x hideObjectGlobal false};
} forEach _terrainObjs;
