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

- Project : Web & Native App Communication Program
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
![img1](/img/ssm-02_img1.png)
- There are many text-based applications like OneNote, Evernote, Mac OS Memo app, and Windows Notepad. The project began with the question, "What would you run if you need to record something immediately?" Current note apps have complex UIs and long scenarios to record text, making them inaccessible and unfocused on content. This project aims to overcome these problems, enabling real-time simultaneous editing on various platforms (mobile and desktop) through the new Tile platform and extending it with the Mosaic System for automatic documentation.

## 6. Development Purpose
### Overview
Each text block is called a Tile, and a document composed of Tiles is called a Mosaic. The Auto-Documentation System algorithm will automatically snap Tiles into place to form documents, providing a unique text editing experience different from existing programs. This approach is considered for a patentable project. A Quick Start Module will also be implemented using hardware. By fundamentally resolving text recording methods and developing new ideas, the project aims to enhance convenience for users, enabling quick note-taking, real-time editing, and automatic documentation.

## 7. Development Goals
### 1) System Architecture
![img2](/img/ssm-02_img2.png)

### 2) Software Architecture
![img3](/img/ssm-02_img3.png)

### 3) Tile Architecture
![img4](/img/ssm-02_img4.png)

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
![img5](/img/ssm-02_img5.png)
The MVC (Model-View-Controller) model is an object-oriented design method dividing components independently for flexibility and maintainability. Model handles application logic and data processing, View manages data input/output, and Controller directs data flow.

### 4) WPF
![img6](/img/ssm-02_img6.png)
Windows Presentation Foundation (WPF) uses XAML and integrates with .NET Framework for a consistent programming model, separating UI and business logic. WPF applications can be hosted on desktops and browsers, supporting rich controls and advanced graphics.

## 10. Development Content
### 1) Mac OSX
- When installing the application on macOS, the following intro screen appears. On the left, there is the STILER team's logo, and on the right, there are login fields and a sign-up widget.
![img7](/img/ssm-02_img7.png)

- When you click the sign-up button, you must agree to the terms and conditions shown on the right to complete the registration.
![img8](/img/ssm-02_img8.png)

- After signing up, the following alert message will appear when logging in or if there is an account error.
![img9](/img/ssm-02_img9.png)

- If you enter your account information correctly to avoid the alert message, the STILER app will launch with the following welcome message, allowing you to easily edit notes simultaneously anytime, anywhere.
![img10](/img/ssm-02_img10.png)

- When you click the "Start" button at the top, the application will be registered in the top bar of macOS, as shown in the screen below. Clicking the application allows you to quickly start working on documents, with a notepad provided immediately. The number following the "#" at the top of the notepad represents the Room. After entering the room number and clicking the "Go" button, you can move to that room and edit documents simultaneously with others in that room. Additionally, there is another button to the right of the "Go" button, which is for overall room management and granting permissions, rather than quick notes.
![img11](/img/ssm-02_img11.png)

- After the main activity of the application is launched as shown below, you can see that simultaneous editing with the quick notepad is possible.
![img12](/img/ssm-02_img12.png)

![img13](/img/ssm-02_img13.png)

- When you click the tab button at the bottom right of the main activity, a room number input window will appear, allowing you to quickly join a room, as shown in the image below. This provides a UI almost identical to the actual Android and iOS apps, ensuring consistency in UI and UX. It was developed with the user's ease of use and accessibility in mind.
![img14](/img/ssm-02_img14.png)
- As you can see from the screen above, most of the implemented scenarios are similar to the mobile app.

### 2) Windows WPF
![img15](/img/ssm-02_img15.png)
- The start screen of the Windows WPF app announces the launch of the STILERS application, allowing users to directly use the STILERS app.

### 3) Android and iOS (Mobile)
- When you first start the Android application, just like on other platforms, the heart logo, which is the symbol of the Stiler team, is located in the center. When you move the cursor to the email input field, the heart shape animates to mimic a heartbeat.
![img16](/img/ssm-02_img16.png)

- When you click the "+" button, just like on macOS, the sign-up fields appear, and the terms and conditions are presented on the right. If you do not agree to the terms, you will not be able to complete the registration. As shown in the picture below, you must agree to the terms to sign up.
![img17](/img/ssm-02_img17.png)

- When you log in, the following activity screen appears. It has been implemented very similarly to other platforms to reduce any sense of unfamiliarity when using the application on Android. The functionality is as described above.
![img18](/img/ssm-02_img18.png)
- Additionally, various features are provided to allow users to easily navigate to the STILE page, while minimizing differences from the desktop app in terms of UI and UX.

- When you click the "down arrow" icon at the top right of the list, the tile list will flip backward in a 3D format, as shown on the right side of the picture. The functions are arranged from left to right as "Quick Address ID," "Remove from List," and "Options."
![img19](/img/ssm-02_img19.png)
![img20](/img/ssm-02_img20.png)

### 4) Beacon Implementation
- Below is the RECO beacon. This beacon emits a signal that propagates radially and inversely proportional to the distance. The receiving device (phone) can measure the strength of this beacon signal, known as the RSSI value. Using this RSSI value, the app automatically displays the room number document management window in specific places like a meeting room.
![img21](/img/ssm-02_img21.png)

- The image below shows the normal state of the app when not near the beacon.
![img22](/img/ssm-02_img22.png)

- When you bring the device closer to the beacon, as shown in the image below, the appropriate room number is assigned, allowing simultaneous editing in the same room with others seated around the beacon in the meeting room.
- ![img23](/img/ssm-02_img23.png)

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
