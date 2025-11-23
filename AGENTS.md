# Repository Guidelines

## Project Structure & Module Organization
- `lib/`: Flutter source code following clean architecture. Key areas include `lib/app/` (DI, routing, theme), `lib/core/` (shared utils, network, error), `lib/domain/` (use cases, repositories), `lib/data/` (models, datasources), and `lib/features/` (UI + controllers per module).
- `android/` and `ios/`: Native platform scaffolding for Flutter builds.
- `test/`: Unit and widget tests mirroring the `lib/` layout. Create feature-specific suites under `test/features/...`.
- Generated files from `build_runner` live alongside their sources (e.g., `*.g.dart`, `*.freezed.dart`). Do not edit them manually.

## Build, Test, and Development Commands
- `fvm flutter pub get` — install/update dependencies using the Flutter version pinned by FVM.
- `HOME=$PWD PUB_CACHE=/Users/<user>/.pub-cache .fvm/flutter_sdk/bin/cache/dart-sdk/bin/dart format .` — ensure Dart formatting; normally `dart format .` if the toolchain is available globally.
- `fvm dart format lib` — run after every code change to keep the Dart sources in `lib/` consistent with the formatter used in CI.
- `dart analyze` or `flutter analyze` — static analysis to enforce lints. FVM users can call `fvm flutter analyze`.
- `flutter pub run build_runner build --delete-conflicting-outputs` — regenerate Retrofit, Freezed, and JSON serialization artifacts after model or API changes.
- When touching generated models/services, re-run the command above before committing so reviewers don’t see stale artifacts.
- Any time you update shared guidelines (including `AGENTS.md`), still run `fvm flutter analyze` and fix issues before committing so documentation-only changes don’t mask regressions elsewhere.
- `flutter test` — execute the automated test suite (widget + unit tests).

## Coding Style & Naming Conventions
- Follow Dart style: 2-space indentation, lowerCamelCase for variables/methods, UpperCamelCase for classes, snake_case for file names.
- Keep feature code within its layer: UI in `lib/features/<feature>/`, domain logic in `lib/domain/`, data access in `lib/data/`.
- Run `dart format .` before committing; CI assumes formatted code.
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
- Run `flutter test` locally before opening a PR; include coverage notes if substantial logic changes are introduced.

## Commit & Pull Request Guidelines
- Compose concise commit messages in imperative mood (e.g., “Add survey rejection flow”).
- For PRs, provide context, linked issues or tickets, screenshots or screen recordings for UI changes, and a summary of validation steps (`dart format`, `dart analyze`, `flutter test`, `build_runner` if run).
- Avoid bundling unrelated features; keep diffs scoped to a single feature or module when possible.

## Additional Tips
- Review `lib/app/injection/` before wiring new dependencies; follow existing GetX patterns.
- When adding network endpoints, update Retrofit services first, regenerate code, then propagate changes through datasource → repository → use case → controller.
- Prefer handling nullable API fields defensively in the data layer, converting to strict domain entities in mappers.

## Dependency Injection Rules
- Register services under `lib/app/injection/network_service_injection.dart`, datasources in `datasource_injection.dart`, and repositories in `repository_injection.dart`. Feature bindings wire controllers to their use cases directly, so follow the patterns in each `lib/features/<feature>/bindings/` file instead of a centralized `usecase_injection.dart`.
- Use `Get.lazyPut` with `fenix: true` for components that can be recreated on demand; avoid `Get.put` unless eager instantiation is necessary.
- Match constructor signatures so that each layer requests only the dependencies it needs (e.g., controllers depend on use cases, not datasources).
- When introducing a new feature, add a dedicated binding that wires controller → use cases → repositories to keep GetX binding files easy to reason about.
- Wire cross-cutting services (new storage helpers, analytics/loggers, etc.) through `lib/app/injection/app_binding.dart` so they are available app-wide before feature bindings run.
- After changing bindings or `AppBinding`, do a quick smoke test (`fvm flutter run` target screen or widget test) to catch missing registrations early.

## Local Storage Rules
- Define feature-specific local datasources under `lib/data/datasources/<feature>/<feature>_local_data_source.dart` with an abstract contract and concrete implementation.
- Reuse shared storage helpers (`UserStorage`, `SecureStorage`) when persisting sensitive or session data; for richer caching introduce Hive boxes or similar under `lib/core/storage/`.
- Serialize entities via `toJson`/`fromJson` helpers in `lib/data/entity/` or `lib/data/models/` and keep keys/constants private to the datasource.
- Mirror local datasources in dependency injection (`datasource_injection.dart`) and expose them through repositories so presentation layers never talk to storage classes directly.
- Provide explicit cache invalidation (`clear()`, TTL policies) and document when local data must be refreshed.

## API Integration Rules
- Declare paths in `lib/core/constants/api_endpoints.dart` before use to keep contracts centralized.
- Add Retrofit methods under `lib/core/network/services/<feature>_api_service.dart`; run `flutter pub run build_runner build --delete-conflicting-outputs` after editing.
- Datasource implementations (`lib/data/datasources/...`) should call the Retrofit client inside try/catch, wrap results in `Result<T, Failure>`, and delegate Dio errors to `ApiClient.toFailure`.
- Update domain repositories and use cases to expose the new operation without leaking data-layer details.
- Map API models to domain entities via dedicated mappers, validating required fields and producing meaningful `Failure` instances when data is incomplete.
- Introduce complementary local datasources when the feature requires offline persistence or caching; register them in `lib/app/injection/datasource_injection.dart` and expose them through repository implementations.

## UI Foundation Rules
- Centralize display strings in `lib/core/constants/app_strings.dart` (search existing keys before adding new ones to avoid duplicates).
- Use palette entries from `AppColors` (`lib/app/theme/app_colors.dart`) rather than hard-coded color literals.
- Follow typography tokens in `AppTextStyles` (`lib/app/theme/app_text_styles.dart`) to maintain consistent sizing and weight.
- Prefer shared widgets in `lib/app/widgets/` (e.g., `PkpElevatedButton`, `PkpCard`, `PkpAppBar`) and extend them when custom behavior is required; compose new widgets here so other features can reuse them.
- Buttons: use the reusable buttons in `lib/app/widgets/` (`PkpElevatedButton`, `PkpOutlinedButton`) instead of raw `ElevatedButton`/`OutlinedButton` to keep spacing, colors, and loading states consistent. Only fall back to raw buttons when the shared component cannot express the needed style and consider enhancing the shared widget first.
- When adding a new widget, double-check imports/exported barrels so consumers pull it from the right path and `dart analyze` stays clean of unused/missing imports.
- Register every new screen in `lib/app/navigation/app_pages.dart`/`app_routes.dart` with the correct `GetPage` and binding to keep navigation consistent and discoverable.
- Document route arguments (names, required keys) near the relevant `GetPage` entry so other teams know what to pass when navigating or deep-linking into the screen.
- Navigation arguments: prefer typed args classes in `lib/app/navigation/route_args.dart` over raw `Map`/`dynamic`. Define a small args class per route, pass it via `arguments`, and read it with `Get.arguments as MyArgs` (fall back to map only for backward compatibility). This avoids key typos/nulls and keeps refactors safer.
- Imports: favor project-relative imports (e.g., `package:pkp_hub/...`) to avoid duplicate library instances and make tooling happier; keep them sorted and remove unused imports so `dart analyze` stays clean.
