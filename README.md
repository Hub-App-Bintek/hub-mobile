# PKP Hub

## Overview

PKP Hub is a mobile application designed to **help people build their first house or renovate their existing house by providing guided, step-by-step assistance through key project phases.** This includes support for initial consultation and planning, navigating regulatory permissions, managing construction material procurement, and monitoring the overall construction progress.

**Target Users:** The primary users are individuals undertaking home construction or renovation projects, whether they are first-time builders or experienced homeowners looking for a more structured approach.

**Core Value:** PKP Hub aims to demystify and streamline the often complex and overwhelming process of building or renovating a home. It empowers users with clear guidance, tools for organization, and better control over their projects from conception to completion.

**Key High-Level Features (Planned/Conceptual):**
*   **Guided Project Setup:** Step-by-step workflows for defining project scope, initial design ideas, and consultation needs.
*   **Regulatory & Permitting Assistance:** Checklists, information, and tracking for necessary permits and approvals based on locality (where feasible).
*   **Material & Supplier Management:** Tools for listing required materials, finding local suppliers, and potentially tracking procurement.
*   **Construction Progress Monitoring:** Features for users to log milestones, upload photos/videos, manage timelines, and potentially share updates with stakeholders or contractors.
*   **Budgeting & Expense Tracking:** Integrated tools for managing project finances effectively.

This project, PKP Hub, is a Flutter-based mobile application being developed with a strong emphasis on clean architecture, scalability, testability, and maintainability. It adheres to industry best practices for production-ready mobile applications, ensuring a robust and high-quality solution.

