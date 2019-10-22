params ["_obj"];

private _action1 = [
    "ody1",
    "Ody 1",
    "",
    {
        panel_01 setObjectTextureGlobal [0, "data\Planung_Ody_1.paa"];
    },
    {true},
    {},
    [],
    [0,0,0]
] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions"], _action1] call ace_interact_menu_fnc_addActionToObject;

private _action2 = [
    "ody2",
    "Ody 2",
    "",
    {
        panel_01 setObjectTextureGlobal [0, "data\Planung_Ody_2.paa"];
    },
    {true},
    {},
    [],
    [0,0,0]
] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions"], _action2] call ace_interact_menu_fnc_addActionToObject;

private _action3 = [
    "ody3",
    "Ody 3",
    "",
    {
        panel_01 setObjectTextureGlobal [0, "data\Planung_Ody_3.paa"];
    },
    {true},
    {},
    [],
    [0,0,0]
] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions"], _action3] call ace_interact_menu_fnc_addActionToObject;

private _action4 = [
    "ody4",
    "Ody 4",
    "",
    {
        panel_01 setObjectTextureGlobal [0, "data\Planung_Ody_4.paa"];
    },
    {true},
    {},
    [],
    [0,0,0]
] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions"], _action4] call ace_interact_menu_fnc_addActionToObject;
