/*
	Author: Aasgeyer

	Description:
		__DESCRIPTION___

	Parameter(s):
		0:	__TYPE__ - __EXPLANATION__
		Optional:
		N:	__TYPE___ - __EXPLANATION__
			Default: __DEFAULT___

	Returns:
		__TYPE__ - __EXPLANATION___

	Example(s):
		__PARAMETER__ __EXECUTIONMETHOD__ __FUNCTION___;
//-> __RETURN__
*/

params ["_pos", ["_target",objNull], ["_mode",1]];


switch (_mode) do {
	case 1: {
		// mark new target
		_ATLpos = ASLToATL _pos;
		_ATLpos set [2,0.2];
		_laserArr = missionNamespace getVariable ["AAS_laserArray",[]];
		if (count _laserArr >= 4) exitWith {
			player sideChat format ["Maximum number of targets (4) reached.", mapGridPosition _ATLpos];
		};
		_pad = createVehicle ["Land_HelipadEmpty_F",_ATLpos,[],0,"CAN_COLLIDE"];
		_laserT = createVehicle ["LaserTargetW",_ATLpos,[],0,"CAN_COLLIDE"];
		_laserT attachTo [_pad, [0,0,0.4]];
		_mrk = createMarker [format ["mrk_lt_%1",_ATLpos], _ATLpos];
		_mrk setMarkerType "mil_destroy";
		_mrk setMarkerText format ["ID: %1", mapGridPosition _ATLpos];
		_mrk setMarkerColor "ColorRed";
		_pad setVariable ["AAS_targetMarker", _mrk];
		player sideChat format ["Target at grid %1 marked.", mapGridPosition _ATLpos];
		west reportRemoteTarget [_laserT, 36000]; 
		_laserT confirmSensorTarget [west, true];

		_laserArr pushBack _laserT;
		missionNamespace setVariable ["AAS_laserArray",_laserArr];
	};

	case 2: {
		//cancel target
		_ATLpos = ASLToATL _pos;
		_ATLpos set [2,0.2];
		_r = 250;
		_nearObj = nearestObjects [_ATLpos, ["LaserTargetW"], _r, true];
		if (count _nearObj > 0) then {
			_laserT = _nearObj#0;
			_pad = attachedTo _laserT;
			_mrk = _pad getVariable ["AAS_targetMarker", ""];
			_laserArr = missionNamespace getVariable ["AAS_laserArray",[]];
			_laserArr deleteAt (_laserArr find _laserT);
			missionNamespace setVariable ["AAS_laserArray",_laserArr];
			player sideChat format ["Target at grid %1 canceled.", mapGridPosition markerPos _mrk];
			{deleteVehicle _x} forEach [_laserT,_pad];
			deleteMarker _mrk;
		} else {
			systemChat format ["No laser markings found within %1 meters.", _r];
		};
	};

	case 3: {
		//cancel all targets
		_laserArr = missionNamespace getVariable ["AAS_laserArray",[]];
		{
			_pad = attachedTo _x;
			_mrk = _pad getVariable ["AAS_targetMarker", ""];
			{deleteVehicle _x} forEach [_x,_pad];
			deleteMarker _mrk;
		} foreach _laserArr;
		_lcount = count _laserArr;
		player sideChat format ["%1 target%2 canceled.", _lcount, ["","s"] select (_lcount != 1)];
		_laserArr = [];
		missionNamespace setVariable ["AAS_laserArray",_laserArr];
	};

	case 101: {
		//prio 1
		_prio = _mode-100;
		_markerPreFix = format ["marker_prio%1_",_prio];
		_prioMarkers = [_markerPreFix] call BIS_fnc_getMarkers;
		{
			[markerPos _x, objNull, 1] call AAS_fnc_commMenu;
		} foreach _prioMarkers;
	};
	
	case 102: {
		//prio 2
		_prio = _mode-100;
		_markerPreFix = format ["marker_prio%1_",_prio];
		_prioMarkers = [_markerPreFix] call BIS_fnc_getMarkers;
		{
			[markerPos _x, objNull, 1] call AAS_fnc_commMenu;
		} foreach _prioMarkers;
	};
	
	case 103: {
		//prio 3
		_prio = _mode-100;
		_markerPreFix = format ["marker_prio%1_",_prio];
		_prioMarkers = [_markerPreFix] call BIS_fnc_getMarkers;
		{
			[markerPos _x, objNull, 1] call AAS_fnc_commMenu;
		} foreach _prioMarkers;
	};
	
	case 104: {
		//prio 4
		_prio = _mode-100;
		_markerPreFix = format ["marker_prio%1_",_prio];
		_prioMarkers = [_markerPreFix] call BIS_fnc_getMarkers;
		{
			[markerPos _x, objNull, 1] call AAS_fnc_commMenu;
		} foreach _prioMarkers;
	};
};
