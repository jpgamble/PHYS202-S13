
V = 500;
b = .82 * 10^(-7) 
d = 7.65 * 10^(-3);
E =  V/d;
rho = 886;
grav = 9.8;
vu = [0.00012987	0.000135135	0.000153846	9.80392E-05	0.00012987	0.00012987	0.000113636	0.000147059	0.00012987	0.000147059	0.000140845	0.00016129
];
vu1 = [0.000625];
vu2 = 	0.000649351	;
vu3 = 0.00078125	;
vu4 = 0.000555556	;
vu5 = 0.000724638;
vu6 = 0.000561798;
vu7 =  0.004504505;
vf = [1.97628E-05	3.14465E-05	1.79856E-05	1.91939E-05	2.19298E-05	2.25225E-05	1.44092E-05	2.7027E-05	2.31481E-05	2.58398E-05	1.98413E-05	2.6738E-05
];
vf1 = 0.102040816;
vf2 = 0.053821313;
vf3 = 0.03671072;
vf4 = 0.053821313;
vf5 = 0.039277298;
vf6 = 0.03003003;
vf7 = 0.064350064;
vfnew = [2.04082E-05	1.07643E-05	7.34214E-06	1.07643E-05	7.85546E-06	6.00601E-06	1.287E-05	9.30233E-06	1.05932E-05	1.20482E-05	8.84956E-06	7.57002E-06
]
vunew = [0.000125	0.00012987	0.00015625	0.000111111	0.000144928	0.00011236	0.000900901	0.000181818	0.000117647	0.000140845	0.000163934	0.000111111
]
T =[22 24.5	23.5 24.25	25	25	25.5]; 
T1 = 22;
T2 = 24.5;
T3 = 23.5;
T4 = 24.25;	
T5 = 25;	
T6 = 25;
T7 = 25.5;
h = (1.8 + (T3 - 15)/(209))*10^(-5); 
hnew= (1.8 + (T4 - 15)/(209))*10^(-5);
h1 = (1.8 + (T1 - 15)/(209))*10^(-5); 
h2 = (1.8 + (T2 - 15)/(209))*10^(-5); 
h3 = (1.8 + (T3 - 15)/(209))*10^(-5);
h4 = (1.8 + (T4 - 15)/(209))*10^(-5);
h5 = (1.8 + (T5 - 15)/(209))*10^(-5);
h6 = (1.8 + (T6 - 15)/(209))*10^(-5);
h7= (1.8 + (T7 - 15)/(209))*10^(-5);
rnew = sqrt(9*hnew.*vfnew/(2*grav*rho))
r = sqrt(9*h.*vf/(2*grav*rho))
r1 = sqrt(9.*h1*vfnew/(2.*grav.*rho));
r2 = sqrt(9.*h2*vfnew/(2.*grav.*rho));
r3 = sqrt(9.*h3.*vfnew/(2.*grav.*rho));
r4 = sqrt(9.*h4.*vfnew/(2.*grav.*rho));
r5 = sqrt(9.*h5.*vfnew/(2.*grav.*rho));
r6 = sqrt(9.*h6.*vfnew/(2.*grav.*rho));
r7 = sqrt(9.*h7.*vfnew/(2.*grav.*rho));
m1 = 4/3* pi .*(r1.^3).*rho;
m = 4/3* pi*(r.^3)*rho
mnew = 4/3* pi*(rnew.^3)*rho
%q = 4/3 pi rho g (sqrt((b/2p)^2 + 9 h vf/(2 g rho)) - b/2p)^3 (vf+vr)/(E vf)
y = ((1 + b*(r).^(-1))).^(-1.5)
ynew = ((1 + b*(rnew).^(-1))).^(-1.5)
qunew = ynew .* mnew*grav*(1+ vunew/vfnew)/E

qu = y .* m*grav*(1+ vu/vf)/E