---
layout: post
title : "Gesture-Based Control"
subtitle: "Samsung Software Membership"
type: "PROJECTS"
projects: true
undergrad: true
list-img: true
text: true
author: "beenpow"
post-header: true
header-img: "https://nietm.in/wp-content/uploads/2022/12/AI.jpg"
main-img: "https://nietm.in/wp-content/uploads/2022/12/AI.jpg"
order: 1
date: "2015-10-09"
---

# Gesture-Based Control (FingerSnap)
**Samsung Software Membership**

---

## Summary
- **Goal:** Control devices without touching them by using finger snaps (FingerSnap) detected via smartphone microphone and FFT. IoT-style platform: connect “switch” buttons to the network and control them with audio.
- **Flow:** Phone recognizes snap pattern → sends command via Bluetooth/HTTP → PC runs macros (lock, PPT advance, login, webtoon scroll) or hardware (lights, locks) reacts.
- **Stack:** Android (sensor, UI, Bluetooth), Windows WPF (macros, lock, auto-login), Server (OAuth, user/hardware management), Core (FFT + band-pass for snap detection), Hardware (Arduino + Bluetooth + servo for physical switches).

---

<details>
<summary><strong>Project duration and schedule</strong></summary>
<ul>
<li><strong>Duration:</strong> 2015.10.09 – 2016.01.12</li>
<li><strong>Phase 1 (2015.10.09 – 11.08):</strong> Planning and environment setup</li>
<li><strong>Phase 2 (2015.11.09 – 12.08):</strong> Core logic and UI</li>
<li><strong>Phase 3 (2015.12.09 – 2016.01.09):</strong> Integration and debugging</li>
<li><strong>Environment:</strong> Android Studio, Visual Studio</li>
</ul>
</details>

---

## Purpose & background
- **IoT:** Objects get identity, connectivity, and control over a network (e.g. Smart Home, Smart Car). FingerSnap adds an IoT-style control layer using audio.
- **Idea:** Many products have physical switches; connect them to the network and control them with FingerSnap (no touch). Open-source API so others can plug in.

---

## Architecture

![img2](/img/ssm-03_img2.png)

- **Core:** FFT + band-pass filter libraries for snap detection; used by Android, Windows, and hardware.
- **Server:** OAuth, user IDs for registered hardware, permissions and grouping.
- **Android:** Mic input, frequency analysis, Bluetooth to hardware, HTTP to server; macro list and settings.
- **Windows (WPF):** Lock screen, PPT auto-advance, auto web login, webtoon scroll, user macros — triggered by FingerSnap from Android.
- **Hardware:** Receives commands from Android via Bluetooth; drives servos to actuate physical switches (lights, locks, etc.).

---

## Technology in brief
- **IoT:** Sensors and connectivity in objects; need security and scalable data handling.
- **Audio recognition:** FFT on smartphone mic; FingerSnap has three distinct patterns (thumb–middle, middle–palm, thumb–index) in a short window.
- **Smart Home / Smart Car:** Examples of IoT; FingerSnap fits into “control without touch” use cases.

---

## Development content

### Server
![img3](/img/ssm-03_img3.png)
- OAuth for app developers; user/hardware DB; permission and grouping. Demo and crowdfunding site planned.

![img4](/img/ssm-03_img4.png)
![img5](/img/ssm-03_img5.png)

### Core (FFT + snap detection)
![img6](/img/ssm-03_img6.png)
- FingerSnap pattern recognition via FFT; key enabler for remote control.

![img7](/img/ssm-03_img7.png)
![img8](/img/ssm-03_img8.png)
![img9](/img/ssm-03_img9.png)
- Three snap types; algorithm detects pattern from phone mic. Plan: improve to distinguish users. Core is open for customization.

### Android
![img10](/img/ssm-03_img10.png)
- Mic → recognize snap → send command to hardware or server.

![img11](/img/ssm-03_img11.png)
- Main screen: flip-style macro list; run by touch or snap.

![img12](/img/ssm-03_img12.png)
![img13](/img/ssm-03_img13.png)
- List view, lock-screen mode, button mode. Register product type (PC hardware or other), delegate permissions by phone number.

### Windows WPF
- **Main:** Icons for lock, PPT, auto-login, webtoon scroll, user macros.
- **Lock screen:** FingerSnap or password.
- **PPT:** Auto-advance slides with FingerSnap.
- **Auto login:** e.g. Naver login with FingerSnap.
- **Webtoon scroll:** Scroll with FingerSnap.
- **User macros:** Custom actions triggered by FingerSnap.

![img14](/img/ssm-03_img14.png)
![img15](/img/ssm-03_img15.png)
![img16](/img/ssm-03_img16.png)
![img17](/img/ssm-03_img17.png)
![img18](/img/ssm-03_img18.png)
![img19](/img/ssm-03_img19.png)

### Hardware
![img20](/img/ssm-03_img20.png)
![img21](/img/ssm-03_img21.png)
![img22](/img/ssm-03_img22.png)
- Bluetooth link to Android. MCU + servo per switch; controls lights, door locks, etc. via predefined protocol.

---

## Development budget (KRW)

<table class="bordered-table">
<thead>
<tr><th>No</th><th>Part Name</th><th>Purpose</th><th>Price (KRW)</th><th>Qty</th><th>Total (KRW)</th></tr>
</thead>
<tbody>
<tr><td>1</td><td>Arduino Pro Mini</td><td>MCU</td><td>12,000</td><td>5</td><td>60,000</td></tr>
<tr><td>2</td><td>USB Serial (FTDI-5V)</td><td>USB serial</td><td>17,000</td><td>2</td><td>34,000</td></tr>
<tr><td>3</td><td>USB for Serial</td><td>USB</td><td>1,500</td><td>2</td><td>3,000</td></tr>
<tr><td>4</td><td>Dymond D60 servo</td><td>Servo</td><td>36,500</td><td>2</td><td>73,000</td></tr>
<tr><td>5</td><td>KR-A2412BS-S1</td><td>Servo</td><td>30,800</td><td>1</td><td>30,800</td></tr>
<tr><td>6</td><td>KR-A410BS</td><td>Servo</td><td>19,800</td><td>1</td><td>19,800</td></tr>
<tr><td>7</td><td>HES-188 metal</td><td>Servo</td><td>14,520</td><td>3</td><td>43,560</td></tr>
<tr><td>8</td><td>HES-1188 metal</td><td>Servo</td><td>19,250</td><td>2</td><td>38,500</td></tr>
<tr><td>9</td><td>4xAA battery holder</td><td>Battery holder</td><td>2,800</td><td>3</td><td>8,400</td></tr>
<tr><td>10</td><td>Alkaline AA 1.5V</td><td>Battery</td><td>600</td><td>12</td><td>7,200</td></tr>
<tr><td>11</td><td>HC-06 (DIP)</td><td>Bluetooth</td><td>13,000</td><td>3</td><td>39,000</td></tr>
<tr class="bordered-table-total"><td colspan="5"><strong>Total</strong></td><td><strong>357,260</strong></td></tr>
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
.bordered-table-total td {
  background: #f1f5f9;
  font-weight: 600;
}
</style>

---

## References
- Apache Core Guide (Ben Laurie, Peter Laurie)
- WPF (Charles Petzold, tr. Se-Young Choi et al.)
- [WPF Blog](http://dotnetmvp.tistory.com/category/WPF)
