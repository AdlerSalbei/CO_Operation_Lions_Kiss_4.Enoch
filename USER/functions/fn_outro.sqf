if (isServer) then {
    for "_i" from 1 to 100 do {
        private _objName = call compile format ["mortarSplash_%1", _i];

        if (isNull  _objName) exitWith {};

        [{
            params ["_obj"];
            [_obj] call grad_user_fnc_spawnMortarShell;
        }, _objName, random 3] call CBA_fnc_waitAndExecute;
    };

    [{
        [getPos mortarSplash_1, 5, 200, 300] call grad_user_fnc_createZone;
    }, [], 6] call CBA_fnc_waitAndExecute;
};

[{
    [player, "forceWalk", "CBRN", true] call ace_common_fnc_statusEffect_set;
}, [], 8] call CBA_fnc_waitAndExecute;

[
    {
        private _bool = true;
        {
            if (
                /*isNull (getAssignedCuratorLogic player) && 
                {!(_x getVariable ["ACE_isUnconscious", false])}*/
                !(_x getVariable ["ACE_isUnconscious", false])
            ) exitWith {
                _bool = false;
            };
        }forEach allPlayers;

        _bool
    },
    {
    [{
        STHud_UIMode = 0;
        diwako_dui_main_toggled_off = true;
        grad_user_gasOut = true;

        playMusic ["outroMusic", 0];
        cutText ["","BLACK OUT", 1];
        player allowDamage false;
        player setVariable ["diwako_cbrn_stoppedAutoDamage", true];

        [{
            cutText ["","BLACK FADED", 999];

            [player, false] call ace_medical_fnc_setUnconscious;
            [player, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;

            diwako_cbrn_mask_damage ppEffectAdjust [0, 0, true];
            diwako_cbrn_mask_damage ppEffectCommit 0;

            [{
                titleText [format["<t font='PuristaBold' size='3'>Am 21.10.2019 Liesen %1 Helden ihr leben bei der Verteidigung des Präsidenten Livonias</t>", ({isNull (getAssignedCuratorLogic _x)} count allPlayers)], "PLAIN", 1, true, true];
                [{

                    [] call GRAD_USER_fnc_closingCredits;

                    if (isServer) then {
                        ["BLU_F", "SOGBLACK", true] call GRAD_Loadout_fnc_FactionSetLoadout;
                        {
                            if (isNull (getAssignedCuratorLogic _x)) then {
                                [_x] call GRAD_Loadout_fnc_doLoadoutForUnit;
                            };
                        }forEach (playableUnits + switchableUnits);

                        private _chairs = [getPos firePlace, 5, "Land_CampingChair_V2_F", (count (playableUnits + switchableUnits)) + 3] call GRAD_USER_fnc_chairCircle;
                        [{
                            params ["_chairs"];

                            [_chairs] call GRAD_USER_fnc_seatPlayers;
                        }, [_chairs], 1] call CBA_fnc_waitAndExecute;
                    };
                    
                    [{
                        cutText ["","BLACK IN", 1];
                        10 fadeMusic 0.05;

                        [{
                            5 fadeMusic 0;
                        }, [], 10] call CBA_fnc_waitAndExecute;
                    }, [], 20] call CBA_fnc_waitAndExecute;
                }, [], 12] call CBA_fnc_waitAndExecute;
            }, [], 1] call CBA_fnc_waitAndExecute;
        }, [], 1] call CBA_fnc_waitAndExecute;
    }, [], 3] call CBA_fnc_waitAndExecute;
},
[]
] call CBA_fnc_waitUntilAndExecute;