This document serves as a guide for developers working on the PKP Hub project, outlining its structure, architectural decisions, and development processes.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Environment Configuration](#environment-configuration)
  - [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [Architectural Approach](#architectural-approach)
  - [Clean Architecture](#clean-architecture)
  - [State Management](#state-management)
  - [Dependency Injection](#dependency-injection)
- [Key Libraries & Technologies](#key-libraries--technologies)
- [Testing Strategy](#testing-strategy)
- [Code Style & Quality](#code-style--quality)
- [Networking](#networking)
- [Local Storage & Caching](#local-storage--caching)
- [Error Handling & Logging](#error-handling--logging)
- [Internationalization (I18N) & Localization (L10N)](#internationalization-i18n--localization-l10n)
- [Accessibility](#accessibility)
- [Building for Production](#building-for-production)
- [CI/CD](#cicd)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Prerequisites

- Flutter SDK (version 3.19.x or higher recommended - _Please update with the specific version used_)
- Dart SDK (comes with Flutter)
- Git (for version control)
- An IDE such as Android Studio or VS Code with Flutter & Dart plugins.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [YOUR_GIT_REPOSITORY_URL_HERE]
    cd pkp_hub
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

### Environment Configuration

This project uses compile-time variables via `--dart-define` for environment-specific configurations like API base URLs and keys, ensuring no sensitive data is hardcoded (as per `lib/core/config/app_config.dart`).

1.  **Create a `.env` file (optional, for local convenience, not version controlled):**
    While direct `--dart-define` is preferred for CI/builds, for local development, you can manage these in a script or an unversioned `.env` file.
    Example `.env` content:
    ```env
    API_BASE_URL=https://api.development.pkphub.com/v1
    API_KEY=YOUR_DEV_API_KEY
    ENABLE_NEW_FEATURE=false
    ```

2.  **To run the app with these configurations:**
    You can pass these at compile time. For example:
    ```bash
    flutter run \
      --dart-define=API_BASE_URL='https://api.development.pkphub.com/v1' \
      --dart-define=API_KEY='YOUR_DEV_API_KEY' \
      --dart-define=ENABLE_NEW_FEATURE=false
    ```
    Refer to `lib/core/config/app_config.dart` for all expected environment variables.

### Running the Application

- **Development:**
  ```bash
  flutter run [options from Environment Configuration]
  ```
- **Release (example):**
  ```bash
  flutter run --release [options from Environment Configuration]
  ```

## Project Structure

The project follows a feature-first approach combined with Clean Architecture principles. Key directories within `lib/` include:

-   `app/`: Contains application-level setup: Dependency Injection (`di`), navigation (`navigation`), theming (`theme`), global utilities (`utils`), and shared widgets (`widgets`).
-   `core/`: Houses cross-cutting concerns: Networking client (`network`), structured error handling (`error_handling`), local storage abstractions (`local_storage`), base use cases (`usecases`), and environment configuration (`config`).
-   `data/`: For data layer components (data sources, models, repository implementations) that are *truly shared* across multiple features.
-   `domain/`: For domain layer components (entities, repository interfaces, use cases) that are *truly shared* across multiple features.
-   `features/`: Each subdirectory here represents a distinct feature module (e.g., `example_dashboard_feature`). Each feature module internally follows Clean Architecture (`data/`, `domain/`, `presentation/` layers).
-   `main.dart`: The application entry point, responsible for initializing core services and launching the app.

For more details, refer to the source code and inline documentation.

## Architectural Approach

### Clean Architecture

The application strictly adheres to Clean Architecture principles, ensuring separation of concerns between:

-   **Presentation Layer:** UI (Widgets) and State Management (Bloc/Cubit).
-   **Domain Layer:** Business logic (Use Cases) and Entities. Contains no Flutter dependencies.
-   **Data Layer:** Repository implementations and Data Sources (Remote and Local).

This promotes testability, maintainability, and scalability.

### State Management

-   **BLoC (Business Logic Component) / Cubit** is the primary pattern for state management within feature modules, paired with the `flutter_bloc` and `equatable` packages.
-   This ensures predictable state changes and separation of UI from business logic.

### Dependency Injection

-   Dependency Injection is managed using **`get_it`** (as per `lib/app/di/service_locator.dart`).
-   Services, repositories, use cases, and Blocs are registered and resolved through the service locator, facilitating loose coupling and testability.

## Key Libraries & Technologies

-   **Flutter:** UI toolkit for building natively compiled applications.
-   **Dart:** Programming language for Flutter.
-   **State Management:** `flutter_bloc`, `equatable`.
-   **Networking:** `dio` (for robust HTTP requests, interceptors, etc.).
-   **Dependency Injection:** `get_it`.
-   **Routing:** `go_router` (Recommended for type-safe navigation and deep linking).
-   **Local Storage:** `hive` (Planned for key-value storage and object persistence).
-   **Testing:** `flutter_test`, `mockito` (or `mocktail`), Golden Tests.
-   **Linting:** `flutter_lints` (or custom set from `analysis_options.yaml`).
-   **Internationalization:** `intl` package.
-   **Logging:** `logger` package.
-   **Analytics & Crash Reporting:** (Planned: e.g., `firebase_analytics`, `firebase_crashlytics` or Sentry).

## Testing Strategy

A comprehensive testing strategy is enforced:

-   **Unit Tests:** For testing individual functions, methods, and classes, particularly in the domain and data layers, and for Blocs/Cubits. Located in `test/...` mirroring `lib/` structure.
-   **Widget Tests:** For testing individual Flutter widgets in isolation.
-   **Integration Tests:** For testing interactions between different parts of the application, such as UI flows driven by state changes.
-   **Mocking:** `mockito` (or `mocktail`) is used for creating mock dependencies.
-   **Fixtures:** JSON fixtures for API responses or data are stored in `test/fixtures/`.

All new code should be accompanied by relevant tests, aiming for high test coverage.

## Code Style & Quality

-   Adherence to the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).
-   Strict linting rules are enforced via `analysis_options.yaml`.
-   Code should be well-documented, especially public APIs and complex logic.
-   No magic numbers or strings; use constants from `lib/app/utils/constants.dart` or feature-specific constant files.

## Networking

-   API calls are managed via `dio` through `lib/core/network/api_client.dart`.
-   Responses are wrapped in `ApiResult` sealed classes (`Success<T>`, `Failure<T>`) for robust error handling.
-   Interceptors are used for logging, authentication, and global error handling.

## Local Storage & Caching

-   Abstracted via `lib/core/local_storage/local_storage_service.dart`.
-   **`Hive`** will be used for persistence and caching.
-   Caching strategies with invalidation rules will be implemented as needed.
-   Sensitive data stored locally will be encrypted using **`flutter_secure_storage` for encryption keys and Hive's built-in box encryption**. 

## Error Handling & Logging

-   Structured error models are defined in `lib/core/error_handling/app_error.dart`.
-   User-friendly error messages are prioritized for UI display.
-   Logging is done using the **`logger`** package, ensuring no sensitive data is logged in production.
-   The application aims to never fail silently and provide appropriate fallbacks or error states.

## Internationalization (I18N) & Localization (L10N)

-   The application is designed to be fully localizable.
-   Textual content will be managed using the **`intl`** package and JSON/ARB files stored in `assets/lang/`.
-   Support for Right-to-Left (RTL) languages will be considered.

## Accessibility

-   Development will follow accessibility best practices (WCAG guidelines where applicable).
-   This includes proper use of semantic widgets, adequate touch target sizes, contrast ratios, and support for screen readers and font scaling.

## Building for Production

-   Ensure all environment variables are correctly set for the production build using `--dart-define`.
-   Flutter build commands for release:
    ```bash
    flutter build apk --release [options from Environment Configuration]
    flutter build ios --release [options from Environment Configuration]
    # For app bundles:
    # flutter build appbundle --release [options from Environment Configuration]
    ```
-   Code obfuscation (`--obfuscate --split-debug-info`) is recommended for release builds.

## CI/CD

-   **GitHub Actions** (or a similar CI/CD platform like Codemagic or GitLab CI) is planned for automating workflows.
-   CI pipeline will typically run: linting, tests (unit, widget), static analysis, and build validation.
-   Automated releases and versioning will be managed through the CI/CD pipeline.

## Contributing

We adhere to the following contribution guidelines:

-   **Branching Strategy:** GitFlow is preferred (e.g., `main`, `develop`, `feature/your-feature-name`, `release/version-number`, `hotfix/issue-fix`).
-   **Commit Message Conventions:** Follow [Conventional Commits](https://www.conventionalcommits.org/) (e.g., `feat: add user login screen`, `fix: correct calculation error in progress monitor`, `docs: update README with setup instructions`).
-   **Pull Request (PR) Process:**
    -   All changes should be submitted via PRs from feature branches to `develop`.
    -   PRs should be reviewed by at least one other developer.
    -   PRs must pass all CI checks (linting, tests).
    -   Provide a clear description of the changes in the PR.
-   **Issue Tracking:** Report bugs or suggest features using the project's issue tracker ([**TODO: Link to your GitHub Issues, Jira, etc.**]).

Currently, please ensure any new code aligns with the established architecture and includes appropriate tests and documentation.

## License

This project is licensed under the **MIT License**. See the `LICENSE` file for details. (_You may need to create a LICENSE file with MIT content_)

---

This README is a living document and should be updated as the project evolves.
