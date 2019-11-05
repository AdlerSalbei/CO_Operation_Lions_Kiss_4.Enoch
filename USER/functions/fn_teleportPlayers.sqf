params [["_positions", []]];

//private _players = (playableUnits + switchableUnits) select {(isNull (getAssignedCuratorLogic _x))};
private _players = playableUnits + switchableUnits;

while {!(_players isEqualTo [])} do {

	if ((count _positions) < 1) exitWith {diag_log "Not enough positions supplied"};

	(_positions select 0) params ["_pos", "_dir"];
	_positions deleteAT 0;

	private _player = _players select 0;
	private _vehicle = vehicle _player;
	private _crew = fullCrew [_vehicle, "", false];

	_players = _players - _crew;

	_vehicle setPos _pos;
	_vehicle setDir _dir;

	private _driver = driver _vehicle;
	private _gunner = gunner _vehicle;
	private _commander = commander _vehicle;

	_crew = _crew - [_driver, _gunner, _commander];

	_driver moveInDriver _vehicle;
	_gunner moveInGunner _vehicle;
	_commander moveInCommander _vehicle;

	{
        _x moveInAny _vehicle;
    } forEach _crew;
};