# PackagePal

## Project Overview

This repository contains the code and documentation for an embedded project that leverages the ESP32 microcontroller for its Bluetooth and Wi-Fi capabilities. The project also includes a sleek and lightweight mobile application developed in Flutter and utilizes Firebase for real-time data management and authentication.

## Table of Contents

- [Project Overview](#project-overview)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Directory Structure](#directory-structure)
- [Backend (PlatformIO)](#backend-platformio)
- [Frontend (Flutter)](#frontend-flutter)
- [Firebase Integration](#firebase-integration)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- [PlatformIO](https://platformio.org/) is installed for the backend development.
- [Flutter](https://flutter.dev/) is installed for the frontend development.
- Firebase account for integrating Firebase services into the project.

### Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/shielamae02/PackagePal.git
   ```

2. Set up the backend using PlatformIO:
   - Open the `backend` directory in your preferred code editor.
   - Install the required dependencies using PlatformIO.
   - Configure the ESP32 microcontroller with your Wi-Fi and Bluetooth settings.

3. Set up the frontend using Flutter:
   - Open the `frontend` directory in your preferred code editor.
   - Run the following command to get the Flutter dependencies:

   ```bash
   flutter pub get
   ```

4. Configure Firebase integration:
   - Create a Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Configure your Firebase project settings in the Flutter app by following the Firebase setup documentation.

## Directory Structure

The project structure is organized as follows:

- `/backend`: Contains the PlatformIO code for the ESP32 microcontroller.
- `/frontend`: Contains the Flutter mobile application code.
- `/docs`: Documentation and resources related to the project.

## Backend (PlatformIO)

The backend of this project is based on PlatformIO, which allows you to develop and deploy code to the ESP32 microcontroller. It handles Bluetooth and Wi-Fi capabilities, along with other embedded functionalities. Ensure you configure the `platformio.ini` file with the necessary settings for your ESP32.

## Frontend (Flutter)

The frontend of this project is developed using Flutter, a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. You can customize and extend the Flutter app to meet your specific requirements.

## Firebase Integration

Firebase is used for real-time data management and authentication in the project. Follow Firebase's documentation to set up Firebase services, including Firestore for real-time data storage and Firebase Authentication for user management. Configure your Firebase project settings in the Flutter app.

## Usage

1. Start the PlatformIO backend by uploading the code to your ESP32 microcontroller.
2. Run the Flutter app on your mobile device or emulator by executing:

   ```bash
   flutter run
   ```

3. Use the mobile app to interact with the embedded system, manage real-time data, and authenticate users.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with clear commit messages.
4. Push your branch to your forked repository.
5. Create a pull request with a detailed description of your changes.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify the code as needed for your own projects.