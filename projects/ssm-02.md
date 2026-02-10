---
layout: post
title : "Web & Native App Communication Program"
subtitle: "Samsung Software Membership"
type: "PROJECTS"
projects: true
undergrad: true
list-img: true
text: true
author: "beenpow"
post-header: true
header-img: "https://i.guim.co.uk/img/media/d059b58efe8ce50d15639f76448becdeec69bc9b/0_184_7200_4320/master/7200.jpg?width=1200&quality=85&auto=format&fit=max&s=d7659f8cde3870d1724610565247623e"
main-img: "https://i.guim.co.uk/img/media/d059b58efe8ce50d15639f76448becdeec69bc9b/0_184_7200_4320/master/7200.jpg?width=1200&quality=85&auto=format&fit=max&s=d7659f8cde3870d1724610565247623e"
order: 1
date: "2015-07-18"
---

# Web & Native App Communication Program
**Samsung Software Membership**

---

## Summary
- **Product name:** Tile Platform + Mosaic System (STILER / STILERS).
- **Goal:** Real-time, cross-platform text editing so multiple users can edit the same document at once (like Google Docs), with a simpler flow than existing note apps.
- **Concept:** Text blocks = “Tiles”; a document = “Mosaic”. Auto-documentation algorithm arranges Tiles into documents. Quick start via beacon so you can join a “room” by proximity.
- **Platforms:** Windows (WPF), macOS, Android, iOS. Beacon (e.g. RECO) used to auto-suggest room by location.
- **Tech:** Operational Transformation (OT) for conflict-free concurrent editing, MVC, Node.js (ShareJS), Cocoa, .NET/WPF, Cordova.

---

<details>
<summary><strong>Project duration and schedule</strong></summary>
<ul>
<li><strong>Duration:</strong> 2015.07.18 – 2015.12.15</li>
<li><strong>Kick-off:</strong> 2015.07.18</li>
<li><strong>Mid-term:</strong> 2015.10.20</li>
<li><strong>Completion:</strong> 2015.12.10</li>
<li><strong>Final submission:</strong> 2015.12.15</li>
</ul>
</details>

---

## Development environment
- **OS:** Windows 7, Ubuntu 14.04, Mac OS
- **Tools:** Eclipse, Android Studio, Coda2, Visual Studio
- **Languages:** Java, JavaScript, C++, HTML, CSS3, XML
- **Frameworks:** Cocoa (Xcode), .NET (WPF), Cordova

---

## Architecture

### System
![img2](/img/ssm-02_img2.png)

### Software
![img3](/img/ssm-02_img3.png)

### Tile
![img4](/img/ssm-02_img4.png)

---

## Goals (weighted)

<table class="bordered-table">
<thead>
<tr><th>Goal</th><th>Weight</th></tr>
</thead>
<tbody>
<tr><td>Cross-platform Tile (Desktop + Mobile)</td><td>20</td></tr>
<tr><td>Mosaic algorithm error-free</td><td>20</td></tr>
<tr><td>Real-time async (OT, data integrity)</td><td>20</td></tr>
<tr><td>Open-source and developer ecosystem</td><td>30</td></tr>
<tr><td>New UX/UI</td><td>5</td></tr>
<tr><td>Practical service</td><td>5</td></tr>
</tbody>
</table>

---

## Background (short)
- Many note apps (OneNote, Evernote, etc.) have heavy UIs and long flows to start writing.
- This project: minimal UI, instant notepad, real-time co-editing across platforms, optional auto-documentation (Mosaic). Rooms for shared editing; beacons to suggest room by location.

---

## Tech in brief
- **Operational Transformation (OT):** Keeps concurrent edits consistent (e.g. ShareJS on Node.js).
- **Cross-platform:** Same app concept on Windows, Mac, Android, iOS; native where it matters.
- **MVC:** Model (data/logic), View (I/O), Controller (flow).
- **WPF:** XAML + .NET for Windows desktop UI.

---

## Development content (by platform)

### Mac OS X
- Login/sign-up, terms agreement, welcome screen. App can sit in the menu bar for quick start.
- “Start” opens a notepad; “#” = room ID. Enter room number + “Go” to co-edit with others in that room.
- Room management and permissions. UI aligned with Android/iOS for consistency.

![img7](/img/ssm-02_img7.png)
![img8](/img/ssm-02_img8.png)
![img9](/img/ssm-02_img9.png)
![img10](/img/ssm-02_img10.png)
![img11](/img/ssm-02_img11.png)
![img12](/img/ssm-02_img12.png)
![img13](/img/ssm-02_img13.png)
![img14](/img/ssm-02_img14.png)

### Windows WPF
![img15](/img/ssm-02_img15.png)
- STILERS launch screen and desktop app entry.

### Android & iOS
- Same flow: logo, sign-up with terms, login, main activity. Quick notepad, room join, tile list.
- List view with “Quick Address ID,” “Remove from List,” “Options.” Flip-style UI for tile list.

![img16](/img/ssm-02_img16.png)
![img17](/img/ssm-02_img17.png)
![img18](/img/ssm-02_img18.png)
![img19](/img/ssm-02_img19.png)
![img20](/img/ssm-02_img20.png)

### Beacon
- RECO beacon: device measures RSSI; when close, app suggests the room for that space (e.g. meeting room). Far from beacon = normal app; near beacon = room number / doc management offered.

![img21](/img/ssm-02_img21.png)
![img22](/img/ssm-02_img22.png)
![img23](/img/ssm-02_img23.png)

---

## Glossary

<table class="bordered-table">
<thead>
<tr><th>Term</th><th>Description</th></tr>
</thead>
<tbody>
<tr><td>WPF</td><td>Windows Presentation Foundation; DirectX and XAML UI.</td></tr>
<tr><td>Cross-platform</td><td>Same app runs on multiple OSes.</td></tr>
<tr><td>OT</td><td>Operational Transformation; syncs concurrent edits.</td></tr>
<tr><td>Cordova</td><td>JavaScript/HTML/CSS apps with access to device APIs.</td></tr>
</tbody>
</table>

---

## References
- pyrasis.com – Using Node.js
- "Apache Core Guide" by Ben Laurie, Peter Laurie

---

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
