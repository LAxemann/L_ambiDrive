/*
*	Author: LAxemann
*
*	Desc: Checks if a position is suitable for spawning
*
*	Params:
*	0 - Position to check
*	1 - [Optional] minimum distance
*
*	Example:
*/

params [
	"_searchPos",
	["_minDist", 0]
];

private _minDistReal = _minDist;
private _suitable 	= true;
private _multiplierValue = (L_ambiDrive_elevationMultiplier - 1) max 0;

// Check if position lies within blacklist

{
	if (_searchPos inArea _x) exitWith {_suitable = false};
} count L_ambiDrive_blackList;


// Check if not too close to recent location
if (_suitable) then {
	{
		if ((_searchPos distance _x) < 50) exitWith {_suitable = false};
	} count L_ambiDrive_posCache;
};


// Check if position is too close to players
if (_suitable) then {
	{	
		if (L_ambiDrive_increaseWithElevation) then {
			_minDist = [eyePos _x,ATLtoASL _searchPos,_minDistReal,_multiplierValue] call L_ambiDrive_fnc_getElevationMultiplicatorValue;
		} else {
			_minDist = _minDistReal;
		};
		if ((_searchPos distance2d _x) < _minDist) exitWith {_suitable = false};
	} count L_ambiDrive_players;
};

_suitable;

