/*
Author: chicken#6, AW-community member
bassed off of existing AW created side missions
Description: mission in which players have to find and heal a crashed helipilot before he dies.
Bleedouttimer starts running when player get's within 3.5km of the obj.
*/

private _crashSiteObj = [
    ["CraterLong_02_F",[1.15576,-7.68848,-0.0449615],168],
    ["Land_ShellCrater_01_F",[1.38672,-6.55591,-0.0449615],0],
    ["Land_ShellCrater_02_decal_F",[-1.59521,-2.81372,-0.0449615],0],
    ["Land_ShellCrater_02_decal_F",[4.89502,-3.06348,-0.0449615],90],
    ["Land_ShellCrater_02_decal_F",[4.62646,-9.80469,-0.0449615],180],
    ["Land_ShellCrater_02_decal_F",[-1.86328,-9.55493,-0.0449615],270],
    ["BloodSplatter_01_Large_New_F",[4.83447,-6.25269,-0.0449615],0]
];	

private _bleedOutTimer = 900; //time before the pilot dies
private _triggerRange = 3500; //if players get within this radius the bleedouttimer starts running

private _spawnedObjects = [];
private _rndDir = (random 360);

private _findSmPosResult = ["safePos",[nil, nil, 15, 0.2]] call AW_fnc_findSideMissionPos;
if (!(_findSmPosResult select 0)) exitWith {};
private _flatPos = _findSmPosResult select 1;

private _terrainObjs = (nearestTerrainObjects [_flatPos, [], 15, false, true]);
{
    _x hideObjectGlobal true;
} forEach _terrainObjs;

private _origin = createVehicle ["CraterLong_02_small_F", [0, 0, 0], [], 0, "NONE"];
_origin allowDamage false;
_origin enableSimulationGlobal false;
_origin setPos _flatPos;
_origin setDir _rndDir;
_origin setVectorUp surfaceNormal position _origin;
_spawnedObjects pushBack _origin;

{
    private _obj = [_origin, _x, _rndDir] call AW_fnc_spawnRelative;
    _obj allowDamage false;
    _obj enableSimulationGlobal false;
    _obj setVectorUp surfaceNormal position _obj;
    _spawnedObjects pushBack _obj;
} forEach _crashSiteObj;

private _jetTypes = ["I_Plane_Fighter_04_F","B_Plane_CAS_01_dynamicLoadout_F","B_Plane_Fighter_01_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F","I_Plane_Fighter_03_dynamicLoadout_F"];

private _JetObj = [_origin,[(selectRandom _jetTypes),[0.691895,-4.82202,-1.07721],170],_rndDir]call AW_fnc_spawnRelative;
_JetObj enableSimulationGlobal false;
_JetObj call AW_fnc_vehicleCustomization;
_JetObj lock 3;
_JetObj setDamage 0.5;
_JetObj setFuel 0;
_JetObj allowDamage false;
_JetObj setVectorUp surfaceNormal position _JetObj;
_JetObj setPos [getPos _JetObj select 0, getPos _JetObj select 1, (getPos _JetObj select 2) -1];
_spawnedObjects pushBack _JetObj;

private _pilot = [_origin,["C_man_pilot_F",[4.70313,-6.14087,-0.0435224],60],_rndDir] call AW_fnc_spawnRelative;
removeAllWeapons _pilot;
removeAllItems _pilot;
removeAllAssignedItems _pilot;
removeUniform _pilot;
removeVest _pilot;
removeBackpack _pilot;
removeHeadgear _pilot;
removeGoggles  _pilot;
[_pilot, "Acts_StaticDeath_12"] remoteExec ["switchMove", 0, _pilot];
_pilot setVectorUp surfaceNormal position _pilot;
_pilot forceAddUniform "U_O_R_Gorka_01_black_F";
_pilot addVest "V_TacVest_blk";
_pilot addBackpack "B_RadioBag_01_black_F";
_pilot addHeadgear "H_CrewHelmetHeli_B";
_pilot setDamage 0.5;
_pilot allowDamage false;

