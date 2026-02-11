% noise_simulation.m

% Parameters
fs = 1000; % Sampling frequency in Hz
t = 0:1/fs:1; % Time vector
f_signal = 5; % Frequency of the sinusoidal signal in Hz
amplitude = 1; % Amplitude of the sinusoidal signal

% Generate Sinusoidal Signal
original_signal = amplitude * sin(2 * pi * f_signal * t);

% Add Gaussian White Noise
noise_level = 0.5; % Standard deviation of the noise
noisy_signal = original_signal + noise_level * randn(size(t));

% Remove Noise Using a Low-pass Filter
cutoff_frequency = 10; % Default cutoff in Hz
nyquist = fs / 2;
Wn = cutoff_frequency / nyquist; % Normalized cutoff frequency
filter_order = 4; 

% Create Butterworth filter
[b, a] = butter(filter_order, Wn, 'low');

% Apply zero-phase digital filtering to avoid phase distortion
filtered_signal = filtfilt(b, a, noisy_signal);

% Plot Original and Noisy Signals
figure;

subplot(3, 1, 1);
plot(t, original_signal, 'LineWidth', 1.5);
title('Original Sinusoidal Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3, 1, 2);
plot(t, noisy_signal);
title('Signal with Gaussian White Noise');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot Filtered Signal
subplot(3, 1, 3);
plot(t, filtered_signal, 'LineWidth', 1.5, 'Color', 'r');
title('Filtered Signal (Low-pass Butterworth)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;