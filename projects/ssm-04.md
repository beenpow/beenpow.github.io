---
layout: post
title : "Automated Laundry Management System"
subtitle: "Samsung Software Membership"
type: "PROJECTS"
projects: true
undergrad: true
list-img: true
text: true
author: "beenpow"
post-header: true
header-img: "https://images.pexels.com/photos/693859/pexels-photo-693859.jpeg?cs=srgb&dl=pexels-hiteshchoudhary-693859.jpg&fm=jpg"
main-img: "https://images.pexels.com/photos/693859/pexels-photo-693859.jpeg?cs=srgb&dl=pexels-hiteshchoudhary-693859.jpg&fm=jpg"
order: 1
date: "2016-03-06"
---

- Project : Automated Laundry Management System
- 2016.03.06 - 2016.05.06
- Samsung Software Membership

# Automated Laundry Management System

## Project Duration
2016.03.06 - 2016.05.06

## Purpose and Motivation
In the past 20 years, the number of single-person households has quadrupled, and it is projected to reach 7.09 million households by 2030. Due to this increase, the demand for unmanned laundry services is also growing. However, the current services are somewhat inconvenient for users and shop owners. This project aims to identify the causes of these inconveniences and create a more user-friendly service for business owners, users, and entrepreneurs.

## Development Environment and Schedule

### Development Environment
- **Operating Systems:** Windows 7, Linux
- **Development Tools:** Visual Studio, Arduino, Android, Web

### Development Schedule
- **2016.03.09:** Kick-off Seminar
- **2016.04.20:** Mid-term Seminar
- **2016.05.11:** Completion Seminar
- **2016.05.12:** Final Submission and Completion

## Innovation and Excellence
This project focuses on providing a smart service using the Internet of Things (IoT) for both shop owners and users. By implementing membership management, bill acceptors, and web services, the project aims to improve convenience for business owners, users, and entrepreneurs.

## Applicability and Business Potential
1. Participation in various competitions through the project
2. Providing a service that integrates IT technology for business owners, users, and customers

## Background

In the past 20 years, the number of single-person households has quadrupled. In 1990, there were 1.01 million single-person households, which increased to 2.26 million by 2000, and further to 4.15 million by 2010. This trend is expected to continue, with projections indicating 5.87 million households by 2020 and 7.09 million by 2030. This rapid growth has led to the expansion of related markets, such as unmanned laundry services. The demand for unmanned laundry services is increasing due to the rise in single-person households and has been recognized as a viable business opportunity.

Since its inception in 2013, the unmanned laundry service has continuously developed more user-friendly and efficient laundry and dryer functionalities. It has garnered attention both domestically and internationally, being invited to international laundry exhibitions like Texcare Asia. This project aims to provide a smart service using IoT to enhance the convenience for both shop owners and users.

Automated Laundry Management System will encompass three main services:
- An internal service for unmanned laundry facilities
- An application for user convenience
- A web service for recruiting new entrepreneurs

## Development Purpose

### Overview
The project aims to implement Bubble Count, Bubble Power, and Bubble Camera as solutions for managing unmanned laundry services in a PC environment. Each device will operate independently but will be interconnected via wireless communication to function as a single service.

The primary goal is to optimize the unmanned laundry service. Bubble Count will handle customer membership registration and account recharges. Bubble Power will control the power of the laundry machines based on information from Bubble Count. Bubble Camera will use Raspberry Pi 2 and Pi Cam to take real-time photos of the remaining laundry time and send them to the server.

The PC App will be implemented on a touchscreen monitor within the laundry facility, providing fingerprint recognition, coin counting, and server communication to facilitate easy use for customers. The integrated service will enhance the management and utilization of laundry facilities, increasing their value through the convergence of hardware and software.

## Development Goals

### Hardware Architecture
Bubble Count will use Arduino to control bill acceptors and fingerprint readers and transmit the recognized values via Bluetooth Serial communication. Bubble Count and Bubble Power will connect via Bluetooth to receive the number of available laundry machines and control their power. Bubble Camera will use TCP/IP communication and Open CV to capture the remaining laundry time from the webcam and transmit it to the server in real-time. Future plans include obtaining PCB boards from laundry machine manufacturers to measure the remaining laundry time without Bubble Camera.

### Software Architecture
The software architecture includes:
- **PC Application:** Implementing a Working Dashboard through WPF to display the current status of the unmanned laundry facility and facilitate customer registration via web service. It will also control the laundry machine power and functions via Bluetooth Serial communication.
- **Android Application:** Providing a convenient view of the Working Dashboard and real-time updates on laundry completion through Push Alarms. User information will be encrypted and stored using SQLite.
- **Homepage:** Offering membership and web services, and acting as a bridge between WPF and the Android Application using JavaScript. Laundry facility owners can register their facilities through the homepage.

### Quantitative Goals

| Goal | Description | Weight |
|------|-------------|--------|
| Bubble Count, Bubble Power, Bubble Camera | Ensuring smooth operation and no malfunctions among the three devices, with data integrity during server or Bluetooth communication.                   | 20     |
| Server, Web                         | Transmitting processed data to PC APP and Android, providing a comprehensive overview, and allowing manager settings via Web.                           | 30     |
| PC APP                              | Executing user fingerprint recognition, bill acceptor information, and communicating with Server and Bubble Count for device control.                 | 30     |
| Android                             | Enabling remote monitoring of laundry facility status and real-time updates on the remaining time of the used laundry machines.                      | 20     |

## Technology Trends

