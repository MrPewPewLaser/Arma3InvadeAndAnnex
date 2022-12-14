/*
* Author: alganthe
* Handles the animChanged revive event in MP
*
* Arguments:
* 0: Unit to add the EH to <OBJECT>
* 1: Mode to run in <BOOL> (true to add, false to remove)
*
* Return Value:
* Nothing
*/
params ["_unit", "_mode"];

if (_mode) then {
    derp_revive_animChangedEhIdx = _unit addEventHandler ["AnimChanged", {
        params ["_unit", "_anim"];

        if (_unit getVariable ["derp_revive_downed", false] && {isNull objectParent _unit} && {!(_unit getVariable ["derp_revive_isDragged",false]) || {!(_unit getVariable ["derp_revive_isCarried", false])}} && {animationState _unit != "AinjPfalMstpSnonWrflDf_carried_fallwc"}) then {
            [_unit, "acts_injuredlyingrifle02_180"] remoteExec ["switchMove", 0];
        };
    }];
} else {
    if (!isNil "derp_revive_animChangedEhIdx") then {
        _unit removeEventHandler ["AnimChanged", derp_revive_animChangedEhIdx];
        derp_revive_animChangedEhIdx = nil;
    };
};
