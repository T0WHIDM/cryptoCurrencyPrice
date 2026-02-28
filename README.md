# Crypto Currency Price 💰

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Architecture](https://img.shields.io/badge/Clean%20Architecture-Implemented-green)

**Crypto Currency Price** is a Flutter-based practice application designed to demonstrate structured software development using **Clean Architecture** and real-world API integration.

This project focuses on applying scalable architectural patterns and best practices to build a maintainable and testable mobile application.

---

## 📚 About The Project

This application was built as a structured learning exercise to simulate real-world development scenarios and reinforce architectural best practices in Flutter development. 

It is not intended for production use, but rather as a technical showcase of clean code principles and API-driven application design.

### 🎯 Objectives & Key Features

* **Integration:** Seamless integration with external RESTful APIs.
* **Architecture:** Implementing Clean Architecture (Presentation, Domain, Data layers).
* **Best Practices:** Applying SOLID principles.
* **State Management:** Managing application state efficiently.
* **Code Quality:** Writing modular, reusable code with improved separation of concerns.
* **Scalability:** Structuring the project for long-term scalability.

---

## 🏗 Architectural Overview

The project strict follows **Clean Architecture** principles to ensure better testability, clear responsibility boundaries, and easier feature expansion.

### The Layers:

1.  **Presentation Layer 🎨**
    * Handles UI rendering and state management.
    * Observes data from the Domain layer and updates the view.

2.  **Domain Layer 🧠**
    * The core of the application.
    * Contains business logic, **Entities**, and **Use Cases**.
    * Completely independent of external libraries or data sources.

3.  **Data Layer 💾**
    * Manages data retrieval.
    * Contains **Models**, API calls (Remote Data Source), and **Repository Implementations**.

---

## 📸 Screenshots

<img width="200" height="600" alt="Screenshot_1771880798" src="https://github.com/user-attachments/assets/2a833434-acd3-4668-adfd-5efa2124866d" />

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

* Flutter SDK
* Dart SDK

### Installation

1.  **Clone the repository**
    ```sh
    git clone [https://github.com/T0WHIDM/cryptoCurrencyPrice.git](https://github.com/T0WHIDM/cryptoCurrencyPrice.git)
    ```
2.  **Navigate to the project directory**
    ```sh
    cd cryptoCurrencyPrice
    ```
3.  **Install dependencies**
    ```sh
    flutter pub get
    ```
4.  **Run the app**
    ```sh
    flutter run
    ```

---

## 📂 Folder Structure

A quick look at the top-level directory structure:

```text
lib/
├── core/                   # Core utilities, errors, and constants
├── data/                   # Data layer (Repositories, Models, Data Sources)
├── domain/                 # Domain layer (Entities, Use Cases, Repository Interfaces)
├── presentation/           # Presentation layer (Pages, Widgets, State Management)
└── main.dart
```
🤝 Contributing
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

Fork the Project

Create your Feature Branch (git checkout -b feature/AmazingFeature)

Commit your Changes (git commit -m 'Add some AmazingFeature')

Push to the Branch (git push origin feature/AmazingFeature)

Open a Pull Request

📞 Contact
T0WHIDM - GitHub Profile

Project Link: https://github.com/T0WHIDM/cryptoCurrencyPrice
