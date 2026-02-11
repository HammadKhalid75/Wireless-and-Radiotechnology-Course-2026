
# Short Answers (Lecture-2)

## Q1
The time domain illustrates how a signal's amplitude changes continuously over a period of time, revealing the physical shape of the waveform. The frequency domain breaks that same signal down into its constituent sine waves, showing the magnitude of each individual frequency component. While the time domain is useful for viewing signal timing and duration, the frequency domain is essential for identifying specific frequency tones and the overall bandwidth of the signal.

## Q2
Filtering is crucial in RF receivers because an antenna captures a vast amount of electromagnetic energy across many frequencies, including noise and interfering signals. A filter isolates the specific desired frequency band while attenuating everything outside of it. This significantly improves the signal-to-noise ratio, prevents stronger adjacent signals from overwhelming the receiver's amplifier, and allows the system to process only the intended communication channel.

## Q3
Modulation translates a low-frequency baseband signal (such as audio or digital data) to a higher frequency passband signal by varying a property of a high-frequency carrier wave. This achieves several key requirements for RF systems: it allows the use of practically sized antennas, enables multiple signals to be transmitted simultaneously over the same medium using different carrier frequencies (Frequency Division Multiplexing), and helps the signal travel longer distances with less degradation.

## Q4
The Low-Pass Filter (LPF) used to isolate the 500 Hz tone was the easiest to design. Because 500 Hz is the lowest frequency in the composite signal, isolating it only requires setting a single cutoff threshold (e.g., 550 Hz) to reject all higher frequencies. Designing a Bandpass Filter (BPF) to isolate a middle frequency like 600 Hz is slightly more complex as it requires carefully defining and tuning two precise cutoff points (upper and lower bounds) to reject frequencies on both sides.

## Q5
After modulating the baseband signal with the carrier via multiplication, the energy shifts from the baseband frequency to surround the carrier frequency. The new components appear as an upper sideband and a lower sideband. Specifically, using a carrier frequency ($f_c$) of 2000 Hz and a message frequency ($f_m$) of 100 Hz, the new frequency components appear at $f_c + f_m$ and $f_c - f_m$, which correspond to exactly 2100 Hz and 1900 Hz in the frequency spectrum.
