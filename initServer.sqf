["Initialize"] call BIS_fnc_dynamicGroups;

["grad_changeWeather", {_this call grad_user_fnc_setTimeAndWeather;}] call CBA_fnc_addEventHandler;
["grad_hideObjectServer", {(_this select 0) hideObjectGlobal (_this select 1);}] call CBA_fnc_addEventHandler;


INDEPENDENT setFriend [EAST, 1];
EAST setFriend [INDEPENDENT, 1];



