% A1: Time domain and frequency components (FFT)
% Student: <Hammad Khalid>
% Student ID: <s2416301>

clear; close all; clc;

%% 1) Create time vector
Fs = 10000;               % sampling frequency (samples per second)
T  = 0.05;                % duration in seconds (50 ms)
t  = 0:1/Fs:T-1/Fs;       % time vector

%% 2) Create the signal Vin(t) in mV
Vin = 10*sin(2*pi*500*t) ...
    + 5*sin(2*pi*600*t)  ...
    + 3*sin(2*pi*700*t)  ...
    + 5*sin(2*pi*800*t);

%% 3) Plot time domain (first 10 ms)
t_ms = t * 1000;          % convert seconds to milliseconds
index = (t_ms <= 10);     % show only 0..10 ms

figure;
plot(t_ms(index), Vin(index));
grid on;
xlabel('Time [ms]');
ylabel('Amplitude [mV]');
title('A1: Time Domain of V_{in}(t)');

% save figure
exportgraphics(gcf, 'Al_time.png', 'Resolution', 200);

%% 4) FFT (frequency analysis)
N = length(Vin);          % number of samples
X = fft(Vin);             % FFT result (complex values)

% Calculate Magnitude and Frequency Axis
mag = abs(X) / (N/2);     % Normalize magnitude
f = (0:N-1) * (Fs/N);     % Frequency vector

figure;
% Plot only the positive frequencies up to 1500 Hz for clarity
plot(f, mag);
xlim([0 1500]);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude [mV]');
title('A1: Frequency Domain (FFT)');

% save figure
exportgraphics(gcf, 'Al_spectrum.png', 'Resolution', 200);