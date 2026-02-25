%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RF Planning Studio - MODIFIED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;

%% -------------------------
% Baseline link parameters
%% -------------------------
c = 3e8;
f = 868e6; 
lambda = c/f;
D = 4000; 
Ptx = 14; 
Gtx = 2; Grx = 2; 
Lcable = 1; 
Srx = -120; 
fadeMargin = 10; 
htx = 20; hrx = 2; 
n = 2.7; 

xObs = 0.5*D; 
hObsAboveLOS = 3; 
clearRatio = 0.60; 

%% -------------------------
% Helper formulas
%% -------------------------
FSPL = @(fHz, d) (20*log10(fHz) + 20*log10(d) - 147.55);
PLlog = @(PL0, d, d0, n) (PL0 + 10*n*log10(d./d0));
EIRP = @(Ptx, Gtx, Lc) (Ptx + Gtx - Lc);
PrxFun = @(EIRP, Grx, PL, m) (EIRP + Grx - PL - m);
FresnelR = @(lambda, x, D) sqrt((lambda .* x .* (D-x)) ./ D);

d = logspace(log10(200), log10(12000), 300); 
dkm = d/1000;
d0 = 100; 
PL0 = FSPL(f, d0);

% Baseline Calculation
PL_base = PLlog(PL0, d, d0, n);
Prx_base = PrxFun(EIRP(Ptx,Gtx,Lcable), Grx, PL_base, fadeMargin);

%% -------------------------
% Plot setup
%% -------------------------
figure('Name','RF Planning Studio - Modified Experiments');
semilogx(dkm, Prx_base, 'k--', 'LineWidth', 2); grid on; hold on;
yline(Srx, 'r:', 'Sensitivity Limit', 'LineWidth', 2);

%% =========================================================
% MODIFIED EXPERIMENTS
%% =========================================================

%% (1) Increase gateway height by +5 m
htx_1 = htx + 5; 
maxLOS_1 = 3.57*(sqrt(htx_1) + sqrt(hrx));
fprintf('--- EXPERIMENT 1 ---\n');
fprintf('New Gateway Height: %.0f m\n', htx_1);
fprintf('New Max LOS distance: %.2f km\n\n', maxLOS_1);

%% (2) Increase antenna gains to 5 dBi
Gtx_2 = 5; 
Grx_2 = 5; 
Prx_2 = PrxFun(EIRP(Ptx,Gtx_2,Lcable), Grx_2, PL_base, fadeMargin);
semilogx(dkm, Prx_2, 'b', 'LineWidth', 2);
fprintf('--- EXPERIMENT 2 ---\n');
fprintf('Gains increased to 5 dBi (Total +6dB system gain)\n\n');

%% (3) Change environment exponent n (Testing n = 3.5)
n_3 = 3.5; 
PL_3 = PLlog(PL0, d, d0, n_3);
Prx_3 = PrxFun(EIRP(Ptx,Gtx,Lcable), Grx, PL_3, fadeMargin);
semilogx(dkm, Prx_3, 'g', 'LineWidth', 2);
fprintf('--- EXPERIMENT 3 ---\n');
fprintf('Environment Exponent n changed to %.1f\n\n', n_3);

%% (4) Move gateway location (Obstacle at 0.3*D)
xObs_4 = 0.3 * D; 
rF_4 = FresnelR(lambda, xObs_4, D);
requiredClear_4 = clearRatio * rF_4;
fresnelOK_4 = (hObsAboveLOS < requiredClear_4);

fprintf('--- EXPERIMENT 4 ---\n');
fprintf('Obstacle moved to 30%% of path (%.0f m)\n', xObs_4);
fprintf('Fresnel Radius: %.2f m, Required 60%%: %.2f m\n', rF_4, requiredClear_4);
fprintf('Fresnel Clearance OK? %s\n', string(fresnelOK_4));

% Final Plot Formatting
xlabel('Distance (km)');
ylabel('Received power after margin (dBm)');
title('RF Planning: Impact of Gain and Environment');
legend('Baseline (n=2.7, G=2dBi)', 'Sensitivity Limit', 'Gain = 5 dBi', 'Exponent n = 3.5', 'Location', 'southwest');