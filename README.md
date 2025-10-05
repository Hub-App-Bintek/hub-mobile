# PKP Hub

## Overview

PKP Hub is a mobile application designed to **help people build their first house or renovate their existing house by providing guided, step-by-step assistance through key project phases.** This includes support for initial consultation and planning, navigating regulatory permissions, managing construction material procurement, and monitoring the overall construction progress.

**Target Users:** The primary users are individuals undertaking home construction or renovation projects, whether they are first-time builders or experienced homeowners looking for a more structured approach.

**Core Value:** PKP Hub aims to demystify and streamline the often complex and overwhelming process of building or renovating a home. It empowers users with clear guidance, tools for organization, and better control over their projects from conception to completion.

This project, PKP Hub, is a Flutter-based mobile application being developed with a strong emphasis on clean architecture, scalability, testability, and maintainability. It adheres to industry best practices for production-ready mobile applications, ensuring a robust and high-quality solution.

This document serves as a guide for developers working on the PKP Hub project, outlining its structure, architectural decisions, and development processes.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation & Setup](#installation--setup)
  - [Environment Configuration](#environment-configuration)
  - [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [Architectural Approach](#architectural-approach)
- ... (rest of table of contents)

## Getting Started

### Prerequisites

- [FVM (Flutter Version Management)](https://fvm.app/)
- Git (for version control)
- An IDE such as Android Studio or VS Code with Flutter & Dart plugins.

### Installation & Setup

This project uses [FVM (Flutter Version Management)](https://fvm.app/) to ensure the entire team uses the exact same Flutter SDK version (`3.35.0`). This version is specified in the `.fvmrc` file.

1.  **Clone the repository:**
    ```bash
    git clone [YOUR_GIT_REPOSITORY_URL_HERE]
    cd pkp_hub
    ```

2.  **Install and Configure FVM:**
    If you don't have FVM, install it by following the instructions on the [official FVM website](https://fvm.app/docs/getting_started/installation).

3.  **Install the Project's Flutter SDK:**
    FVM will automatically read the `.fvmrc` file and install the correct Flutter version for this project.
    ```bash
    fvm install
    ```

4.  **Install dependencies:**
    Use FVM to run Flutter commands. This ensures you're using the project-specific SDK version.
    ```bash
    fvm flutter pub get
    ```

#### IDE Configuration (VS Code Example)

To ensure your IDE uses the FVM-managed Flutter SDK for analysis and debugging:

1.  In your project's root, create a `.vscode` directory if it doesn't exist.
2.  Inside `.vscode`, create a `settings.json` file.
3.  Add the following configuration:
    ```json
    {
      "dart.flutterSdkPath": ".fvm/flutter_sdk",
      // Optional: Exclude FVM's symlink from file search
      "search.exclude": {
        "**/.fvm": true
      },
      // Optional: Exclude from file watcher
      "files.watcherExclude": {
        "**/.fvm": true
      }
    }
    ```
4.  Restart VS Code. Your IDE will now use the correct SDK version. Similar configurations exist for Android Studio (it should automatically detect the FVM setting).

### Environment Configuration

This project uses compile-time variables via `--dart-define` for environment-specific configurations. (Content remains the same)...

### Running the Application

All `flutter` commands **must** be prefixed with `fvm` to use the project-specific Flutter SDK.

- **Development:**
  ```bash
  fvm flutter run --dart-define=API_BASE_URL='https://api.dev.example.com'
  ```
- **Release (example):**
  ```bash
  fvm flutter run --release --dart-define=API_BASE_URL='https://api.prod.example.com'
  ```

## Building for Production

-   Ensure all environment variables are correctly set for the production build using `--dart-define`.
-   Use FVM for all build commands:
    ```bash
    # Build an Android App Bundle
    fvm flutter build appbundle --release [options from Environment Configuration]

    # Build an Android APK
    fvm flutter build apk --release [options from Environment Configuration]

    # Build an iOS App (IPA)
    fvm flutter build ipa --release [options from Environment Configuration]
    ```
-   Code obfuscation (`--obfuscate --split-debug-info`) is recommended for release builds.

...(The rest of the README.md content remains unchanged)...