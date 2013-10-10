%1 Part a)
clear all; close all;

grid on
%% 2 Part a)
x = (1*10^(-2))*[2 4 6 8 10];
yoff = (1*10^(-2)).*[0 0 0.5 0.1 0.2];
y2 = (1*10^(-2))*[0.18 0.45-.05 0.85-.1 1.35-.15 2-.2];
y2d = (1*10^(-2))*[-0.2 -0.45-.05 -0.8-.1 -1.34-.15 -2-.2];
y1d = (-1*10^(-2))*[0.2 0.4-.05 0.85-.1 1.3-.15 2-.2];
y1 = (1*10^(-2))*[.18	0.5	0.9	1.35 2] - yoff;
y15 =(1*10^(-2))*[0.18	0.45 0.85 1.35	2] - yoff;
y15d =(1*10^(-2))*[-0.2	-0.4 -0.8 -1.3	-2] + yoff;
y25 = (1*10^(-2))*[0.18	0.45 0.85 1.35 2] - yoff;
y25d = (1*10^(-2))*[-0.2 -0.45	-0.8 -1.35	-2] + yoff;
y3 = (1*10^(-2))*[0.18	0.45 0.85 1.35	2] - yoff;
y3d = (1*10^(-2))*[-0.2	-0.45 -0.8 -1.35 -2] + yoff;
Vdev = 10;	
V = [1000 1500 2000 2500 3000];
Iup = [2.6 3.2 3.8 4.3 4.7];
Idown = [3 3.6 4.1 4.6 5];
fun =  @(a,b,c, x) -sqrt(a^2-(x-b).^2)+c;
guess =  fun(.20,0,.20,x);
fun1 =  @(a,b,c, x) -sqrt(a^2-(x-b).^2)+c;
guess1 =  fun1(.3469,-.0082,.3475,x);
fun2 = @(a,b,c, x) sqrt(a^2-(x-b).^2)+c;
guess2 =  fun2(-.3051,-.01328,-.3053,x);
%plot(x,guess1, 'b:')
%%
hold on
figure(1)
plot(x,y2, 'g.')
plot(x,y2d, 'b.')
plot(x,y1, 'g.')
plot(x,y1d, 'b.')
plot(x,y15, 'g.')
plot(x,y15d, 'b.')
plot(x,y25, 'g.')
plot(x,y25d, 'b.')
plot(x,y3, 'g.')
plot(x,y3d, 'b.')
title('Visually Inspected X and Y Values for Distributed Elecetrons')
hleg2 = legend('Upward Curve Values','Down Curve Values');
xlabel('X Coordinates (m)')
ylabel('Y Coordinates (m)')
hold off
%%
fittedmodel2 = fit(x',y2',fun,'StartPoint',[.20 0 .20])
fittedmodel2d = fit(x',y2d',fun1,'StartPoint',[-.20 0 -.20])
fittedmodel1 = fit(x',y1',fun,'StartPoint',[.20 0 .20])
fittedmodel1d = fit(x',y1d',fun1,'StartPoint',[-.20 0 -.20])
fittedmodel15 = fit(x',y15',fun,'StartPoint',[.20 0 .20])
fittedmodel15d = fit(x',y15d',fun1,'StartPoint',[-.20 0 -.20])
fittedmodel25 = fit(x',y25',fun,'StartPoint',[.20 0 .20])
fittedmodel25d = fit(x',y25d',fun1,'StartPoint',[-.20 0 -.20])
fittedmodel3 = fit(x',y1',fun,'StartPoint',[.20 0 .20])
fittedmodel13d = fit(x',y1d',fun1,'StartPoint',[-.20 0 -.20])
radiusup2 = ((.02-(-0.08282)).^2)+((.1).^2)/(2.*(.1));
radiusdown2 = ((.02-(.0342)).^2)+((-.1).^2)/(2.*(-.1));
radiusup1 = ((.02-(-.01348)).^2)+((.1).^2)/(2.*(.1))
radiusdown1 = ((.02-(.01338)).^2)+((-.1).^2)/(2.*(-.1));
radiusup15 = ((.02-(-0.3173)).^2)+((.1).^2)/(2.*(.1));
radiusdown15 = ((.02-(-.09402)).^2)+((-.1).^2)/(2.*(-.1));
radiusup25 = ((.02-(-0.3173)).^2)+((.1).^2)/(2.*(.1));
radiusdown25 = ((.02-(-.1056)).^2)+((-.1).^2)/(2.*(-.1));
radiusup3 = ((.02-(-0.01348)).^2)+((.1).^2)/(2.*(.1));
radiusdown3 = ((.02-(-.01338)).^2)+((-.1).^2)/(2.*(-.1));
radiusup = [radiusup1, radiusup15, radiusup2, radiusup25, radiusup3]
radiusdown = [radiusdown1, radiusdown15, radiusdown2, radiusdown25, radiusdown3]
hold on
plot(fittedmodel2,'r-');
%plot(x,y2, '.g');
plot(fittedmodel2d,'r-');
AllRadAvg = ((y2+y2d)/2+(y1+y1d)/2+ (y15+y15d)/2+ (y25+y25d)/2+(y3+y3d)/2)/5;
plot(x,AllRadAvg, 'r-')
%plot(x,radiusup)
%plot(x, radiusdown)
hold off
%%
figure(2)
RadAvg = (mean(radiusdown)+mean(radiusup))/2
plot(V,(radiusup), 'g-')
title('Radius Distribution In Relation to Voltage')
grid on
hold on
plot (V,(radiusdown), 'b-')
RadUncert = 1*10^(0) * (sqrt((.05)^2 + (.05)^2))*[1,1,1,1,1];
errorbar(V,radiusup,RadUncert)
plot(V, (mean(radiusdown)+mean(radiusup))/2, 'r.')
hleg = legend('Radius Up','Radius Down', 'Radius Average');
xlabel('Voltages (Volts)')
ylabel('Radius (m)')
hold off
%%
figure(3)
u0 = 4*pi*10^(-7);
N= 127;
D = 22.3*10^(-2);
Iup2 = [2.6]; %#ok<*NBRAK>
Iup1 = [3.2];
Iup15 = [3.8];
Iup25 = [4.3];
Iup3 = [4.7];
Idown2 = [3];
Idown1= 3.6;
Idown15= 4.1;
Idown25= 4.6;
Idown3 = 5;
IUncert = .01 *[1,1,1,1,1];
Va1 = [1000];
Va15 = [1500];
Va2 = [2000];
Va25 = [2500];
Va3 = [3000];
Bup2 = 16*(u0)*N.*(Iup2)/(sqrt(125)*D);
Bdown2 = 16*(u0)*N.*(Idown2)/(sqrt(125)*D);
EMup2 = 2.*Va2/((Bup2^2 .* radiusup2.^2));
EMdown2 = 2.*Va2/((Bdown2.^2 .* radiusdown2.^2));
Bup1 = 16*(u0)*N.*(Iup1)/(sqrt(125)*D);
Bdown1 = 16*(u0)*N.*(Idown1)/(sqrt(125)*D);
EMup1 = 2.*Va1/((Bup1^2 .* radiusup1.^2));
EMdown1 = 2.*Va1/((Bdown1.^2 .* radiusdown1.^2));
Bup15 = 16*(u0)*N.*(Iup15)/(sqrt(125)*D);
Bdown15 = 16*(u0)*N.*(Idown15)/(sqrt(125)*D);
EMup15 = 2.*Va15/((Bup15^2 .* radiusup15.^2));
EMdown15 = 2.*Va15/((Bdown15.^2 .* radiusdown15.^2));
Bup25 = 16*(u0)*N.*(Iup25)/(sqrt(125)*D);
Bdown25 = 16*(u0)*N.*(Idown25)/(sqrt(125)*D);
EMup25 = 2.*Va25/((Bup25^2 .* radiusup25.^2));
EMdown25 = 2.*Va25/((Bdown25.^2 .* radiusdown25.^2));
Bup3 = 16*(u0)*N.*(Iup3)/(sqrt(125)*D);
Bdown3 = 16*(u0)*N.*(Idown3)/(sqrt(125)*D);
EMup3 = 2.*Va3/((Bup3^2 .* radiusup3.^2));
EMdown3 = 2.*Va3/((Bdown3.^2 .* radiusdown3.^2));
EMup =[EMup1, EMup15, EMup2, EMup25, EMup3];
Bup = [Bup1, Bup15, Bup2, Bup25, Bup3]
%%
grid on
set(gca, 'GridLineStyle', '-');
grid(gca,'minor')
title('grid minor')

