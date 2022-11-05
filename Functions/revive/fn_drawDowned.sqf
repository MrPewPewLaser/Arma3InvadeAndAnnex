/*
* Author: alganthe
* Event handling the drawing of icons on downed units for medics or for everyone (depending on setting)
* DO NOT CALL THIS. This should only be called once on player init
*
* Arguments:
* Nothing
*
* Return Value:
* Nothing
*/

addMissionEventHandler ["Draw3D", {
    {
        private _pos = (getPosATLVisual _x);
        _pos set [2, 0.2];

        private _dist = (round (player distance _x));
        private _alpha = (1 - (_dist / 1000));

        drawIcon3D [
            "a3\ui_f\data\igui\cfg\revive\overlayiconsgroup\u100_ca.paa",
            [0.74, 0.06, 0.06, _alpha],
            (getPosATLVisual _x),
            _alpha,
            _alpha,
            0,
            "",
            2,
            0.04
        ];
    } forEach (
        (allPlayers - [player]) select {
            ((alive _x) && (_x getVariable ["derp_revive_downed", false])) && {
                ((_x getVariable ["derp_revive_side", west]) == (side player)) && {
                    ((_x distance player) < 1000)
                }
            }
        }
    );
}];
