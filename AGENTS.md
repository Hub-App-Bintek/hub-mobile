# Repository Guidelines

This document also defines how **automation/AI agents** should work in this repo, simulating a “FlutterFlow-like” capability while respecting our clean architecture.

---

## Agent Role & Scope (FlutterFlow-like Simulation)

An **Agent** in this repository acts like a structured UI / feature builder, not a freeform refactoring bot.

### Agent Primary Goals
- Scaffold **new features/screens** under `lib/features/...` following our clean architecture.
- Wire **dependency injection, navigation, and storage** according to the rules in this file.
- Keep the codebase **analyzable, testable, and generated artifacts in sync**.

### Agent Must Prioritize

1. **Architecture integrity**
    - Never bypass `domain` / `data` layers from UI.
    - Use repositories and use cases instead of hitting datasources directly from controllers or widgets.

2. **Consistency with existing patterns**
    - Reuse existing helpers, widgets, DI patterns, and naming conventions.
    - Prefer extending current abstractions over inventing new ones.

3. **Safe, minimal changes**
    - Do not perform massive global refactors.
    - Keep changes scoped to the feature or module being updated.

---

## Agent Capabilities

The Agent **may**:

- Create new feature modules under `lib/features/<feature>/`:
    - `controllers/`, `screens/`, `widgets/`, `bindings/`, etc.
- Add or update:
    - Use cases in `lib/domain/...`
    - Repositories in `lib/domain/` and `lib/data/...`
    - Datasources and services in `lib/data/datasources/...` and `lib/core/network/services/...`
- Wire DI in:
    - `lib/app/injection/network_service_injection.dart`
    - `lib/app/injection/datasource_injection.dart`
    - `lib/app/injection/repository_injection.dart`
    - Feature `bindings/`
- Register routes in:
    - `lib/app/navigation/app_pages.dart`
    - `lib/app/navigation/app_routes.dart`
- Add tests under `test/...` mirroring the `lib/...` layout.

The Agent **must not**:

- Edit generated files (`*.g.dart`, `*.freezed.dart`, etc.).
- Introduce new state management patterns outside the established one (GetX + `BaseController`).
- Bypass the Result/Failure pattern in domain/data layers.
- Break or remove existing DI registrations without updating all usages.
- Add raw UI elements that duplicate shared widgets without good reason.

---

## Agent Standard Workflows

### 1. Adding a New Feature Screen (UI-first, FlutterFlow-style)

When the Agent is asked to add a new screen/flow:

1. **Scaffold the feature folder**

    - Create:
        - `lib/features/<feature>/controllers/<feature>_controller.dart`
        - `lib/features/<feature>/screens/<feature>_screen.dart`
        - `lib/features/<feature>/widgets/...` as needed
        - `lib/features/<feature>/bindings/<feature>_binding.dart`

2. **Controller**

    - Controller must:
        - Extend `BaseController` from `lib/core/base/base_controller.dart`.
        - Use `handleAsync` for async logic.
        - Expose UI state as `Rx` fields.
    - Depend **only** on use cases (not repositories or datasources directly).

3. **Domain & Data**

    - If new business capability is needed:
        - Add/use **domain entities**, **use cases**, and **repositories** under `lib/domain/...`.
        - Implement repository methods in `lib/data/...` (datasources + models + mappers).
        - Always return `Result<T, Failure>` and avoid throwing.

4. **Navigation**

    - Register screen in:
        - `lib/app/navigation/app_routes.dart` (route name).
        - `lib/app/navigation/app_pages.dart` (GetPage + binding).
    - If route takes arguments:
        - Create a typed args class in `lib/app/navigation/route_args.dart`.
        - Use `Get.arguments as <ArgsClass>` instead of raw `Map`.

5. **UI Foundation**

    - Use:
        - `AppStrings` in `lib/core/constants/app_strings.dart` for text.
        - `AppColors` in `lib/app/theme/app_colors.dart` for colors.
        - `AppTextStyles` in `lib/app/theme/app_text_styles.dart` for typography.
        - Reusable widgets from `lib/app/widgets/` (`PkpElevatedButton`, `PkpCard`, etc.).
    - Only fall back to raw `ElevatedButton`/`OutlinedButton` if shared widgets cannot handle the requirement, and prefer enhancing shared widgets.

6. **DI / Bindings**

    - In feature `bindings/`:
        - Wire controller → use cases → repositories via `Get.lazyPut`, `fenix: true` when appropriate.
    - For new data sources / services:
        - Register them in:
            - `network_service_injection.dart`
            - `datasource_injection.dart`
            - `repository_injection.dart`
        - Keep constructor dependencies minimal (only what each layer truly needs).

7. **Tests**

    - Add:
        - Controller tests under `test/features/<feature>/controllers/...`
        - Screen/widget tests under `test/features/<feature>/screens/...` or `widgets/...`
        - Mapper/deserialization tests if new models are added.

8. **Commands to Run**

   The Agent should assume these must pass before the PR is valid:

    - `fvm flutter pub get` (if dependencies changed)
    - `fvm dart format lib`
    - `fvm flutter pub run build_runner build --delete-conflicting-outputs` (if models/services changed)
    - `fvm flutter analyze`
    - `fvm flutter test`

---

### 2. Adding/Updating an API Endpoint

When the Agent needs to integrate a new API:

1. Add endpoint constant in:
    - `lib/core/constants/api_endpoints.dart`.

2. Update Retrofit service:
    - `lib/core/network/services/<feature>_api_service.dart`.

3. Run codegen (assumed required after edits):
    - `fvm flutter pub run build_runner build --delete-conflicting-outputs`.

