params ["_item", "_hiddenItem"];

_item setVariable ["grad_user_notPickedUp", true];
_item setVariable ["grad_user_hiddenItem", _hiddenItem];

private _action = [
    "pickUpItem",
    "Pick Up",
    "",
    {
        ["grad_hideObjectServer", [_target, true]] call CBA_fnc_serverEvent;

        grad_user_intelFound pushBackUnique [ace_player, (_target getVariable "grad_user_hiddenItem")];
        publicVariable "grad_user_intelFound";
    },
    {true},
    {},
    [],
    [0,0,0]
] call ace_interact_menu_fnc_createAction;

[_item, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;