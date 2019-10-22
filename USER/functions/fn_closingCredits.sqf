params [["_color", "#FFFFFF"]];

//Create black background
cutText ["","BLACK FADED", 999];

//Create Text
private _headerText =  format ["<t color='%1' size = '1.5'>", _color];
private _bodyText = format ["<t color='%1' size = '.8'>", _color];
private _breakLine = " <br />";
private _endStructuredText = " </t>";

private _text = [(format ["<t color='%1' size = '2'>Abspann", _color])];
private _return = [_headerText + "Zeus" + _bodyText];
private _number = 0;
{
    if (!(isNull (getAssignedCuratorUnit _x)) && !(str _x in ["zeusModule_adminLogged", "zeusModule_adminVoted"])) then {
        _number = _number +1;
        _return pushBack (format["Zeus %1: %2", _number, name (getAssignedCuratorUnit _x)]);
    };
}forEach allCurators;

if (count _return > 1) then {
    _text pushBack (_return joinString _breakLine);
    _text pushBack (_headerText + " ");
};

_text pushBack (_headerText + "Songs");
_text pushBack (_bodyText + "Intro: Two Steps from Hell - Never Back Down");
_text pushBack (_bodyText + "Outro: Zack Hemsey - The Way");
_text pushBack (_headerText + " ");

_text pushBack (_headerText + "Dankesagung");
_text pushBack (_bodyText + "Vielen Dank an Bohemia Interactiv für das großartig Spiel.");
_text pushBack (_bodyText + "Vielen Dank an Timeout, für die großartigen Bauten.");
_text pushBack (_headerText + " ");
/*
_text pushBack (_headerText + "Intel found");

private _intelFound = [];
{
    _x params ["", "_item"];

    private _type = typeOf _item;
    private _name = switch (_type) do {
        case "Land_HandyCam_F" : {"Camcorder"};
        case "Land_Laptop_F" : {"Laptop"};
        case "Land_Tablet_01_F" : {"Tablet"};
        case "Land_MobilePhone_smart_F" : {"Smartphone"};
        case "Land_MobilePhone_old_F" : {"Handy"};
        case "Land_Camera_01_F" : {"Fotokamera"};
        default {_type};
    };

    private _index = -1;

    {
        _x params ["_itemType", "_amount"];

        if (_itemType isEqualTo _type) exitWith {
            _intelFound set [_forEachIndex, _amount + 1];
            _index = _forEachIndex;
        };
    }forEach _intelFound;
    
    if (_index < 0) then {
        private _amount = 0;
        {
            _x params ["_itemType", "_count"];

            if (_itemType isEqualTo _type) exitWith {
                _amount = _count;
            };
        }forEach grad_user_intelFoundMaxAmount;

        _intelFound pushBack [_name, 1, _amount];
    };
}forEach grad_user_intelFound;

{
    _x params ["_beautifiedName", "_amount", "_amountFound"];

    _text pushBack (_bodyText + format ["%1: %2/%3", _beautifiedName, _amountFound, _amount]);
}forEach _intelFound;

_text pushBack (_headerText + " ");
*/
_text pushBack (_headerText + "Helden des Abends");

_return = [];

private _groups = ["GetAllGroupsOfSide", [WEST,EAST]] call BIS_fnc_dynamicGroups;

{
    private _group = _x;
    _return pushBack " ";
    _return pushBack (format ["<t color='%1' size = '1'>", _color] + (groupId _group) + _endStructuredText + _bodyText);
    {
            private _description = roleDescription _x;
            if (_description == "") then {
                _description = getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
            };

            private _split = _description splitString "@";
            if (count _split > 1) then {
                _description = _split select 0;
            };
            _return pushBack (format ["%1: %2", _description, name _x]);
    }forEach (units _group);
} forEach _groups;

_text pushBack (_bodyText + (_return joinString _breakLine));

private _fullText = _text joinString (_endStructuredText + _breakLine);

//Create Dynamic Text
[
    _fullText,
    -1,
	safezoneY +1.8,
    20,
    1,
    -5
] spawn BIS_fnc_dynamicText;