4. Implement datasource:
    - Under `lib/data/datasources/<feature>/...`:
        - Wrap calls in `try/catch`.
        - Convert Dio errors using `ApiClient.toFailure`.
        - Return `Result<T, Failure>`.

5. Map to domain:
    - Add/extend mappers to convert API models → domain entities.
    - Validate required fields and produce meaningful `Failure` on incomplete data.

6. Update repositories & use cases:
    - Repositories expose the new operations to domain layer.
    - Use cases provide a controller-friendly API.

7. Tests:
    - Deserialization & mapper tests.
    - Repository/use case tests if logic is non-trivial.

---

### 3. Local Storage / Caching

If a feature requires local persistence:

1. Create local datasource:
    - `lib/data/datasources/<feature>/<feature>_local_data_source.dart`
    - Define abstract contract + implementation.

2. Use shared storage helpers:
    - `UserStorage`, `SecureStorage`, or new storage helpers under `lib/core/storage/` when needed.
    - For complex caching, use Hive boxes or equivalent.

3. DI:
    - Register in `datasource_injection.dart`.
    - Expose via repositories (UI/controllers never talk to storage directly).

4. Cache policy:
    - Implement `clear()`, TTL, or explicit invalidation methods.
    - Document when/cache must be refreshed.

---

## Project Structure & Module Organization
- `lib/`: Flutter source code following clean architecture. Key areas include `lib/app/` (DI, routing, theme), `lib/core/` (shared utils, network, error), `lib/domain/` (use cases, repositories), `lib/data/` (models, datasources), and `lib/features/` (UI + controllers per module).
- `android/` and `ios/`: Native platform scaffolding for Flutter builds.
- `test/`: Unit and widget tests mirroring the `lib/` layout. Create feature-specific suites under `test/features/...`.
- Generated files from `build_runner` live alongside their sources (e.g., `*.g.dart`, `*.freezed.dart`). Do not edit them manually.

## Build, Test, and Development Commands
- `fvm flutter pub get` — install/update dependencies using the Flutter version pinned by FVM.
- `HOME=$PWD PUB_CACHE=/Users/<user>/.pub-cache .fvm/flutter_sdk/bin/cache/dart-sdk/bin/dart format .` — ensure Dart formatting; normally `fvm dart format .` if the toolchain is available globally.
- `fvm dart format lib` — run after every code change to keep the Dart sources in `lib/` consistent with the formatter used in CI.
- `fvm dart analyze` or `fvm flutter analyze` — static analysis to enforce lints. FVM users can call `fvm flutter analyze`.
- `fvm flutter pub run build_runner build --delete-conflicting-outputs` — regenerate Retrofit, Freezed, and JSON serialization artifacts after model or API changes.
- When touching generated models/services, re-run the command above before committing so reviewers don’t see stale artifacts.
- Any time you update shared guidelines (including `AGENTS.md`), still run `fvm flutter analyze` and fix issues before committing so documentation-only changes don’t mask regressions elsewhere.
- `fvm flutter test` — execute the automated test suite (widget + unit tests).

## Coding Style & Naming Conventions
- Follow Dart style: 2-space indentation, lowerCamelCase for variables/methods, UpperCamelCase for classes, snake_case for file names.
- Keep feature code within its layer: UI in `lib/features/<feature>/`, domain logic in `lib/domain/`, data access in `lib/data/`.
- Run `fvm dart format .` before committing; CI assumes formatted code.
- Generated part directives should mirror file names (e.g., `part 'login_response.g.dart';`).

## Code Standardization
- Controllers extend `BaseController` (`lib/core/base/base_controller.dart`) and use `handleAsync` for async flows; expose UI state via `Rx` fields.
- Domain methods return `Result<T, Failure>`; propagate failures upwards instead of throwing.
- Repositories mediate between domain and data layers, translating datasource responses without UI dependencies.
- Feature folders mirror clean architecture structure (`controllers/`, `screens/`, `widgets/`, `bindings/`); keep files small and single-purpose.
- Shared enums, extensions, and utilities live under `lib/core/` to avoid duplication across features.

## Testing Guidelines
- Write unit tests with `package:test` and widget tests using Flutter’s test framework.
- Name test files `<target>_test.dart` and place them under the corresponding `test/<layer>/<feature>/` path.
- Ensure new or modified APIs include deserialization tests and mapper coverage when applicable.
- Reuse existing helpers in `test/features/...` folders (e.g., auth fixtures) instead of duplicating setup logic; extend them if a feature needs additional behavior.
- Add widget/golden tests for UI-heavy flows so GetX state changes are covered across screens, not just in controllers.
- Run `fvm flutter test` locally before opening a PR; include coverage notes if substantial logic changes are introduced.

## Commit & Pull Request Guidelines
- Compose concise commit messages in imperative mood (e.g., “Add survey rejection flow”).
- For PRs, provide context, linked issues or tickets, screenshots or screen recordings for UI changes, and a summary of validation steps (`fvm dart format`, `fvm dart analyze`, `fvm flutter test`, `build_runner` if run).
- Avoid bundling unrelated features; keep diffs scoped to a single feature or module when possible.

## Additional Tips
- Review `lib/app/injection/` before wiring new dependencies; follow existing GetX patterns.
- When adding network endpoints, update Retrofit services first, regenerate code, then propagate changes through datasource → repository → use case → controller.
- Prefer handling nullable API fields defensively in the data layer, converting to strict domain entities in mappers.

## Dependency Injection Rules
- Register services under `lib/app/injection/network_service_injection.dart`, datasources in `datasource_injection.dart`, and repositories in `repository_injection.dart`. Feature bindings wire controllers to their use cases directly, so follow the patterns in each `lib/features/<feature>/bindings/` fil
