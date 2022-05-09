
private _createdRecord = player createDiaryRecord ["Diary", ["Signal",
format ["%5 - USS Virtuous<br/>
%4 - USS Virtuous helicopter<br/>
%1 - USS Virtuous VLS operator (You)<br/>
%2 - High Command<br/>
%3 - Submarine<br/>
Jester - Stealth Fighters",
groupId group player, groupId group b_hq, groupId b_subGroup, groupId b_heliGroup, groupId b_shipGroup]]];

_briefText = format ["1. Take control of the Mk41 VLS.<br/>
	2. Mark the targets with the communication menu (0-8-1-)<br/>
	3. Destroy the <execute expression='If (time > 0) then {{[_x, %5, %6] spawn BIS_fnc_blinkMarker;} foreach %1;}'>Prio 1 Targets.</execute><br/>
	4. Destroy the <execute expression='If (time > 0) then {{[_x, %5, %6] spawn BIS_fnc_blinkMarker;} foreach %2;}'>Prio 2 Targets.</execute><br/>
	5. Destroy the <execute expression='If (time > 0) then {{[_x, %5, %6] spawn BIS_fnc_blinkMarker;} foreach %3;}'>Prio 3 Targets.</execute><br/>
	6. Destroy the <execute expression='If (time > 0) then {{[_x, %5, %6] spawn BIS_fnc_blinkMarker;} foreach %4;}'>Prio 4 Targets.</execute><br/>
	7. Send confirmation of the end of the fire mission via radio (0-8-2).",
	["marker_prio1_"] call BIS_fnc_getMarkers,
	["marker_prio2_"] call BIS_fnc_getMarkers,
	["marker_prio3_"] call BIS_fnc_getMarkers,
	["marker_prio4_"] call BIS_fnc_getMarkers,
	0.5, 3
];
private _createdRecord = player createDiaryRecord ["Diary", ["Execution",_briefText]];

private _createdRecord = player createDiaryRecord ["Diary", ["Mission", 
"Eliminate all priority targets marked on the map!"]];

_filter = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-, ";
_stringArray = [];
for "_i" from 1 to 4 do {
	_prioT = missionNamespace getVariable format ["AAS_prio%1Targets",_i];
	_prioDisplayNames = [];
	{
		_displayName = [configFile >> "CfgVehicles" >> typeOf _x] call BIS_fnc_displayName;
		_prioDisplayNames pushBackUnique _displayName;
	} forEach _prioT;
	_strArray = str _prioDisplayNames;
	_strArray = [_strArray, _filter] call BIS_fnc_filterString;
	_strArray = [_strArray, ",", ", "] call CBA_fnc_replace;
	_stringArray pushBack _strArray;
};

private _createdRecord = player createDiaryRecord ["Diary", ["Situation", 
format ["As NATO forces are preparing for the invasion of Altis following the AAF attack
 on NATO forces a month prior, the USS Virtuous has been tasked to engage key AAF
 and CSAT targets with cruise missiles. The <marker name='marker_11'>USS Virtuous</marker>, callsign Swordfish, is ca. 10 km southwest
 of the Altian coast with the Columbia-class submarine ""USS Illinois"", callsign Raider, which
 will continue further north. <marker name='marker_12'>Stealth fighters</marker>, callsign Jester-1 and Jester-2, are 
 awaiting the elimination of the enemy's air defense. A recon squad will be
 brought in via helicopter, callsign Swordfish-3, from the USS Virtuous to secure
 the <marker name='marker_14'>AAC airfield</marker>.<br/>
 Priority 1 targets are anti-air positions (%1).<br/>
 Priority 2 targets are fighter jets parked at the main Airport (%2).<br/>
 Priority 3 targets are military information infrastructure (%3).<br/>
 Priority 4 targets are military command posts (%4).
", _stringArray#0, _stringArray#1, _stringArray#2, _stringArray#3]
]];