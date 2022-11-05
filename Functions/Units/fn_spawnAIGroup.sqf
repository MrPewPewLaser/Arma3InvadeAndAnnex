/*
    file: fn_spawnAIGroup.sqf
    Spawns an AI group in a given position

    params:
        unitTypes   - array     - an array of unit types to spawn
        position    - array     - the position to spawn the group

    returns:
    group - the group that was created
*/

params [
    "_unitTypes",
    "_pos",
    ["_useSleep", true, [true]],
    ["_side", east]
];

private _grp = createGroup _side;

{
    private _unit = _grp createUnit [_x, _pos, [], 4, "NONE"];

    if (_useSleep) then {
        sleep 0.1;
    };
} forEach _unitTypes;

_grp
