//--/ L_ambiDrive by LAxemann /--//
A lightweight script suite that allows multiplayer-compatible civil traffic.
Civilians will drive around on the map and de-spawn again of the closest player exceeds a specified distance.
Features blacklisting areas and players.
The script runs COMPLETELY SERVER-SIDE.


/* Quick Start */
1.   Drop the "L_ambiDrive" folder as well as the "initServer.sqf" into your mission folder. That's it.
1.1  If you already got an initServer.sqf, paste the following anywhere into the file:
     #include "L_ambiDrive\init.sqf"

	 
/* Quick configuration */
1. Navigate into the L_ambiDrive folder within your mission folder. You may want to look into three files: "config.sqf","classes.sqf" and "blacklists.sqf"
2. Config.sqf: Basic settings like spawn distance and speed limits. (Tip: Lower the city speed limit if the map features sharp turns within cities)
3. Classes.sqf: Vehicle and civilian classes that will be spawned.
4. Blacklist.sqf: Blacklisting areas vehicles shouldn't spawn in and players that should be ignored by the script.
!! All parameters can be changed on the fly during a mission !!


/* Known issues */
- ArmA will be ArmA. Vehicles might crash into each other and/or the terrain. The script detects stuck vehicles but can only do so much to un-stuck them.


/* License */
You are free to modify the script to your liking within your mission, but please mention the modification.
Uploading a modification of the script as a "standalone" version is not permitted.