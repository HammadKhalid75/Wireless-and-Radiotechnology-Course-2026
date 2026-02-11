% Parameters
fs = 1000; % Sampling frequency in Hz
t = 0:1/fs:1; % Time vector
f_c = 50; % Carrier frequency in Hz

SNR_value_1 = 10; % SNR value in dB
SNR_value_2 = 5;  % SNR value in dB
SNR_value_3 = 0;  % SNR value in dB
SNR_value_4 = -5; % SNR value in dB

snr_array = [SNR_value_1, SNR_value_2, SNR_value_3, SNR_value_4];

% Generate a binary message signal
% (Using a lower bit rate for proper ASK visualization instead of a bit per sample)
bit_rate = 10; 
bits = randi([0 1], 1, bit_rate);
message_signal = repelem(bits, ceil(length(t)/length(bits)));
message_signal = message_signal(1:length(t));

% Modulation: Amplitude Shift Keying (ASK)
carrier = cos(2*pi*f_c*t);
modulated_signal = message_signal .* carrier;

figure('Name', 'ASK Demodulation Performance vs SNR', 'Position', [100, 100, 1200, 800]);

for i = 1:length(snr_array)
    current_snr = snr_array(i);
    
    % Add Noise
    received_signal = awgn(modulated_signal, current_snr, 'measured');
    
    % Demodulation: Coherent Detection
    mixed_signal = received_signal .* carrier;
    
    % Low-pass filter to extract envelope
    [b, a] = butter(5, (f_c * 0.8) / (fs / 2), 'low');
    filtered_signal = filtfilt(b, a, mixed_signal);
    
    % Thresholding to recover binary message
    demodulated_signal = filtered_signal > 0.25; 

    % Plotting Modulated Signal
    subplot(4, 3, (i-1)*3 + 1);
    plot(t, modulated_signal);
    title('Original Modulated Signal');
    xlabel('Time (s)'); ylabel('Amplitude');
    axis([0 1 -1.5 1.5]);
    
    % Plotting Received Signal (Noisy)
    subplot(4, 3, (i-1)*3 + 2);
    plot(t, received_signal);
    title(sprintf('Received Signal (SNR = %d dB)', current_snr));
    xlabel('Time (s)'); ylabel('Amplitude');
    
    % Plotting Demodulated Signal
    subplot(4, 3, (i-1)*3 + 3);
    plot(t, demodulated_signal, 'LineWidth', 1.5);
    hold on;
    plot(t, message_signal, '--r', 'LineWidth', 1);
    title('Demodulated vs Original');
    xlabel('Time (s)'); ylabel('Logic Level');
    legend('Demodulated', 'Original Message');
    axis([0 1 -0.5 1.5]);
    hold off;
end