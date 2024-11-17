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

- Project : Wireless USB Adapter for Wired Devices
- 2014.10 ~ 2015.03
- Samsung Software Membership

# Wireless USB Adapter for Wired Devices
## 1. Project Duration
2014.10 ~ 2015.03

## 2. Background

With the rapid development of communication technologies today, we can easily access and share information anytime and anywhere. This rapid change means that the way we adapt can lead to vastly different outcomes. As part of this technological evolution, we are transitioning from wired to wireless communication. Despite the prevalence of wired communication, this transition phase is essential. Thus, for users of existing wired input devices, I conceived an idea to replace these wired input devices with wireless communication.

## 3. Development Purpose

Before the advent of wireless communication, wired communication was the standard. As a result, wired mice and keyboards became widely used. However, these wired devices have limitations due to cable length, restricting movement and placement. Wireless devices can overcome these limitations. Recently, as wireless modules become smaller and cheaper, many devices that were once wired are now available wirelessly. This trend extends to input devices, with wireless keyboards and mice becoming more common. However, using wireless devices incurs additional costs. Therefore, this project aims to develop a device that can be attached between existing wired devices and a computer to enable Zigbee communication, making them function like wireless keyboards and mice.

## 4. Technology Trends

### 1) Zigbee

Zigbee is a standard for low-cost, low-power wireless Mesh networks. Its low-cost feature makes it possible to deploy in large numbers across a wide area for wireless control and monitoring purposes. Its low-power characteristic extends operational life and reduces battery size. Mesh networking provides high reliability and wide range expansion. Zigbee chip manufacturers generally produce and sell integrated radio and microcontroller products with 60-256KB flash memory capacity. Zigbee operates in the industrial, scientific, and medical (ISM) radio bands: 868MHz in Europe, 915MHz in the US and Australia, and 2.4GHz in most parts of the world. Data transmission speeds range from 20 kbps in the 868MHz band to 250 kbps in the 2.4GHz band. Zigbee is based on the physical and media access control layers of the 2003 version of the IEEE 802.15.4 standard for low-rate personal area networks. Zigbee nodes can switch from sleep to active mode within 30ms or less, much quicker than the approximately 3-second wake-up time of Bluetooth, allowing shorter latency and better responsiveness. Most of the time, Zigbee nodes remain in sleep mode, resulting in low average power consumption and long battery life.

### 2) Device Driver

Device drivers are programs that operate as part of the kernel to control specific hardware or devices. Each input and output device in a computer has a device driver that integrates and runs with the kernel. Device drivers bridge high-level computer programs and computer hardware devices. They may be integrated into the kernel initially or exist as separate files (e.g., *.sys for Windows, *.o for Linux) that load into the kernel during boot or as needed. Drivers communicate with devices via computer buses or communication subsystems connected to the hardware. When a program calls a driver command, the driver sends the command to the device. If the device sends data back, the driver relays it to the original program. Drivers depend on hardware and specific operating systems and handle necessary interrupts for hardware interfaces. They control hardware and peripherals by accessing hardware registers and serving as an intermediary between hardware and software programs. Device drivers are part of the kernel, separate from applications, and manage resources like I/O, networking, and memory, starting at boot and ending at shutdown. Applications load from storage to memory at the user's request and access hardware via kernel device drivers using system calls. Firmware for controlling peripheral devices is also classified as device drivers.

### 3) Qt

Qt is a cross-platform framework widely used in computer programming for developing GUI applications. It also supports non-GUI applications such as server consoles and command-line tools. In GUI applications, Qt is classified as a widget toolkit. It is used in KDE, Qtopia, and OPIE. Developed by the Norwegian company Trolltech, it was acquired by Nokia in 2008 and by Digia in 2012. Qt primarily uses C++ but also interfaces with Python, Ruby, C, Perl, and Pascal. It operates on numerous platforms and offers robust internationalization support. Qt provides SQL database access, XML processing, thread management, and a unified cross-platform file management API. Supported platforms include:
- Linux/X11 (X Window System for Unix/Linux)
- macOS (Mac OS X)
- Windows (Microsoft Windows)
- Embedded Linux (for PDAs, smartphones, etc.)
- Windows CE (for Windows CE, etc.)
- Symbian (for Symbian)
- Maemo (for Maemo)

