% =========================================================================
% Wireless Technologies Performance Analysis: WiFi, Bluetooth, and Cellular
% =========================================================================

clear all;
close all;

% --- General System Parameters ---
G_t = 1;                % Gain of transmitting antenna
G_r = 1;                % Gain of receiving antenna
c = 3*1e8;              % Speed of light (m/s)
Pn = 500*1e-6;          % Noise power (Watts)

% =========================================================================
% Task 1: WiFi Simulation (IEEE 802.11b)
% =========================================================================
f_wifi = 2.4*1e9;       % Frequency (Hz)
BW_wifi = 22*1e6;       % Bandwidth (Hz)
d_wifi = 1:5:100;       % Distance (m)
P_t_wifi = 100*1e-3;    % Transmit Power (Watts)
lamb_wifi = c/f_wifi;   % Wavelength (m)

% Calculations
% 1. Received Power (Friis Equation)
Pr_wifi = (P_t_wifi * G_t * G_r * lamb_wifi^2) ./ ((4 * pi * d_wifi).^2);
Pr_wifi_dB = 10 * log10(Pr_wifi); % Convert to dBW

% 2. SINR
SINR_wifi = Pr_wifi ./ Pn;
SINR_wifi_dB = 10 * log10(SINR_wifi); % Convert to dB

% 3. Channel Capacity (Shannon-Hartley Theorem)
C_wifi = BW_wifi .* log2(1 + SINR_wifi);
C_wifi_dB = 10 * log10(C_wifi); % Convert to dB

% =========================================================================
% Task 2: Bluetooth Simulation (IEEE 802.15.1)
% =========================================================================
f_bt = 2.45*1e9;        % Frequency (Hz)
BW_bt = 2*1e6;          % Bandwidth (Hz)
d_bt = 0.5:0.5:10;      % Distance (m)
P_t_bt = 10*1e-3;       % Transmit Power (Watts)
lamb_bt = c/f_bt;       % Wavelength (m)

% Calculations
Pr_bt = (P_t_bt * G_t * G_r * lamb_bt^2) ./ ((4 * pi * d_bt).^2);
Pr_bt_dB = 10 * log10(Pr_bt);

SINR_bt = Pr_bt ./ Pn;
SINR_bt_dB = 10 * log10(SINR_bt);

C_bt = BW_bt .* log2(1 + SINR_bt);
C_bt_dB = 10 * log10(C_bt);

% =========================================================================
% Task 3: Cellular Simulation (2G, GSM)
% =========================================================================
f_cell = 850*1e6;       % Frequency (Hz)
BW_cell = 200*1e3;      % Bandwidth (Hz)
d_cell = 100:100:5000;  % Distance (m)
P_t_cell = 40;          % Transmit Power (Watts)
lamb_cell = c/f_cell;   % Wavelength (m)

% Calculations
Pr_cell = (P_t_cell * G_t * G_r * lamb_cell^2) ./ ((4 * pi * d_cell).^2);
Pr_cell_dB = 10 * log10(Pr_cell);

SINR_cell = Pr_cell ./ Pn;
SINR_cell_dB = 10 * log10(SINR_cell);

C_cell = BW_cell .* log2(1 + SINR_cell);
C_cell_dB = 10 * log10(C_cell);

% =========================================================================
% Plotting Results (3x3 Grid)
% =========================================================================
figure('Name', 'Wireless Technologies Comparison', 'Position', [100, 100, 900, 700]);

% --- Row 1: Received Power (Pr) ---
subplot(3,3,1)
plot(d_wifi, Pr_wifi_dB); grid on;
title('WiFi'); ylabel('P_r (dB)'); xlim([0 100]);

subplot(3,3,2)
plot(d_bt, Pr_bt_dB); grid on;
title('Bluetooth'); xlim([0 10]);

subplot(3,3,3)
plot(d_cell, Pr_cell_dB); grid on;
title('Cellular'); xlim([0 5000]);

% --- Row 2: SINR ---
subplot(3,3,4)
plot(d_wifi, SINR_wifi_dB); grid on;
ylabel('SINR (dB)'); xlim([0 100]);

subplot(3,3,5)
plot(d_bt, SINR_bt_dB); grid on;
xlim([0 10]);

subplot(3,3,6)
plot(d_cell, SINR_cell_dB); grid on;
xlim([0 5000]);

% --- Row 3: Channel Capacity ---
subplot(3,3,7)
plot(d_wifi, C_wifi_dB); grid on;
xlabel('distance (m)'); ylabel('Capacity (dB)'); xlim([0 100]);

subplot(3,3,8)
plot(d_bt, C_bt_dB); grid on;
xlabel('distance (m)'); xlim([0 10]);

subplot(3,3,9)
plot(d_cell, C_cell_dB); grid on;
xlabel('distance (m)'); xlim([0 5000]);

% =========================================================================
% Task 4: Comparative Analysis Plots
% =========================================================================
figure('Name', 'Task 4: Comparative Analysis', 'Position', [150, 150, 1000, 350]);

% --- 1. Received Power Comparison ---
subplot(1,3,1);
semilogx(d_wifi, Pr_wifi_dB, 'b', 'LineWidth', 1.5); hold on;
semilogx(d_bt, Pr_bt_dB, 'r', 'LineWidth', 1.5);
semilogx(d_cell, Pr_cell_dB, 'k', 'LineWidth', 1.5);
grid on;
title('Received Power vs Distance');
xlabel('Distance (m) [Log Scale]');
ylabel('P_r (dB)');
legend('WiFi', 'Bluetooth', 'Cellular', 'Location', 'southwest');

% --- 2. SINR Comparison ---
subplot(1,3,2);
semilogx(d_wifi, SINR_wifi_dB, 'b', 'LineWidth', 1.5); hold on;
semilogx(d_bt, SINR_bt_dB, 'r', 'LineWidth', 1.5);
semilogx(d_cell, SINR_cell_dB, 'k', 'LineWidth', 1.5);
grid on;
title('SINR vs Distance');
xlabel('Distance (m) [Log Scale]');
ylabel('SINR (dB)');
legend('WiFi', 'Bluetooth', 'Cellular', 'Location', 'southwest');

% --- 3. Channel Capacity Comparison ---
subplot(1,3,3);
semilogx(d_wifi, C_wifi_dB, 'b', 'LineWidth', 1.5); hold on;
semilogx(d_bt, C_bt_dB, 'r', 'LineWidth', 1.5);
semilogx(d_cell, C_cell_dB, 'k', 'LineWidth', 1.5);
grid on;
title('Capacity vs Distance');
xlabel('Distance (m) [Log Scale]');
ylabel('Capacity (dB)');
legend('WiFi', 'Bluetooth', 'Cellular', 'Location', 'southwest');