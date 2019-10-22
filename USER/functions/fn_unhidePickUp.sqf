params ["_obj"];

private _action = [
    "placeItem",
    "Place Items",
    "",
    {
        {
            _x params ["_unit", "_item"];
            if (((ace_player isEqualTo _unit) || {!(_unit in allPlayers)}) && (isObjectHidden _item)) then {
                ["grad_hideObjectServer", [_item, false]] call CBA_fnc_serverEvent;
            };

        }forEach grad_user_intelFound;
    },
    {true},
    {},
    [],
    [0,0,0]
] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;