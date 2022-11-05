/*
author: stanhope

description: executes the function that controlls the AA

this addAction ['<t color=""#ff1111"">Activate Base Air-Defense</t>',{['base'] execVM 'scripts\misc\ActivateBaseAA.sqf'},[],21,true,true,'','((vehicle player) == player)',5];
this addAction ['<t color=""#ff1111"">Activate Carrier Air-Defense</t>',{['carrier'] execVM 'scripts\misc\ActivateBaseAA.sqf'},[],21,true,true,'','((vehicle player) == player)',5];
*/
params ["_type"];

switch (_type) do {
    case "base": {
        [player] remoteExec ["AW_fnc_mainBaseAA", 2];
    };
    case "carrier": {
        [player] remoteExec ["AW_fnc_cvnCIWS", 2];
    };
    default {
        hint "Something went wrong while activating base AA, please inform staff of this.";
    };
};
