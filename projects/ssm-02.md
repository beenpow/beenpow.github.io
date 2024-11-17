---
layout: post
title : "Web & Native App Communication Program"
subtitle: "Samsung Software Membership"
type: "PROJECTS"
projects: true
undergrad: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2015-07-18"
---

- Project : Wireless USB Adapter for Wired Devices
- 2015.07.18 - 2015.12.15
- Samsung Software Membership

# Web & Native App Communication Program

## 1. Project Duration
2015.07.18 - 2015.12.15

## 2. Purpose and Motivation
This project started from the question, "If you need to record something immediately, which app would you run among the existing note and memo apps?" With this motivation, the project was planned to create a new real-time text writing program and document composition.

## 3. Development Environment
- **Operating Systems:** Windows 7, Ubuntu 14.04
- **Development Tools:** Eclipse, Android Studio, Coda2, Visual Studio

## 4. Development Schedule
- **2015.07.18:** Kick-off Seminar
- **2015.10.20:** Mid-term Seminar
- **2015.12.10:** Completion Seminar
- **2015.12.15:** Final Submission and Completion

The project developed a cross-platform real-time asynchronous editing program with permissions and automatic documentation features named Tile Platform and Mosaic System. It was made open-source to build a developer ecosystem and was evaluated for its excellence in creating a new business model and supporting multiple competitions through the produced open-source.

## 5. Background
There are many text-based applications like OneNote, Evernote, Mac OS Memo app, and Windows Notepad. The project began with the question, "What would you run if you need to record something immediately?" Current note apps have complex UIs and long scenarios to record text, making them inaccessible and unfocused on content. This project aims to overcome these problems, enabling real-time simultaneous editing on various platforms (mobile and desktop) through the new Tile platform and extending it with the Mosaic System for automatic documentation.

## 6. Development Purpose
### Overview
Each text block is called a Tile, and a document composed of Tiles is called a Mosaic. The Auto-Documentation System algorithm will automatically snap Tiles into place to form documents, providing a unique text editing experience different from existing programs. This approach is considered for a patentable project. A Quick Start Module will also be implemented using hardware. By fundamentally resolving text recording methods and developing new ideas, the project aims to enhance convenience for users, enabling quick note-taking, real-time editing, and automatic documentation.

## 7. Development Goals
### 1) System Architecture
(Description of system architecture)

### 2) Software Architecture
(Description of software architecture)

### 3) Tile Architecture
(Description of Tile architecture)

## 8. Quantitative Goals

| Goal                                        | Description                                                                                       | Weight |
|---------------------------------------------|---------------------------------------------------------------------------------------------------|--------|
| Cross-platform implementation of Tile       | Running equally on various platforms (Desktop, Mobile)                                            | 20     |
| Mosaic System error-free algorithm          | Ensuring the Mosaic System's algorithm works flawlessly                                           | 20     |
| Real-time asynchronous communication        | Evaluating data integrity and operational transformation algorithm used in simultaneous editing   | 20     |
| Platform expansion via open-source          | Building a developer ecosystem by open-sourcing Tile System and Mosaic System on GitHub           | 30     |
| New UX/UI development                       | Evaluating new user experiences and accessibility through innovative UX and UI                     | 5      |
| Providing practical service                 | Confirming the program's applicability as a practical service                                     | 5      |

## 9. Technology Trends
### 1) Operational Transformation Algorithm
Operational transformation (OT) supports advanced composite software system functionalities, ensuring consistent and synchronized collaborative editing of text documents. The Node.js module ShareJS implements OT, enabling real-time simultaneous editing by multiple users. The key to OT is maintaining a structure that prevents conflicts during simultaneous edits.

### 2) Cross Platform
Cross-platform software can run on multiple operating systems or platforms. Examples include Java, which can run on various OSes. Native cross-platform systems act as middleware directly above the OS kernel, supporting stable middleware functionality. The future integration of kernels could lead to independent mobile platforms. For instance, Blackberry plans to support Android apps by integrating Android middleware.

### 3) MVC Model
The MVC (Model-View-Controller) model is an object-oriented design method dividing components independently for flexibility and maintainability. Model handles application logic and data processing, View manages data input/output, and Controller directs data flow.

### 4) WPF
Windows Presentation Foundation (WPF) uses XAML and integrates with .NET Framework for a consistent programming model, separating UI and business logic. WPF applications can be hosted on desktops and browsers, supporting rich controls and advanced graphics.

## 10. Development Content
### 1) Mac OSX
During installation, the Mac OS X application displays an intro screen with the STILER team logo, login, and signup widgets.

### 2) Windows WPF
The Windows WPF application's login screen is similar to the Mac OS X version, developed using Blend IDE for smoother animations and better UI/UX.

### 3) Android and iOS (Mobile)
On Android, the application starts with the STILER team logo, and user interactions are designed to mimic heartbeats. The interface and functionality are consistent across platforms to reduce user friction.

### 4) Beacon Implementation
RECO Beacons emit signals with strength inversely proportional to distance. The app uses RSSI values to automatically open the appropriate meeting room document when near a beacon.

## 11. Development Environment
- **Development Tools:** Cocoa Framework (Xcode), Coda (HTML, CSS), .NET Framework (Visual Studio)
- **Languages:** Java, JavaScript, C++, HTML, CSS3, XML
- **Operating Systems:** Mac OS, Windows 7

## 12. Glossary

| Term                     | Description                                                                                  |
|--------------------------|----------------------------------------------------------------------------------------------|
| WPF                      | Windows Presentation Foundation for UI with DirectX graphics and XAML for interface design   |
| Cross Platform           | Software or applications running on multiple operating systems or platforms                  |
| Operational Transformation| Technology for integrating complex functionalities in collaborative editing systems         |
| Cordova                  | Device API set for accessing native devices using JavaScript, enabling HTML/CSS/JS app development|

## 13. References
1. pyrasis.com - Using Node.js
2. "Apache Core Guide" by Ben Laurie, Peter Laurie
