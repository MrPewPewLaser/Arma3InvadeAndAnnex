/*
* Author: alganthe
* Handles UI elements such as medic icons on medics and PP effects
*
* Arguments:
*
* Return Value:
* Nothing
*/

derp_revive_drawMedicIconsEhIdx = addMissionEventHandler ["Draw3D", {
    {
        private _pos = (getPosATLVisual _x);
        _pos set [2, 1.3];

        private _dist = (round (player distance _x));
        private _alpha = (1 - (_dist / 1000));

        drawIcon3D [
            "\A3\ui_f\data\igui\cfg\actions\heal_ca.paa",
            [0.1, 0.47, 0.83, _alpha],
            _pos,
            _alpha,
            _alpha,
            0,
            (format ["%1 meters away", _dist]),
            2,
            0.04
        ];
    } foreach (
        (allPlayers - [player]) select {
            ((alive _x) && !(_x getVariable ["derp_revive_downed", false])) && {
                (_x getUnitTrait "Medic") && {
                    ((_x distance player) < 1000)
                }
            }
        }
    );
}];

if (isNil "derp_revive_ppColor") then {
    derp_revive_ppColor = ppEffectCreate ["ColorCorrections", 1632]
};
if (isNil "derp_revive_ppVig") then {
    derp_revive_ppVig = ppEffectCreate ["ColorCorrections", 1633]
};
if (isNil "derp_revive_ppBlur") then {
    derp_revive_ppBlur = ppEffectCreate ["DynamicBlur", 525]
};

// Start effects
derp_revive_ppColor ppEffectAdjust [1,1,0.15,[0.3,0.3,0.3,0],[0.3,0.3,0.3,0.3],[1,1,1,1]];
derp_revive_ppVig ppEffectAdjust [1,1,0,[0.15,0,0,1],[1.0,0.5,0.5,1],[0.587,0.199,0.114,0],[1,1,0,0,0,0.2,1]];
derp_revive_ppBlur ppEffectAdjust [0];

{
    _x ppEffectCommit 0; _x ppEffectEnable true; _x ppEffectForceInNVG true
} forEach [derp_revive_ppColor, derp_revive_ppVig, derp_revive_ppBlur];

// PFH for the progression of the revive effects
[{
    params ["_args", "_pfhID"];
    _args params ["_timer"];

    //grab blood level
    if (player getVariable ["derp_revive_downed", false] && {alive player}) then {
        private _blood = ((1 / (_timer + 1)) max (_timer - derp_revive_bleedOutTimer) / _timer);

        //calculate desaturation
        private _bright = 0.2 + (0.1 * _blood);
        derp_revive_ppColor ppEffectAdjust [1,1, 0.15 / _blood,[0.3,0.3,0.3,0],[_bright,_bright,_bright,_bright],[1,1,1,1]];

        //calculate intensity of vignette
        private _intense = 0.6 + (0.4 * _blood);
        derp_revive_ppVig ppEffectAdjust [1,1,0,[0.15,0,0,1],[1.0,0.5,0.5,1],[0.587,0.199,0.114,0],[_intense,_intense,0,0,0,0.2,1]];

        //calculate intensity of blur
        private _blur = 0.7 * (1 - _blood);
        derp_revive_ppBlur ppEffectAdjust [_blur];

        //smoothly transition
        {_x ppEffectCommit 1} forEach [derp_revive_ppColor, derp_revive_ppVig, derp_revive_ppBlur];
    } else {
        _pfhID call derp_fnc_removePerFrameHandler;
    };
}, 1, [(getMissionConfigValue ["derp_revive_bleedOutTimer", 300])]] call derp_fnc_addPerFrameHandler;

showHUD [true, false, false, false, false, false, false, false, false, false, true];
