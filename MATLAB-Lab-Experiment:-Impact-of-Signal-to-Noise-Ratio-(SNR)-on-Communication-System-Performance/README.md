## Objective
This repository contains a MATLAB simulation designed to investigate how varying Signal-to-Noise Ratio (SNR) affects the demodulation performance of a communication system. By simulating real-world noise conditions, this project provides insights into the impact of noise on received and demodulated signals, highlighting the trade-offs involved in communication system design.

## Simulation Parameters
* **Sampling frequency (fs):** 1000 Hz
* **Carrier frequency (fc):** 50 Hz
* **Time vector:** 1 second duration
* **SNR values tested:** 10 dB, 5 dB, 0 dB, and -5 dB
* **Modulation Scheme:** Amplitude Shift Keying (ASK)
* **Noise Type:** Additive White Gaussian Noise (AWGN)

## How It Works
1.  **Message Generation:** A random binary message signal is generated at a specific bit rate to simulate digital data.
2.  **Modulation:** The binary signal is modulated using Amplitude Shift Keying (ASK).
3.  **Noise Addition:** Gaussian white noise is added to the modulated signal at four different SNR levels to simulate real-world transmission interference.
4.  **Demodulation:** The noisy signals are coherently demodulated by mixing with the carrier, passed through a low-pass filter to extract the envelope, and thresholded to recover the original binary data.
5.  **Visualization:** The script generates subplots comparing the original modulated signal, the noisy received signal, and the final demodulated output against the original message for each SNR value.

## Results and Observations
As the SNR decreases from 10 dB down to -5 dB, the AWGN heavily distorts the received signal's amplitude envelope. 
* **High SNR (10 dB, 5 dB):** The noise floor is low enough that the low-pass filter and thresholding successfully recover the original message with zero or minimal bit errors.
* **Low SNR (0 dB, -5 dB):** The noise amplitude frequently exceeds the carrier amplitude. The demodulator begins to misinterpret noise spikes as logic '1's or signal depressions as logic '0's, leading to a high Bit Error Rate (BER) and eventual communication failure.



*(Note: To display your specific local plot on GitHub, save your MATLAB figure as `results.png` in the repository folder and replace the above tag with standard markdown: `![Demodulation Results](results.png)`)*

## Usage
1. Open MATLAB or Octave.
2. Open the `impact_of_Signal.m` script file containing the code.
3. Run the script.
4. A figure window will automatically generate showing the 4x3 grid of subplots detailing the simulation results.