### 1) WPF
Windows Presentation Foundation (WPF) is a next-generation presentation system for building visually appealing Windows client applications. WPF enables the creation of a wide range of standalone and browser-hosted applications. It uses a resolution-independent, vector-based rendering engine that leverages modern graphics hardware. WPF supports a broad range of application development features, including XAML, controls, data binding, layout, 2D and 3D graphics, animation, styles, templates, documents, media, text, input system, and more. It is included in the Microsoft .NET Framework, allowing the creation of integrated applications using other .NET Framework class library elements.

### 2) IoT (Internet of Things)
IoT involves embedding sensors and communication functions in various objects to connect them to the internet. These objects include home appliances, mobile devices, wearable computers, and other embedded systems. Objects connected to IoT must have unique IP addresses and may include sensors for data acquisition from the environment. The development of IoT must address the security challenges posed by the potential for all connected objects to be hacked. According to Gartner, the number of objects using IoT technology was 900 million by 2009 and is expected to reach 26 billion by 2020. The vast amount of data generated by connected objects, known as Big Data, requires the development of efficient algorithms for analysis.

### 3) Arduino
Arduino is an open-source, single-board microcontroller with related development tools and environments. Initially based on AVR, it is now available in various versions, including those using ARM Cortex-M0 and Cortex-M3. Arduino can interact with the environment by receiving inputs from various sensors and controlling external devices like LEDs and motors. It offers an integrated development environment (IDE) for software development and code upload. Arduino supports integration with software like Adobe Flash, Processing, and Max/MSP. Its main advantage is the ease of programming and uploading firmware via USB. Arduino is relatively inexpensive and supports multiple operating systems, including Windows, macOS, and Linux. Arduino board schematics are available under a Creative Commons license, allowing anyone to build and modify the boards.

### 4) Open CV
Open CV (Open Computer Vision) is an open-source C library for computer vision. Developed by Intel, it is platform-independent and focuses on real-time image processing. It supports Intel Performance Primitives (IPP) for enhanced performance on Intel CPUs. Applications include human-computer interaction, object recognition, facial recognition, mobile robotics, gesture recognition, and more. Notable applications include the vision system of the winning robot car at the 2005 DARPA Grand Challenge and SwisTrack, software for tracking insect trajectories.

### 5) Bluetooth
Bluetooth is a short-range wireless technology standard for exchanging data between devices like mobile phones, laptops, and headsets. It is mainly used for low-power, short-distance wireless connections within about 10 meters. Bluetooth operates in the ISM (Industrial Scientific and Medical) frequency band (2400-2483.5 MHz). It uses 79 channels within this band, hopping frequencies 1,600 times per second to avoid interference with other systems. Bluetooth devices connect as master and slave, with one master supporting up to seven slaves. Master and slave roles can switch dynamically to maintain the connection.

### 6) PHP
PHP is a server-side scripting language widely used in web development. As of August 28, 2014, PHP 5.6 is available, with PHP 7 expected to be released on November 12, 2015. PHP is a foundational language for web systems worldwide, including WordPress and MediaWiki. In Korea, XpressEngine also heavily relies on PHP. The name PHP originally stood for Personal Home Page Tools but now stands for PHP: Hypertext Preprocessor. It uses C-like syntax and is popular for its ease of use and large developer community. Alternatives include ASP, JSP, CGI, and Ruby on Rails, but PHP is favored for its simplicity and compatibility with multiple operating systems. Performance enhancements can be achieved using PHP-FPM.

## Development Budget

| No | Part Name                              | Purpose                  | Price (KRW) | Quantity | Total (KRW) |
|----|----------------------------------------|--------------------------|-------------|----------|-------------|
| 1  | SSR (Solid State Relay 240VAC 15A with housing) | Washing machine On/Off   | 1,000       | 1        | 1,000       |
| 2  | O-ring terminal                        | Power outlet             | 1,700       | 1        | 1,700       |
| 3  | Grounding outlet                       | Power outlet             | 1,000       | 1        | 1,000       |
| 4  | Arduino Nano                           | Hardware MCU             | 33,664      | 2        | 67,328      |
| 5  | Fingerprint reader                     | Membership management    | 79,000      | 1        | 79,000      |
| 6  | Bill acceptor                          | Membership coin management| 79,000      | 1        | 79,000      |
| **Total**   |                                |                          |             |          | **229,028** |

## Development Environment

![Development Environment](path/to/image12.png)

## Role Distribution

![Role Distribution](path/to/image13.png)

## Development Schedule

![Development Schedule](path/to/image14.png)

## Glossary

| No | Term            | Meaning                                                                                                      |
|----|-----------------|--------------------------------------------------------------------------------------------------------------|
| 1  | WPF             | A new UI platform by Microsoft that offers improved graphics performance by directly accessing DirectX.      |
| 2  | Image Processing| Encompasses any form of information processing where the input and output are images. It often involves photo or video processing as examples. |
| 3  | Bluetooth       | A wireless technology standard for exchanging data over short distances, initially developed by Ericsson in 1994. |
| 4  | HTTP            | A protocol for transferring information on the World Wide Web, commonly used for HTML documents.             |

## References

### Related Books
- "열혈강의 영상 처리 프로그래밍" by 이희석
- "WPF" by Charles Petzold, translated by 최세영 et al.
- "Apache Core Guide" by Ben Laurie and Peter Laurie

### Related Links
- [Wikipedia](https://ko.wikipedia.org/)
- [WPF Blog](http://dotnetmvp.tistory.com/category/WPF)
- [Arduino Story Cafe](http://cafe.naver.com/arduinostory)
