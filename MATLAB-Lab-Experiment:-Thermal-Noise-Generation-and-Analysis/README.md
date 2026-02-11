
# Thermal Noise Simulation and Analysis

## Objective
To simulate and analyze thermal noise using MATLAB, visualizing its characteristics in both the time domain and frequency domain via Power Spectral Density (PSD) analysis.

## Prerequisites
* MATLAB
* Signal Processing Toolbox (required for the `pwelch` function)

## Usage
1. Clone this repository to your local machine.
2. Open the main MATLAB script (e.g., `thermal_noise.m`).
3. Run the script to generate the simulation and display the plots.

## Default Parameters
* **Bandwidth (B):** 1 MHz
* **Resistance (R):** 100 ohms
* **Temperature (T):** 300 K
* **Boltzmann Constant (k):** $1.38 \times 10^{-23}$ J/K

## Simulation Results

![Thermal Noise Simulation Results](Screenshot_3.png)

## Observations & Results
* **Time Domain Analysis:** The script generates Additive White Gaussian Noise (AWGN). The amplitude varies randomly with a zero mean, and voltage peaks are proportional to $\sqrt{4kTRB}$.
* **PSD Analysis:** The power spectral density remains constant across the frequency spectrum, confirming the uniform distribution of noise power.
* **Parameter Experimentation:**
  * **Bandwidth:** Modifying bandwidth alters the total noise variance in the time domain while maintaining a constant PSD level.
  * **Resistance & Temperature:** Increasing either parameter raises both the time-domain noise amplitude and the constant power level in the PSD plot.