Kelby= ((1./V').^2 + 4 *(.1./Iup').^2 + 4 *((.05*10^(-2))./guess1').^2 + 4*(.1/22.3).^2);
EMup'
mean(EMup);
DEMup = EMup' .* sqrt(Kelby)
mean(DEMup);
plot(V, EMup, 'b*')
errorbar(V,EMup,DEMup)

hold on
EMUpAvg = sum(EMup)/5;
EMDown = [EMdown1, EMdown15, EMdown2, EMdown25, EMdown3];
EMDownAvg = sum(EMDown)/5;
Bdown = [Bdown1, Bdown15, Bdown2, Bdown25, Bdown3];

Kelby2= ((1./V').^2 + 4 *(.1./Idown').^2 + 4 *((.05*10^(-2))./guess2').^2+ 4*(.1/22.3).^2);
EMDown'
DEMdown = EMDown' .* sqrt(Kelby2)
AvgUncert = (mean(DEMup) + mean(DEMdown))/2
AvgFracUncert = (mean(DEMup./(1.76*10^(11))) + mean(DEMdown./(1.76*10^(11))))/2;
PercentUncertUp = 100.*DEMup./(1.76*10^(11));
PercentUncertDown = 100.*DEMdown./(1.76*10^(11));
AvgPercentUncert = (mean(PercentUncertUp) + mean(PercentUncertDown))/2;
AVGUN = AvgUncert*[1,1,1,1,1];
plot(V, EMDown, 'r-')
errorbar(V,EMDown,DEMdown)
EMavg = (mean(EMUpAvg) + mean(EMDownAvg))./2
STDEMavg = (mean(DEMdown) + mean(DEMup))/(2* sqrt(5)) 
plot(V, EMavg, 'g.')
EMAct = 1.76*10^11 * [1 1 1 1 1];
plot(V, EMAct, 'r.')
hleg1 = legend('e/m up','e/m down', 'e/m average', 'e/m actual');
title('Electron Charge to Mass Ratio Related to Voltage')
xlabel('Voltage (Volts)')
ylabel('e/m (C/kg)')
hold off
%%
figure(5)
plot(Bup, EMup, 'b.')
hold on
plot(Bdown, EMDown, 'r*')
errorbar(Bdown,EMDown,DEMdown)

plot(Bup, EMavg, 'b*')
errorbar(Bup,EMup,DEMup)

plot(Bup, EMAct, 'g*')
hleg1 = legend('e/m up','e/m down', 'e/m average', 'e/m actual');
title('Electron Charge to Mass Ratio Related to Magnetic Field')
xlabel('Magnetic Field (tesla)')
ylabel('e/m (C/kg)')
grid on
hold off
%%
figure(6)

plot(radiusup, EMup, 'r.')
errorbar(radiusup,EMup,DEMup)
grid on
hold on
plot(radiusdown, EMDown, 'g*')
errorbar(radiusdown,EMDown,DEMdown)
plot(radiusdown, EMavg*[1 1 1 1 1], 'b*')
errorbar(radiusdown,EMavg*[1 1 1 1 1],AvgUncert*[1 1 1 1 1])
plot(radiusup, EMAct, 'r.')
hleg1 = legend('e/m up','e/m down', 'e/m average', 'e/m actual');
title('Charge to Mass Ratio Related to Radius of Electron Trajectory')
xlabel('Radius (m)')
ylabel('e/m (C/kg)')
hold off