/*
*	Author: LAxemann
*
*	Desc: 
*   Spawns a car
*
*	Params:
*	0 - Position where to spawn
*
*	Returns:
*	Object - Car, empty vehicle
*
*	Example: 
*   [_spawnPos] call L_ambiDrive_fnc_getRoadDir
* =================================================*/
params [
	"_spawnPos"
];

private _type 		= L_ambiDrive_carClasses call BIS_fnc_selectRandom;
private _car 		= _type createVehicle _spawnPos;
_car allowCrewInImmobile true;

_car;