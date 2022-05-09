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

params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_missile", "_gunner"];

_camT = createVehicle ["Sign_Sphere10cm_F",[0,0,0],[],0,"CAN_COLLIDE"];
_camT hideObject true;
_camT attachTo [_missile,[0,6,0]];
["piprenderscreen_1", [[_missile, [0,4,0.0]], _camT]] call BIS_fnc_PIP;