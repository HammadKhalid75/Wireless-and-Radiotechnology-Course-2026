% A3: Basic modulation by multiplication
% Student: <Hammad Khalid>
% Student ID: <s2416301>

clear; close all; clc;

%% 1) Time vector
Fs = 20000;
T  = 0.1;
t  = 0:1/Fs:T-1/Fs;

%% 2) Baseband and carrier
fm = 100;               % message frequency [Hz]
fc = 2000;              % carrier frequency [Hz]

m = sin(2*pi*fm*t);     % baseband (message)
c = cos(2*pi*fc*t);     % carrier

%% 3) Modulated signal (passband)
s = m .* c;

%% 4) FFT calculations
N = length(m);
M = fft(m);
S = fft(s);
f = (0:N-1)*(Fs/N);

halfN = floor(N/2);
f_half = f(1:halfN);

mag_m = abs(M(1:halfN));
mag_s = abs(S(1:halfN));

%% 5) Baseband Figure (Time + Spectrum)
figure;

% Baseband Time Domain
subplot(2,1,1);
plot(t*1000, m);
grid on;
xlabel('Time [ms]');
ylabel('Amplitude');
title('A3: Baseband m(t) - Time Domain');

% Baseband Spectrum
subplot(2,1,2);
plot(f_half, mag_m);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A3: Spectrum of Baseband m(t)');
xlim([0 1000]);

exportgraphics(gcf, 'A3_baseband.png', 'Resolution', 200);

%% 6) Passband Figure (Time + Spectrum)
figure;

% Passband Time Domain (zoom first 5 ms)
index = (t <= 0.005);
subplot(2,1,1);
plot(t(index)*1000, s(index));
grid on;
xlabel('Time [ms]');
ylabel('Amplitude');
title('A3: Passband s(t) - Time Domain');

% Passband Spectrum
subplot(2,1,2);
plot(f_half, mag_s);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A3: Spectrum of Modulated Signal s(t)');
xlim([0 5000]);


exportgraphics(gcf, 'A3_passband.png', 'Resolution', 200);
