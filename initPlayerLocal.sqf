if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];


["CBA_loadingScreenDone", {
    [{time > ((_this select 0) + 5)},{
        params ["", "_didJip"];
        if (!(_didJip) || {(_didJip && !(isNil "GRAD_USER_introOver"))}) then {    
            //if (isNull (getAssignedCuratorLogic player)) then {
                STHud_UIMode = 0;
                diwako_dui_main_toggled_off = true;
                ["Mediterranean", "introMusic"] call GRAD_USER_fnc_intro;
            //};
        };
    }, [time, didJIP]] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

