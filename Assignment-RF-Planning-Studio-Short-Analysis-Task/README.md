# RF Planning Studio: Link Feasibility Evaluation

## Overview
This repository contains the evaluation of a wireless RF link. By modifying key design parameters in a MATLAB simulation, we observe their direct effects on coverage distance, received power, and Fresnel zone clearance.

## Simulation Plot
![RF Planning: Impact of Gain and Environment](Screenshot_3.png)

---

## 1️⃣ Increase Gateway Height by +5 m

* **Does maximum LOS distance change?** Yes. The maximum Line of Sight (LOS) distance increases from approximately 21.1 km to 23.2 km.
* **Does link feasibility improve significantly?** In the strict terms of the log-distance path loss model used here, the improvement is mathematically marginal. However, in reality, it significantly improves physical link feasibility.
* **Why?** The optical horizon is governed by the formula $d_{max} \approx 3.57(\sqrt{h_{tx}} + \sqrt{h_{rx}})$. Increasing the gateway height allows the signal to travel further before the Earth's curvature or local ground clutter obstructs the direct path, ensuring much better physical clearance.

## 2️⃣ Increase Antenna Gain to 5 dBi

* **How does the received power curve change?** The received power curve shifts vertically upward by 6 dB across all distances compared to the baseline.
* **How much additional range is achieved?** The effective range (where the signal stays above the -120 dBm sensitivity limit) is extended significantly, increasing from roughly 6.5 km to well over 10 km.
* **Why does antenna gain extend coverage?** Antenna gain does not create new power; it focuses the existing radiated energy into a more directed beam toward the horizon. By increasing both the transmitter and receiver gain to 5 dBi, the total system gains 6 dB, which increases the power density at the receiving end and extends the usable range.


## 3️⃣ Change Environment Exponent (n)

* **How does increasing n affect coverage?** Increasing n from 2.7 to 3.5 causes a much steeper downward slope in the received power curve over distance. The signal hits the sensitivity limit much earlier (around 3.5 km).
* **Which has a stronger impact on range: gain increase or environment change?** The environment exponent (n) has a drastically stronger impact on range than the antenna gain increase.
* **Explain physically:** The path loss exponent represents the density and physical clutter of the environment. In a clear environment, signals spread predictably. In a dense environment (n = 3.5 or higher), radio waves suffer from severe absorption, reflection, and multipath scattering. Because this loss scales exponentially with distance, it quickly overwhelms static hardware gains.

## 4️⃣ Move Gateway Location (Fresnel Study)

* **Where is Fresnel radius largest?** The Fresnel radius is at its absolute maximum at the exact midpoint of the link (0.5D).
* **Why is the midpoint usually critical?** The 3D shape of a Fresnel zone is an ellipsoid (similar to a football). Mathematically, the distance from the central Line of Sight axis to the outer edge of the zone is widest exactly halfway between the transmitter and receiver, making it the most vulnerable point for obstacles to encroach.

* **What happens if the clearance rule (60%) is violated?** If an obstacle blocks more than 40% of the first Fresnel zone (violating the 60% clearance rule), the link suffers from diffraction loss. The obstacle interferes with the electromagnetic wave fronts, severely degrading signal strength even if you have visual line of sight to the other antenna.

---

## Final Conclusion
This evaluation demonstrates that reliable RF link design requires balancing controllable hardware specifications with unforgiving environmental physics. While upgrading antenna gain provides a straightforward linear boost to the link budget, the environment's path loss exponent (n) is the dominant factor, capable of exponentially degrading coverage. Furthermore, a mathematically positive link budget is useless without physical Fresnel clearance. Managing antenna height to avoid midpoint obstacles and mitigate diffraction loss is ultimately what dictates whether a deployed sensor remains online or goes dark.
