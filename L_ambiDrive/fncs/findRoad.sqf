/*
*	Author: LAxemann
*
*	Desc: Finds the nearest road around a given position
*
*	Params:
*	0 - Position to find the nearest road from
*
*	Returns:
*	Object - The nearest road segment
*
*	Example:
*/

params [
	"_searchPos"
];
private _tempArray  = [];
private _road 		= objNull;
private _roadList = {
	_tempArray = _searchPos nearRoads _x;
	if ((count _tempArray) > 0) exitWith {
		_tempArray
	};
} forEach [100,500,1000,2000];

if ((count _roadList) > 0) then {
	_road = _roadList select 0; // For testing, switch to params later!
};

_road;