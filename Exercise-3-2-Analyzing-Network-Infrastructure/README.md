# Local Wi-Fi Network Analysis

## 1. Measurement Setup
* **Tool Used:** Network Analyzer Pro (iOS)
* **Device:** iOS Mobile Device
* **Measurement Location:** Static (Single point of capture)

## 2. Collected Data
*(Note: Several parameters read "N/A" due to iOS privacy restrictions blocking the app from reading specific Wi-Fi hardware data without precise location permissions enabled.)*

* **Network Speed and Latency:** Not captured in the provided static scan.
* **Router and Gateway Details:**
    * **Default Gateway IP:** 10.211.31.254
    * **DNS Server IP:** 10.212.26.102, 10.212.26.104
* **Local Device Details:**
    * **IP Address:** 10.211.20.88
    * **Subnet Mask:** 255.255.240.0
    * **IPv6 Address:** fe80::480:f22b:843b:83db / 64
* **SSID and BSSID:** N/A 
* **Operating Channel:** N/A
* **Security Type:** N/A
* **Nearby Wi-Fi Networks:** N/A 

**Attached Screenshot:**
*(Upload `4.jpg` to your GitHub repository and link it here)*
`![Network Analyzer Data](4.jpg)`

## 3. Analysis and Troubleshooting Discussion
* **Data Visibility Issue:** The primary issue identified is the inability to view specific Wi-Fi metrics (SSID, BSSID, Channel, Signal Strength). iOS restricts this data for third-party apps unless specific location permissions are granted. This prevents a full analysis of channel overlap or interference.
* **Network Addressing:** The network utilizes a `/20` subnet (`255.255.240.0`), indicating a large internal network capacity (up to 4094 usable hosts), which is typical for enterprise, campus, or large organizational environments rather than a standard home network. This scale increases the likelihood of network congestion.
* **Potential Coverage Issues:** In large environments using a `/20` subnet, weak signal coverage and suboptimal access point placement are common issues as users move between building zones.

## 4. Final Recommendations and Conclusions
1.  **Security and Configuration Adjustments:** To complete a full RF analysis, navigate to iOS Settings > Privacy & Security > Location Services, and ensure the Network Analyzer app has "Precise Location" enabled to expose SSID, BSSID, and Channel data.
2.  **Channel Changes:** Once channel visibility is restored, perform a LAN scan. If the current operating channel overlaps significantly with nearby networks, reconfigure the access points to utilize non-overlapping channels (e.g., channels 1, 6, 11 for 2.4GHz bands).
3.  **Router/Access Point Repositioning:** If latency spikes or signal drops occur when physically moving through the location, conduct a secondary physical survey to identify dead zones. Relocate access points to central, unobstructed areas to improve line-of-sight and overall signal strength.
4.  **Frequency Band Utilization:** Ensure band steering is enabled on the network so capable devices are automatically pushed to the 5GHz or 6GHz bands, alleviating congestion on the heavily trafficked 2.4GHz band.
