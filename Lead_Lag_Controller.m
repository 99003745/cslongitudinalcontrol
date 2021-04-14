%% Lead lag Controller for longitudinal Control of Vehicle

%% Tool Analysis

clc
clear all
C1=743; 
T=1; 
tau =0.2;
M=1500; 
Ca=1.19; 
v=30;
s=tf('s')
sys=tf([C1/M*T],[1,2*Ca*v/M]);
sys2=tf([1],[1,1/T]);
sys3=tf([1],[1,1/tau]); 
sysf=sys2*sys3*sys
Gc=(s+.03)/(s+.04); 
lead=sysf*Gc
p=pole(sysf)
p1=pole(lead)
z=zero(sysf)
z1=zero(lead)
figure
pzmap(lead) 
figure
step(lead)
% stepinfo(lead)
stepinfo(sysf)
figure(1)
rlocus(sysf)
figure(2)
rlocus(lead);

figure(3)
Gcloseloop=sysf*Gc/(1+sysf*Gc)
step(lead)
figure(4)
step(sys)
figure(5)
Gcloseloop=sysf*Gc/(1+sysf*Gc);
step(sysf/(1+sysf));
hold on
step(Gcloseloop);
legend('closeloop response without any controller','closeloop response with Lag compensator');
%% Analysis for Lead Compensator
% 
% RiseTime: 29.6486
% SettlingTime: 45.5398
% SettlingMin: 1.4183
% SettlingMax: 1.5874
% Overshoot: 1.6990
% Undershoot: 0
% Peak: 1.5874
% PeakTime: 75.9853
%
% Without Compensator--
% RiseTime: 46.2140
% SettlingTime: 83.4147
% SettlingMin: 1.8800
% SettlingMax: 2.0798
% Overshoot: 0
% Undershoot: 0
% Peak: 2.0798
% PeakTime: 153.8282
%
% Speed--speed of response is more in lead compensator
% Accuracy-- Lead Compensator provides higher accuracy
% Stability of system without compensator is high because overshoot is
% zero.
