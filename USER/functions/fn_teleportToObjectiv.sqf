if (isServer) exitWith {
	[{	
		//Teleport

		[
			[[], 0],
			[[], 0]
		] call grad_user_fnc_teleportPlayers;
	}, [], 6] call CBA_fnc_waitAndExecute;
};

/*
["", 0, false] call BIS_fnc_setPPeffectTemplate;
0 fadeMusic 0;
playMusic ["", 0];
[{3 fadeMusic 1;},[]] call CBA_fnc_execNextFrame;
*/
cutText ["", "BLACK OUT", 4];

[{
	//text

	titleText ["<t font='PuristaBold' size='3'>Einige Stunden Später ... </t>", "PLAIN", 1, true, true];
	[{
		cutText ["", "BLACK IN", 4];
	}, [], 6] call CBA_fnc_waitAndExecute;
}, [], 4] call CBA_fnc_waitAndExecute;
