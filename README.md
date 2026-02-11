# Frequency Isolation Filter Design

This repository provides the design specifications for isolating specific frequency components from a composite signal using various analog filter types.

## Signal Model

the input signal consists of four distinct sine waves:

$$V_{in}(t) = \sum_{n=1}^{4} A_n \sin(2\pi f_n t)$$

Where $f = \{100, 200, 300, 400\}\text{ Hz}$.

## Filter Design Specifications

The table below defines the filter type and cutoff parameters required to isolate the desired frequency components.

| Frequency Component(s) | Filter Type | Cutoff Frequency/Frequencies |
| :--- | :--- | :--- |
| **100 Hz** | Low Pass Filter (LPF) | 150 Hz |
| **400 Hz** | High Pass Filter (HPF) | 350 Hz |
| **100 Hz and 200 Hz** | Low Pass Filter (LPF) | 250 Hz |
| **200 Hz** | Band Pass Filter (BPF) | 150 Hz - 250 Hz |
| **300 Hz** | Band Pass Filter (BPF) | 250 Hz - 350 Hz |
| **300 Hz and 400 Hz** | High Pass Filter (HPF) | 250 Hz |
| **200 Hz and 300 Hz** | Band Pass Filter (BPF) | 150 Hz - 350 Hz |
| **200 Hz, 300 Hz, and 400 Hz** | High Pass Filter (HPF) | 150 Hz |
| **100 Hz and 400 Hz** | Band Stop Filter (BSF) | 150 Hz - 350 Hz |



## Implementation Notes

* **Cutoff Logic:** Cutoff frequencies are placed at the midpoint between the desired component and the nearest unwanted component to ensure maximum attenuation of noise.
* **Filter Order:** For sharp isolation, a higher-order filter (e.g., Butterworth or Chebyshev) is recommended to minimize signal overlap.
* **Band Stop Utility:** The Band Stop (or Notch) filter is utilized specifically for the "100 Hz and 400 Hz" requirement to eliminate the middle 200 Hz and 300 Hz interference.

---
