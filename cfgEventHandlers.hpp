class Extended_Init_EventHandlers  {
    class ModuleCurator_F {
        class grad_template_curatorInit {
            init = "_this call grad_events_fnc_addCuratorEHs";
        };
    };
};

class Extended_Local_EventHandlers {
    class CAManBase {
        class grad_template_unitLocality {
            local = "_this call grad_events_fnc_onUnitLocalityChanged";
        };
    };
};
class Extended_PreInit_EventHandlers {
    class diwako_cbrn_preInit {
        init = "[] call compile preProcessFileLineNumbers 'node_modules\diwako_cbrn\XEH_PreInit.sqf'";
    };
};

class Extended_InitPost_EventHandlers {
    #include "node_modules\diwako_cbrn\XEH_InitPost_eh.hpp"
};