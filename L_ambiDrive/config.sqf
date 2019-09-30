/* General config */
L_ambiDrive_maxCivs                 = 25;		// Maximum number of civilian vehicles driving around at any time
L_ambiDrive_minSpawnDistance 		= 1000;		// Minimum distance to players when spawning vehicles
L_ambiDrive_maxDistanceToPlayers    = 2200;		// Maximum distance to players, both for spawning and deleting vehicles


/* Speed limits */
L_ambiDrive_speedLimitCity = 40;				// Speed limit (in km/h) within cities
L_ambiDrive_speedLimit 	   = 90;				// Speed limit (in km/h) outside of cities


L_ambiDrive_increaseWithElevation 	= true;		// Increase the spawn and delete range if players are elevated (so they can look "into" the city)
	L_ambiDrive_elevationMultiplier	     = 3;		// Maximum factor the distance will be multiplied with
	L_ambiDrive_maxElevationDifference   = 2000;	// At which height the maximum multiplier will be applied

	
/* Enabled from the start? True = Yes, False = No */
L_ambiDrive_enabled = true;