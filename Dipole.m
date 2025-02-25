clear all
close all
clc

mu = pi*4e-7;                    % Permittivity of Free Space
e0 = 8.8541878128e-12;           % Vacuum Permittivity
c = 1/sqrt(mu*e0);               % Speed of Light
f = 900e6; %9.2e8;                       % Operating Frequency (Hz)
lambda = c/f;                    % wavelength
L1 = lambda/2.1;                 % First case
freqrange = 800e6:2e6:1000e6;

% Defining the dipole
d1 =  dipole('Length', L1, 'Width', L1/100) % 'TiltAxis', 'Z')%, 'Length', L1, 'Width', L1/100, 'TiltAxis', 'Y') % 'Current' , 10)
ant = dipoleCrossed('Element', d1, 'Tilt', 90, 'TiltAxis',[0 1 0]);
figure;
show(ant);
title('Turnstile Antenna')

% Plotting 3D Radiation Pattern of Dipole and Maximum Directivity
figure,pattern(ant,f);
title('3D Radiation Pattern of Turnstile antenna with L = 3\lamda/4');

figure,patternElevation(ant,f),title('E-Plane'), xlabel('E-Plane'), ylabel('E-Plane')

figure,patternAzimuth(ant,f),

figure,beamwidth(ant,f,0,1:1:360);
title('HPBW')

figure;returnLoss(ant, freqrange, 50); % antenna, frequency range for the antennas, resistance of the system (ohms)


