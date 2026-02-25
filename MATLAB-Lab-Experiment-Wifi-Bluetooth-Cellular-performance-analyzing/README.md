# Wireless Communication Performance Analysis

## Objective
This project analyzes and compares the communication performance of three major wireless technologies: **WiFi (IEEE 802.11b)**, **Bluetooth**, and **2G Cellular (GSM)**. The simulation calculates and visualizes how distance impacts received power, signal-to-noise ratio (SINR), and overall channel capacity for each standard.

## Repository Contents
* `MATLAB_Lab_Experiment.m`: The primary MATLAB script containing the simulation parameters, mathematical models (Friis Transmission Equation and Shannon-Hartley theorem), and plotting functions.
* `report.txt`: A brief analytical report summarizing the physical layer performance trends and the engineering trade-offs observed between the three technologies.
* `Comparative_Graph.png`: A screenshot of the comparative simulation results. *(Note: File name may vary)*

## Comparative Simulation Results
Below is the comparative analysis of WiFi, Bluetooth, and Cellular technologies over their respective operating distances (plotted on a logarithmic scale):

![Comparative Performance Graph]([Comparative_Graph.png])

## Key Findings
1. **Received Power & Path Loss:** All technologies demonstrate a logarithmic decay in received power over distance. Cellular maintains the highest power over long distances due to its massive 40W transmit power and 850 MHz frequency.
2. **Channel Capacity (Bandwidth is King):** WiFi achieves the highest overall channel capacity due to its wide 22 MHz bandwidth. Conversely, despite its high transmit power, 2G Cellular has the lowest capacity because it is bottlenecked by a narrow 200 kHz bandwidth. 
3. **Trade-offs:** * Cellular optimizes for massive range at the cost of data rates.
   * WiFi balances moderate range (100m) with high data capacity.
   * Bluetooth sacrifices both range and capacity to achieve extreme power efficiency (10 mW) for short-range personal device pairing.

## How to Run the Simulation
1. Ensure [MATLAB](https://www.mathworks.com/products/matlab.html) is installed.
2. Clone or download this repository.
3. Open `communication_assignment.m` and run the script to generate the performance plots.
