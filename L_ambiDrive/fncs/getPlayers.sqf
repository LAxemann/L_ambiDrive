/*
*	Author: LAxemann
*
*	Desc: Sets the array of players without blacklisted players
*
*	Params: None
*
*	Returns:
*	Array, Array of players minus blacklisted ones
*
*	Example:
*/
if ((count L_ambiDrive_blacklist_players) > 0) then {
	L_ambiDrive_players = allPlayers select {
		!(_x in L_ambiDrive_blacklist_players)
	};
} else {
	L_ambiDrive_players = allPlayers;
};