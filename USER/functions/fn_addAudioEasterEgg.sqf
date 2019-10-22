params ["_obj"];

private _action1 = [
    "audiEasterEgg",
    "Play Audio",
    "",
    {
		_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		_soundToPlay = _soundPath + "data\easterEgg.ogg";
		playSound3D [_soundToPlay, _target, false, ((getPos _target) vectorAdd [0,0,1]), 5, 1, 150]; 
		//Volume db+10, volume drops off to 0 at 50 meters from _sourceObject
        
    },
    {true},
    {},
    [],
    {[0,0,2]}
] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions"], _action1] call ace_interact_menu_fnc_addActionToObject;