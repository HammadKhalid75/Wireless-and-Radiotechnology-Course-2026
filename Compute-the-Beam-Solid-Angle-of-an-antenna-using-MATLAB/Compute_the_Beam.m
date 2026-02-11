clc;
close all;
clear all;

tmin = input('The lower bound of theta in degree=\n');
tmax = input('The upper bound of theta in degree=\n');
pmin = input('The lower bound of phi in degree=\n');
pmax = input('The upper bound of phi in degree=\n');

theta = (tmin:tmax) * (pi/180);
phi = (pmin:pmax) * (pi/180);

dth = theta(2) - theta(1);
dph = phi(2) - phi(1);

[THETA, PHI] = meshgrid(theta, phi);

x = input('The field pattern : E(THETA,PHI)=\n', 's');
v = input('The power pattern: P(THETA,PHI)=\n', 's');

Pn = eval(v);
Prad = sum(sum(Pn .* sin(THETA) .* dth .* dph));

fprintf('\n Input Parameters:\n');
fprintf('------------------------\n');
fprintf(' Theta = %g : %g : %g\n', tmin, dth*180/pi, tmax);
fprintf(' Phi = %g : %g : %g\n', pmin, dph*180/pi, pmax);
fprintf(' POWER PATTERN : %s\n', v);

fprintf('\n Output Parameters:\n');
fprintf('------------------------\n');
fprintf('BEAM AREA (steradians)=%3.2f\n', Prad);