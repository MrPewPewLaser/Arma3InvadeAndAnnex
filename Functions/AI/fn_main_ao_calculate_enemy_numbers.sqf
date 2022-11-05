/*
file fn_main_ao_calculate_enemy_numbers.sqf
author: stanhope

Calculates how many enemies should be spawned in the main AO

*/
private _playerCount = InA_Server_PlayerCount;

private ["_MBTs","_AAVics","_IFVs","_Cars","_mainInf","_AAinf","_ATinf","_recon","_helis","_jet", "_boats", "_fortifications"];

switch true do {
	case (_playerCount <= 10):{
		_MBTs = 1;
		_AAVics = 0;
		_IFVs = 1;
		_Cars = 2;
		_mainInf = 3;
		_AAinf = 0;
		_ATinf = 2;
		_recon = 1;
		_helis = 0;
		_jet = 0;
		_boats = 0;
		_fortifications = 1;
	};
	case (_playerCount > 10 && _playerCount <= 20):{
		_MBTs = 1;
		_AAVics = (1 + round (random 1));
		_IFVs = (1 + round (random 1));
		_Cars = (1 + round (random 1));
		_mainInf = 5;
		_AAinf = 1;
		_ATinf = 1;
		_recon = 2;
		_helis = 1;
		_jet = 0;
		_boats = 1;
        _fortifications = 2;
	};
	case (_playerCount > 20 && _playerCount <= 30):{
		_MBTs = 1;
		_AAVics = (1 + round (random 1));
		_IFVs = (1 + round (random 1));
		_Cars = (1 + round (random 2));
		_mainInf = 5;
		_AAinf = 2;
		_ATinf = 2;
		_recon = 1;
		_helis = 1;
		_jet = 0;
		_boats = (1 + round (random 1));
        _fortifications = 3;
	};
	case (_playerCount > 30 && _playerCount <= 40):{
		_MBTs = 1;
		_AAVics = 2;
		_IFVs = 2;
		_Cars = 3;
		_mainInf = 6;
		_AAinf = 2;
		_ATinf = 2;
		_recon = 2;
		_helis = selectRandom[1,2];
		_jet = 1;
		_boats = (1 + round (random 2));
        _fortifications = 4;
	};
	case (_playerCount > 40 && _playerCount <= 50):{
		_MBTs = 1;
		_AAVics = (2 + round (random 1));
		_IFVs = (2 + round (random 1));
		_Cars = (3 + round (random 1));
		_mainInf = 7;
		_AAinf = 2;
		_ATinf = 2;
		_recon = 3;
		_helis = 2;
		_jet = 1;
		_boats = (2 + round (random 2));
        _fortifications = 5;
	};
	case (_playerCount > 50):{
		_MBTs = 2;
		_AAVics = (2 + round (random 2));
		_IFVs = (2 + round (random 2));
		_Cars = (3 + round (random 2));
		_mainInf = 8;
		_AAinf = 3;
		_ATinf = 3;
		_recon = 4;
		_helis = 2;
		_jet = 2;
		_boats = 4;
        _fortifications = 6;
	};
};

private _returnArray = [_MBTs,_AAVics,_IFVs,_Cars,_mainInf,_AAinf,_ATinf,_recon,_helis,_jet,_boats,_fortifications];

_returnArray
