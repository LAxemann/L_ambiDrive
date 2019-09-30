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
*   call L_ambiDrive_fnc_spawnManager
* =================================================*/

if ((time > L_ambiDrive_nextSpawn) && {L_ambiDrive_enabled}) then {
	private _currentCivs = count L_ambiDrive_civs;
	call L_ambiDrive_fnc_getPlayers;
	if ((_currentCivs < L_ambiDrive_maxCivs) && {(count L_ambiDrive_players) > 0}) then {
		// Pick a random player, get the distances and a random position around them, then check for roads
		private _originUnit 	= selectRandom L_ambiDrive_players;
		private _spawnDist 		= L_ambiDrive_minSpawnDistance;
		private _searchPos 		= [getPosATL _originUnit,_spawnDist + random ((L_ambiDrive_maxDistanceToPlayers - _spawnDist) / 1.2)] call L_ambiDrive_fnc_getRandomPos;
		private _road = [_searchPos] call L_ambiDrive_fnc_findRoad;
		
		// Check if road was found and if yes, if the position is suitable, if yes, spawn
		if !(isNull _road) then {
			_searchPos = getPosATL _road;
			if ([_searchPos,_spawnDist] call L_ambiDrive_fnc_positionSuitable) then {
				private _spawnDir = [_road] call L_ambiDrive_fnc_getRoadDir;
				private _civ = [_searchPos] call L_ambiDrive_fnc_spawnCiv;
				private _car = [_searchPos] call L_ambiDrive_fnc_spawnCar;
				[_searchPos] call L_ambiDrive_fnc_posCache;
				
				_car setDir _spawnDir;
				_civ moveinDriver _car;

				_civ allowDamage true;
				_civ limitSpeed 60;
				_car limitSpeed 60;
				
				_civ setVariable ["L_ambiDrive_civManagerArray",[time,time,(getPosATL _civ),(getPosATL _car),0,_car,0,[0,0,0]]];
				[L_ambiDrive_fnc_civManager, [_civ], 0.5] call CBA_fnc_waitAndExecute;

			};
		};
	};
	L_ambiDrive_nextSpawn = time + 1.5;
};
