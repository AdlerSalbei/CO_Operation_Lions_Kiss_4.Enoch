params ["_chairs", ["_unitsToSeat", (playableUnits + switchableUnits)]];

{
    if (_chairs isEqualTo []) exitWith {};

    private _time = 0.01;

    if (isNull (getAssignedCuratorLogic _x)) then {
        private _chair = _chairs select 0;
        _chairs deleteAT 0;
        [{_this call acex_sitting_fnc_sit;}, [_chair, _x], _time] call CBA_fnc_waitAndExecute;
        _time = _time + 0.01;
    };
}forEach (playableUnits + switchableUnits);
