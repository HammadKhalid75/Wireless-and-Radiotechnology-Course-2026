% A2: Filtering a multi-tone signal
% Student: <Hammad Khalid>
% Student ID: <s2416301>

clear; close all; clc;

%% 1) Create time vector
Fs = 10000;               
T  = 0.2;                 
t  = 0:1/Fs:T-1/Fs;       

%% 2) Create Vin(t)
Vin = 10*sin(2*pi*500*t) ...
    + 5*sin(2*pi*600*t)  ...
    + 3*sin(2*pi*700*t)  ...
    + 5*sin(2*pi*800*t);

%% 3) FFT BEFORE filtering
N = length(Vin);
X = fft(Vin);
f = (0:N-1)*(Fs/N);

halfN = floor(N/2);
f_half = f(1:halfN);
mag_before = abs(X(1:halfN));

figure;
plot(f_half, mag_before);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A2: Spectrum BEFORE filtering');
xlim([0 1200]);
exportgraphics(gcf, 'A2_before.png', 'Resolution', 200);

%% 4) Apply Butterworth Low-Pass Filter (LPF) to isolate 500 Hz
cutoff = 550; % Hz
order = 10;   % High order for sharp cutoff

% Design and apply Butterworth filter as per assignment instructions
[b, a] = butter(order, cutoff/(Fs/2), 'low');
y_filtered = filtfilt(b, a, Vin); 

X_after = fft(y_filtered);
mag_after = abs(X_after(1:halfN));

figure;
plot(f_half, mag_after);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A2: AFTER LPF (target ~500 Hz)');
xlim([0 1200]);
exportgraphics(gcf, 'A2_after_500.png', 'Resolution', 200);