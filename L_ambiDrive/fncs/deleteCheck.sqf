/*
*	Author: LAxemann
*
*	Desc: 
*   Manages the spawning of civilians and cars
*
*	Params:
*	None
*
*	Returns:
*	Nothing
*
*	Example: 
*   call L_ambiDrive_fnc_objectManager
* =================================================*/
private ["_maxDist"];
params [
	"_object"
];
private _delete = true;
private _maxDistReal = L_ambiDrive_maxDistanceToPlayers;
private _multiplierValue = (L_ambiDrive_elevationMultiplier - 1) max 0;

// Check if position is far enough away from players
{
	if (L_ambiDrive_increaseWithElevation) then {
		_maxDist = [eyePos _x,getPosASL _object,_maxDistReal,_multiplierValue] call L_ambiDrive_fnc_getElevationMultiplicatorValue;
	} else {
		_maxDist = _maxDistReal;
	};
	if ((_object distance2d _x) < _maxDist) exitWith {_delete = false;}
} count L_ambiDrive_players;

_delete;