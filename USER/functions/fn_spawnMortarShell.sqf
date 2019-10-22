params ["_obj"];
private _pos = getPos _obj;
_pos set [2, 500];

//Create our projectile
private _projectile = "Sh_82mm_AMOS" createVehicle [0,0,100];
_projectile setPosATL _pos;
_projectile setVelocity [0,0,-100];

[
	{
		(((getPosATL (_this select 0)) select 2) < 30)
	},
	{
		params ["_projectile", "_obj"];
		private _pos = getPos _projectile;
		private _detonator = "SLAMDirectionalMine_Wire_Ammo" createVehicle [0,0,0];
		_detonator setPos _pos;
		_detonator setDamage 1;
		deleteVehicle _projectile;

		[_obj] call grad_user_fnc_gasEffect;

		//[{[_this] call grad_user_fnc_gasEffect;}, _obj, 0.2] call CBA_fnc_waitAndExecute; 
	},
	[_projectile, _obj]
] call CBA_fnc_waitUntilAndExecute;