[_pilot,"Rescue pilot",
"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\help_ca.paa",
"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca.paa",
"_target distance _this <= 4","_target distance _this <= 4",
{hint "Performing First Aid ....";
private _unit = _this select 1;
if ( currentWeapon _unit != "" ) then
{	_unit action ["SwitchWeapon", _unit, _unit, 99]; };
_unit playMoveNow "AinvPknlMstpSnonWnonDnon_medic3";

},{},{
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _sidecompleted = format["<t align='center'><t size='2.2'>Side-mission update</t><br/>____________________<br/>%1 healed the pilot.  Good job everyone.</t>", (name _caller)];
    [_sidecompleted] remoteExec ["AW_fnc_globalHint",0];
    sleep 4;

    ["InA_Event_SideMissionSuccess"] remoteExecCall ["AW_fnc_eventTrigger", 2];
},
{hint "You stopped performing first aid";
private _unit = _this select 1;
_unit playMoveNow "";
},[],10, 0,true,false] remoteExecCall ["BIS_fnc_holdActionAdd", 0, true];

// Spawn enemy forces--------------------------------------
private _vehAmount = [
    nil,                    // MBTs
    (1 + (random 1)),       // SPAAs
    (1 + (random 1)),       // IFVs
    (selectRandom [0, 1])   // MRAPs
];

private _infAmount = [
    (2 + (random 1)),   // Squads
    nil,                // SF Squads
    1,                  // AA Teams
    1,                  // AT Teams
    (1 + (random 1)),   // Snipers
    nil,                // Teams
    (2 + (random 1))    // SF Teams
];

private _enemiesArray = [
    _flatPos,
    "SIDE",
    "#circ",
    _vehAmount,
    _infAmount,
    25,
    400
] call AW_fnc_spawnEnemyUnits;

// Briefing ------------------------------------------------
private _fuzzyPos = [_flatPos, (markerSize "sideCircle") # 0] call AW_fnc_getFuzzyPos;
{ _x setMarkerPos _fuzzyPos; } forEach ["sideMarker", "sideCircle"];
private _markerText = "Side Mission: Search and Rescue";
"sideMarker" setMarkerText _markerText;

[
    west,
    "rescueTaskJet",
    [
        "We received a distress call from a friendly jet pilot but the call was cut short. We believe the enemy has shot his jet down, your job is to find and rescue the pilot.  We have reasons to believe that the pilot survived. Be careful when approaching the search area we expect heavy AA.",
        _markerText,
        "sideCircle"
    ],
    (getMarkerPos "sideCircle"),
    "Created",
    0,
    true,
    "heal",
    true
] call BIS_fnc_taskCreate;

//mission core
InA_Server_SideMissionUp = true;
InA_Server_SideMissionSuccess = false;
InA_Server_SideMissionSpawned = true;

//First wait till there are enough players near
while {InA_Server_SideMissionUp} do {	

	private _numPlayersnear = 0;
    {	if ((_x distance _flatPos) < _triggerRange) then {
            _numPlayersnear = _numPlayersnear + 1;
			sleep 0.1;
        };
    } forEach allPlayers;

	if (_numPlayersnear > 0) exitWith{};
    if (!alive _pilot) exitWith{};
	sleep 10;
};
sleep 1;

while {InA_Server_SideMissionUp} do {
	if (InA_Server_SideMissionSuccess) exitWith {

		//-------------------- DE-BRIEFING
		[nil, _flatPos] call AW_fnc_SMhintSUCCESS;
        0 = ["rescueTaskJet"] spawn AW_fnc_finishTask;
		InA_Server_SideMissionUp = false;
	};
	
	if ((_bleedOutTimer <= 0) || (!alive _pilot) || !InA_Server_SideMissionUp) exitWith {
		//-------------------- DE-BRIEFING
        0 = ["rescueTaskJet", "Failed"] spawn AW_fnc_finishTask;
		InA_Server_SideMissionUp = false;
	};
	
	_bleedOutTimer = _bleedOutTimer -5;
    sleep 5;
};

_pilot call AW_fnc_delete;
sleep 5;

"sideMarker" setMarkerText "";
{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"];

//-------------------- DELETE
sleep 120;
[_spawnedObjects + _enemiesArray] spawn AW_fnc_delete;
{if (isObjectHidden _x) then {_x hideObjectGlobal false};} forEach _terrainObjs;
