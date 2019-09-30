/*
*	Author: LAxemann
*
*	Desc: 
*   gets the direction of one road tile to a connected one
*
*	Params:
*	0 - Road segment
*
*	Returns:
*	Direction to next road segment
*
*	Example: 
*   [_road] call L_ambiDrive_fnc_getRoadDir
* =================================================*/
params [
	"_road"
];

private _connectedRoads = roadsConnectedTo _road;
_connectedRoads params ["_nextRoad"];
private _dir = _road getDir _nextRoad;
_dir;