% Initial Parameters
B = 1e6; % Bandwidth = 1 MHz
R = 100; % Resistance = 100 ohms
T = 300; % Temperature = 300 K
k = 1.38e-23; % Boltzmann constant

% Generate Thermal Noise
n_samples = 10000;
time = 0 : 1/B : (n_samples-1) / B;
thermal_noise = sqrt(4 * k * T * R * B) * randn(1, n_samples);

% 1. Plot generated noise in the time domain
figure;
subplot(2,1,1);
plot(time, thermal_noise);
title('Thermal Noise in Time Domain');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

% 2. Power Spectral Density (PSD) Analysis
[psd, freq] = pwelch(thermal_noise, [], [], [], B);

% Plot PSD
subplot(2,1,2);
semilogx(freq, 10*log10(psd));
title('Power Spectral Density (PSD)');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
grid on;