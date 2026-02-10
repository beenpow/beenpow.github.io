---
layout: post
title : "Wireless USB Adapter for Wired Devices"
subtitle: "Samsung Software Membership"
type: "PROJECTS"
projects: true
undergrad: true
list-img: true
text: true
author: "beenpow"
post-header: true
header-img: "https://images.ctfassets.net/2htm8llflwdx/1LEJIT9KGRC4nwTJ5vuS6H/a912e31c468fd32986f2818816135cc4/OnlineLearning_SouthAsia_Learning_Indoor_GettyImages-1071652068.jpg"
main-img: "https://images.ctfassets.net/2htm8llflwdx/1LEJIT9KGRC4nwTJ5vuS6H/a912e31c468fd32986f2818816135cc4/OnlineLearning_SouthAsia_Learning_Indoor_GettyImages-1071652068.jpg"
order: 1
date: "2014-10-01"
---

# Wireless USB Adapter for Wired Devices
**Samsung Software Membership**

---

## Summary
- **Goal:** Turn existing wired keyboards and mice into wireless devices via a dongle, without buying new peripherals.
- **Approach:** Two dongles per set (keyboard + mouse). Each dongle has battery, Bluetooth module, and USB host chip (VNC1L). Data is sent to a PC dongle (Atmega128 + V-USB) that appears as HID keyboard and mouse.
- **Stack:** C/C++, Qt (key-setting GUI), Linux device driver, AVR firmware. Zigbee was tried first; switched to Bluetooth for lower latency (Zigbee 30–50 ms was too slow for real-time input).

---

<details>
<summary><strong>Project duration and environment</strong></summary>
<ul>
<li><strong>Duration:</strong> 2014.10 – 2015.03</li>
<li><strong>OS:</strong> Linux Ubuntu 14.04 LTS, Windows 7</li>
<li><strong>Languages:</strong> C / C++</li>
<li><strong>Tools:</strong> Qt Creator, GCC, AVR Studio</li>
</ul>
</details>

---

## Background & purpose
- Wired keyboards and mice are limited by cable length and placement; wireless versions cost more.
- This project adds a small adapter between existing wired devices and the PC so they work like wireless ones, using Bluetooth for low latency and reasonable cost.

---

## System architecture

![img1](/img/ssm-01_img1.png)

- Each input device (keyboard, mouse) has a dongle with an MCU.
- MCU sends input data to the PC dongle over Bluetooth.
- PC dongle runs firmware (V-USB) and is recognized as one HID keyboard and one HID mouse.
- Qt-based key-setting app lets users assign shortcut keys and map them to programs (Linux).

---

## Hardware

### PC dongle
![img3](/img/ssm-01_img3.png)
- Atmega128 as USB device (V-USB). Two Bluetooth modules receive data from keyboard and mouse dongles.
- PC sees one HID keyboard and one HID mouse. Case designed in CATIA and 3D-printed.

### Mouse dongle
![img4](/img/ssm-01_img4.png)
- VNC1L (FTDI) as USB host: reads USB mouse data and sends it to the PC dongle via UART + Bluetooth.
- Case: CATIA + 3D printer.

### Keyboard dongle
![img5](/img/ssm-01_img5.png)
- Same idea as mouse; VNC1L needs external AT commands for monitor mode, so an extra MCU is used to send those commands.

### Assembly (concept)
![img2](/img/ssm-01_img2.png)
- Keyboard and mouse each plug into their own dongle; portable battery powers them. PC dongle plugs into a USB port. Pairing takes about 5–10 seconds.

---

## Software: key-setting interface (Qt)

- GUI built with Qt: virtual keyboard and mouse buttons; user composes key combinations and ties them to programs (e.g. shortcut to run an app).
- **Flow:** Click virtual keys → combination appears in a text area → choose a program from a list (or add one) → “Exchange and ResetText” saves the mapping and clears for the next one.
- Screenshots below: main window, combination builder, program list, and registered shortcuts.

![img6](/img/ssm-01_img6.png)
![img7](/img/ssm-01_img7.png)
![img8](/img/ssm-01_img8.png)
![img9](/img/ssm-01_img9.png)
![img10](/img/ssm-01_img10.png)
![img11](/img/ssm-01_img11.png)
![img12](/img/ssm-01_img12.png)
![img13](/img/ssm-01_img13.png)
![img14](/img/ssm-01_img14.png)

---

## Development budget (KRW)

<table class="bordered-table">
<thead>
<tr><th>No</th><th>Part Name</th><th>Purpose</th><th>Price (KRW)</th><th>Qty</th><th>Total (KRW)</th></tr>
</thead>
<tbody>
<tr><td>1</td><td>FZ755AC</td><td>Data transmission</td><td>44,000</td><td>4</td><td>172,000</td></tr>
<tr><td>2</td><td>VNC1L Board</td><td>USB host</td><td>38,000</td><td>2</td><td>76,000</td></tr>
</tbody>
</table>

<style>
.bordered-table {
  width: 100%;
  border-collapse: collapse;
  margin: 12px 0;
  font-size: 15px;
}
.bordered-table th,
.bordered-table td {
  border: 1px solid #e2e8f0;
  padding: 10px 14px;
  text-align: left;
}
.bordered-table th {
  background: #f8fafc;
  font-weight: 600;
  color: #334155;
}
.bordered-table tbody tr:nth-child(even) {
  background: #fafafa;
}
</style>
