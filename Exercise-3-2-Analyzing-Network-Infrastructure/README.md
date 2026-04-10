# Local Wi-Fi Network Analysis

## 1. Measurement Setup
**Objective:** To understand and analyze a local Wi-Fi network and its key performance and configuration parameters.
**Tools Used:** * Apple iPhone (iOS)
* Network Analyzer Pro (iOS Application)
* Speedtest.net (Web Interface)

**Methodology:** Data was collected while connected to a local home Wi-Fi network. Measurements for identity, hardware, and latency were gathered using the Network Analyzer application. Bandwidth testing was supplemented using Speedtest.net due to iOS application limitations.

---

## 2. Collected Data

### Network Identity & Hardware Details
* **SSID:** Hammad's Home
* **BSSID (MAC Address):** d8:44:89:29:de:2c
* **Router Vendor:** TP-Link Systems Inc
* **Security Type:** Personal (WPA2/WPA3)
* **Default Gateway IP:** 192.168.0.1
* **Device IP Address:** 192.168.0.105
* **Subnet Mask:** 255.255.255.0

> **Screenshot Evidence:**
> ![Network Info](./network.jpg)

### Performance Metrics
* **Download Speed:** 22.66 Mbps
* **Network Latency (Ping to Gateway):** Fluctuating between 5.3 ms and 48.7 ms.

> **Screenshot Evidence:**
> ![Speedtest](./speedtest.jpg)
> ![Ping Latency](./ping.jpg)

---

## 3. Analysis and Troubleshooting

Based on the collected data, the network connection is functional but shows signs of potential instability that could impact real-time applications (such as gaming or video conferencing).

**Identified Issues:**
* **Latency Fluctuations:** The Ping test to the default gateway (192.168.0.1) revealed inconsistent response times. While some packets returned in a healthy 5.3 ms to 8.9 ms, others spiked to 45.1 ms and 48.7 ms. In a healthy, localized Wi-Fi environment, pinging the router directly should yield a consistent latency of under 5-10 ms. 
* **Potential Network Congestion:** The latency spikes indicate that the router is either intermittently struggling to process requests (CPU load) or there is active wireless interference delaying the transmission of packets.
* **Bandwidth Limitations:** The download speed of 22.66 Mbps is sufficient for basic web browsing and HD streaming, but it may become a bottleneck if multiple devices are using the network simultaneously.

---

## 4. Final Recommendations and Conclusions

To improve the overall performance and stability of "Hammad's Home" network, I propose the following practical solutions:

1. **Address Channel Interference:** The latency spikes strongly suggest channel overlap with nearby Wi-Fi networks. Logging into the TP-Link router's admin panel and changing the operating channel to a less congested one (e.g., Channels 1, 6, or 11 for 2.4GHz bands) should stabilize the ping response times.
2. **Utilize the 5GHz Band:** If the router is dual-band and the iPhone is currently connected to the 2.4GHz band, switching to the 5GHz frequency band is highly recommended. This band offers significantly faster speeds and suffers from far less interference from neighboring networks and household appliances. 
3. **Router Repositioning:** To ensure optimal signal coverage and reduce the chance of packet loss causing latency spikes, the TP-Link router should be placed in a centralized, elevated location away from thick walls or metal obstructions.

**Conclusion:** While the network provides adequate baseline connectivity, the latency data highlights the invisible impact of wireless interference. By making minor configuration adjustments to the router's channels and frequency bands, the network's responsiveness can be significantly optimized.
