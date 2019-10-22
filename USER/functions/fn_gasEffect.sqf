params ["_obj"];
  
private _particleSource = "#particlesource" createVehicleLocal getPos _obj;  
    
_particleSource setParticleCircle [  
	1,   
	[  
		(1 - (random 2)),   
		(1 - (random 2)),   
		0  
	]  
];     
  
_particleSource setParticleRandom [ 
	0,  
	[1, 1, 0],  
	[2, 2, 0],  
	2,  
	0.5,  
	[0, 0, 0, 0.3],  
	10,  
	0 
];    
    
_particleSource setParticleParams [   
	["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 3, 1],   
	"",    
	"Billboard",    
	1,    
	30,    
	[0, 0, 0],    
	[0, 0, 0],    
	0,    
	6.4,    
	5,    
	0.5,    
	[1],    
	[   
	[0.804,0.678,0,0.4]   
	],    
	[0.125],    
	1,    
	0,    
	"",    
	"",    
	_obj   
];   
    
_particleSource setDropInterval 0.005;   

[{!(isNil "grad_user_gasOut")},{
	params ["_particleSource"];

	deleteVehicle _particleSource;
}, [_particleSource]] call CBA_fnc_waitUntilAndExecute;