Qt uses its own painting engine and controls, adhering to the appearance of the executing platform. It was designed with minimal platform-dependent code, making it easy to port to different platforms. However, this approach required replicating the look of each platform. Recent Qt versions use native platform APIs to render controls, eliminating this issue. Other toolkits, like wxWidgets, use platform-dependent functions and have their design styles.

## 5. Development Goals

### System Architecture

- Each input hardware has an MCU (Microcontroller Unit).
- The MCU transmits data from wired input devices to the computer via Zigbee communication.
- The input device driver processes data from the hardware and executes the desired actions through the input event device driver.
- The Key Setting Interface, created using the Qt platform, allows users to set events for shortcut keys with the input event device driver.

## 6. Development Content

### 1) Hardware

#### (1) Configuration

- Two dongles (one for the mouse and one for the keyboard), each composed of a battery, Bluetooth module, and VNC1L chip. Additionally, a USB dongle composed of a Bluetooth module and Atmega128.
- The USB module with a battery connects to the wired input device, while the other USB module connects to the computer.
- Initially, Zigbee communication was used for this project, but the 30-50ms delay of Zigbee caused issues with real-time input device usage. Thus, the communication method was switched to Bluetooth for its higher speed.
- The device transmits data from input devices to the computer via Bluetooth communication.
- To use the device, install the keyboard and mouse on their respective dongles, attach the portable battery to the keyboard and mouse dongles, and then connect the PC dongle to the PC USB port after 5-10 seconds.
- Ensure proper functionality before regular use.

#### (2) Detailed Development Content

##### (i) PC Dongle

- The Atmega128 acts as a USB device to the PC. Firmware utilizes open-source V-USB and two Bluetooth chips to receive data from mouse and keyboard dongles.
- Connecting this device to the PC recognizes one HID keyboard and mouse each. Data from the keyboard and mouse is delivered to the PC driver.

- The dongle's external case is made using CATIA and a 3D printer.

##### (ii) Mouse Dongle

- USB devices require a host to send data. Thus, the VNC1L chip from FTDI is used to receive data from the USB mouse and transmit it to the PC dongle via UART communication and Bluetooth module.
- The external case of the mouse & keyboard dongles is also made using CATIA and a 3D printer.

##### (iii) Keyboard Dongle

- Like the mouse, the keyboard also receives data using the VNC1L chip. However, due to the firmware characteristics of VNC1L, AT commands must be set externally via UART to enable the monitor mode for data reception. An additional MCU is included to input these commands.

### 2) Software

#### (1) User Setting Interface

- A GUI interface created using the Qt platform.
Click the executable file on the desktop to run the program.
The program window shows virtual keyboard and mouse buttons at the top. Each key and mouse button is represented as a clickable button.
When creating key combinations by clicking the virtual keyboard and mouse buttons, the corresponding text is displayed in a highlighted text window.
Select executable programs corresponding to key combinations. The list includes programs currently in Linux. New programs can be added to the list to create new combination keys.
The Exchange and ResetText button registers function keys and their associated programs to the system, and resets the text view for the next combination.
Click the desired function keys to create a combination. Each click displays the text of the combination key in the text view.
Select the desired program from the list to run with the combination key.
Clicking the Exchange and Reset button clears the text view and registers the function keys and commands into the system, enabling immediate use.

## 7. Development Environment

1) OS
- Linux Ubuntu 14.04 LTS
- Windows 7

2) Language
- C / C++

3) Tools
- Qt Creator
- GCC
- AVR Studio

## 8. Development Budget

| No | Part Name         | Purpose            | Price (KRW) | Quantity | Total (KRW) |
|----|-------------------|--------------------|-------------|----------|-------------|
| 1  | FZ755AC           | Data Transmission  | 44,000      | 4        | 172,000     |
| 2  | VNC1L Board       | USB HOST           | 38,000      | 2        |  76,000     |