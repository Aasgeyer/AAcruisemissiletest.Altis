
[player,"cruiseMark"] call BIS_fnc_addCommMenuItem;
[player,"endMission"] call BIS_fnc_addCommMenuItem;

//[] call AAS_fnc_screens;

MENU_PRIOCOMMS =
[
	["Prio Targets", false],
	["Mark Prio 1", [2], "", -5, [["expression", "[_pos, _target, 101] call AAS_fnc_commMenu;"]], "1", "1"],
	["Mark Prio 2", [3], "", -5, [["expression", "[_pos, _target, 102] call AAS_fnc_commMenu;"]], "1", "1"],
	["Mark Prio 3", [4], "", -5, [["expression", "[_pos, _target, 103] call AAS_fnc_commMenu;"]], "1", "1"],
	["Mark Prio 4", [5], "", -5, [["expression", "[_pos, _target, 104] call AAS_fnc_commMenu;"]], "1", "1"]
];

MENU_CRUISECOMMS =
[
	["Submenu", false],
	["Mark Target", [2], "", -5, [["expression", "[_pos, _target, 1] call AAS_fnc_commMenu;"]],
	 "1", "cursorOnGround", "\a3\ui_f\data\IGUI\Cfg\Targeting\LaserTarget_ca.paa"],
	["Cancel Target", [3], "", -5, [["expression", "[_pos, _target, 2] call AAS_fnc_commMenu;"]],"1", "cursorOnGround"],
	["Prio Targets", [4], "#USER:MENU_PRIOCOMMS", -5, [], "1", "1"],
	["Cancel All Targets", [5], "", -5, [["expression", "[_pos, _target, 3] call AAS_fnc_commMenu;"]],"1","count (missionNamespace getVariable ['AAS_laserArray',[]]) > 0"]
];

waitUntil {!isNil "AAS_prio4Targets"};
[] call AAS_fnc_briefing;

