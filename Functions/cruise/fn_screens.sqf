params ["_screen"];

{
	for "_r" from 1 to 2 do {
		_i = _r + _foreachindex*2;
		_piprender = format ["piprenderscreen_%1", _i];
		_res = 512;
		_x setObjectTexture [_r-1, format ["#(argb,%1,%2,1)r2t(%3,1)",_res,_res,_piprender]];
	};
} forEach [screen_12,screen_34];