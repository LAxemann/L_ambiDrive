/*
*	Author: LAxemann
*
*	Desc: Caches last 3 spawned positions
*
*	Params:
*	0 - Position
*
*	Example:
*	[_searchPos] call L_ambiDrive_fnc_posCache;
*/

params [
	"_pos"
];

if ((count L_ambiDrive_posCache) > 7) then {
	L_ambiDrive_posCache deleteAt 0;
	L_ambiDrive_posCache pushBack _pos;
};