params ["_book"];

{
	_x params ["_headClass", "_subClass"];
	_actionText = getText (configFile >> "CfgHints" >> _headClass >> _subClass >> "displayName");
	_actionText = format ["<t color='#FFFFFF00'>%1</t>",_actionText];
	_book addAction [_actionText, {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_arguments params ["_hc","_sc"];
		//[[_headClass, _subClass, 15, "", 35, "", true, true]] call BIS_fnc_advHint;
		playSound3D [format ["a3\Missions_F_Oldman\Data\sound\Intel_Laptop\1sec\Intel_Laptop_1sec_0%1.wss",ceil random 3], _target];
		openMap true;
		[_hc, _sc] call BIS_fnc_openFieldManual;
	}, _x, 100+_foreachIndex, false, true, "", "true", 8];
} foreach [
	["Tactics","Ballistic"],
	["Vehicle","VehicGuided"],
	["Vehicle","Sensors"],
	["UAV","Targets"],
	["UAV","Connection"]
];
