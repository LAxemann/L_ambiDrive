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
*   call L_ambiDrive_fnc_civManager
* =================================================*/
params [
	"_civ"
];
private _varArray = _civ getVariable ["L_ambiDrive_civManagerArray",[]];
_varArray params [
	"_lastCheck",
	"_spawnTime",
	"_spawnPos",
	"_lastPosCar",
	"_lastUnstuckTry",
	"_car",
	"_status",
	"_goalPos"
];

private _delay = 2.5;
private _timeSinceSpawn = time - _spawnTime;

// Check if object(s) should be deleted
if ((time - _lastCheck) >= 5) then {
	if (alive _civ) then {
		// If criteria met, delete, otherwise set time for next check
		if ( ([_civ] call L_ambiDrive_fnc_deleteCheck) OR ((_timeSinceSpawn >= 5) && ((_civ distance _spawnPos) < 5)) ) then {
			private _deleteArray = [[_civ], [_civ, _car]] select ((_civ distance _car) <= 200);
			private _grp = group _civ;
			private _index = L_ambiDrive_civs find _civ;
			L_ambiDrive_civs deleteAt _index;
			_deleteArray apply {
				deleteVehicle _x;
			};
			deleteGroup _grp;
		};
	} else {
		if ([_car] call L_ambiDrive_fnc_deleteCheck) then {
			deleteVehicle _car;
		};		
	};
	_lastCheck = time;
};


if (alive _civ || alive _car) then {
	/* Check if the civilian is alive and if so, check if it needs a waypoint (0) or is moving (1) */
	if (alive _civ) then {
		// Status 0 = Searching, Status 1 = moving to goal
		if ((_status == 0) || ((_civ distance _goalPos) < 150)) then {
			private _searchPos = [getPosATL _civ, 700 + (random 500)] call L_ambiDrive_fnc_getRandomPos;
			private _road = [_searchPos] call L_ambiDrive_fnc_findRoad;
			if !(isNull _road) then {
				_goalPos = getPosATL _road;
				_civ doMove _goalPos;
				_status = 1;
			};
		} else {
			_civ doMove _goalPos;
			_delay = 4;
		};
	} else {
		_delay = 15;
	};
	
	/* Check if both, the car and civ, are alive */
	if (alive _civ && {alive _car}) then {
		/* Speed limit in cities */
		private _speedLimit = L_ambiDrive_speedLimit;
		if (((getPos _car) getEnvSoundController "houses") >= 0.7) then {
			_speedLimit = L_ambiDrive_speedLimitCity;
		};
		_car limitSpeed _speedLimit;
		_civ limitSpeed _speedLimit;
		
		/* Check if car got stuck and set status back to "assign new WP" */
		if (((_civ distance _lastPosCar) <= 2.5) && {_timeSinceSpawn >= 10} && {(time - _lastUnstuckTry) >= 10} && {_civ in _car}) then {
			_status = 0;
			// player setpos (_lastPosCar); // Debugging
			_delay = 1;
			_lastUnstuckTry = time;
		};
	};
	
	if (alive _car) then {
		_lastPosCar = getPos _car;
	};
	
	_civ setVariable ["L_ambiDrive_civManagerArray",[_lastCheck,_spawnTime,_spawnPos,_lastPosCar,_lastUnstuckTry,_car,_status,_goalPos]];
	[L_ambiDrive_fnc_civManager, [_civ], _delay] call CBA_fnc_waitAndExecute;
};





