import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_error_response.dart';
import 'package:pkp_hub/core/network/network_manager.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/features/auth/data/models/request/login_request.dart';
import 'package:pkp_hub/features/auth/data/models/response/login_response.dart';
import 'package:pkp_hub/features/auth/domain/usecases/login_use_case.dart';
import 'package:pkp_hub/features/auth/presentation/controllers/login_controller.dart';

import 'login_controller_test.mocks.dart';

// Minimal concrete implementation to avoid mocking GetX lifecycle
class _TestNetworkManager extends NetworkManager {
  @override
  // ignore: must_call_super
  void onInit() {
    // Don't call super to avoid plugin wiring; just mark as connected
    isConnected.value = true;
  }

  @override
  void onClose() {
    // no-op
  }
}

// Use Mockito's annotation to generate mock classes.
// In a real project, you would run `flutter pub run build_runner build`
@GenerateMocks([LoginUseCase, AuthSession])
void main() {
  // Provide a dummy Result so Mockito doesn't need to auto-generate it
  const dummyLoginResponse = LoginResponse(
    token: 'dummy-token',
    userId: 123,
    fullName: 'dummy',
    email: 'dummy@example.com',
    expiresIn: 0,
    status: 'ok',
  );
  setUpAll(() {
    provideDummyBuilder<Result<LoginResponse, Failure>>(
      (Object _, Invocation __) =>
          const Success<LoginResponse, Failure>(dummyLoginResponse),
    );
  });

  // Using late to ensure variables are non-nullable and initialized in setUp
  late LoginController controller;
  late MockLoginUseCase mockLoginUseCase;
  late MockAuthSession mockAuthSession;

  setUp(() {
    // Ensure GetX runs in test mode to avoid UI requirements for snackbars, etc.
    Get.testMode = true;

    // Initialize mocks and the controller before each test
    mockLoginUseCase = MockLoginUseCase();
    mockAuthSession = MockAuthSession();

    // Provide a stable NetworkManager for BaseController.isConnected
    Get.put<NetworkManager>(_TestNetworkManager());

    controller = LoginController(
      loginUseCase: mockLoginUseCase,
      authSession: mockAuthSession,
    );

    // Manually call onInit since GetX bindings don't run in unit tests
    controller.onInit();
  });

  tearDown(() {
    // Clean up GetX dependencies after each test to ensure isolation
    Get.reset();
  });

  group('LoginController Tests', () {
    const validEmail = 'test@example.com';
    const validPassword = 'password123';
    const loginResponse = LoginResponse(
      token: 'fake-jwt-token',
      userId: 123,
      fullName: 'full name',
      email: 'test@example.com',
      expiresIn: 0,
      status: 'status',
    );

    test('Initial state is correct', () {
      expect(controller.isRequesting.value, isFalse);
      expect(controller.isFormValid.value, isFalse);
      expect(controller.emailError.value, isNull);
      expect(controller.passwordError.value, isNull);
    });

    group('Form Validation', () {
      test('isFormValid becomes true when email and password are valid', () {
        controller.emailController.text = validEmail;
        controller.passwordController.text = validPassword;

        // Listeners should update validation automatically
        expect(controller.emailError.value, isNull);
        expect(controller.passwordError.value, isNull);
        expect(controller.isFormValid.value, isTrue);
      });

      test('isFormValid is false if email is invalid', () {
        controller.emailController.text = 'invalid-email';
        controller.passwordController.text = validPassword;

        expect(controller.emailError.value, isNotNull);
        expect(controller.isFormValid.value, isFalse);
      });

      test('isFormValid is false if password is empty', () async {
        controller.emailController.text = validEmail;
        controller.passwordController.text = '';

        // Trigger validation explicitly
        await controller.login();

        expect(controller.passwordError.value, isNotNull);
        expect(controller.isFormValid.value, isFalse);
      });
    });

    group('Login Submission', () {
      testWidgets('login success flow navigates to MainScreen', (tester) async {
        // Arrange: Register minimal routes to support named navigation
        await tester.pumpWidget(
          GetMaterialApp(
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: Scaffold.new),
              GetPage(name: AppRoutes.main, page: Scaffold.new),
              GetPage(name: AppRoutes.verifyOtp, page: Scaffold.new),
            ],
          ),
        );

        controller.emailController.text = validEmail;
        controller.passwordController.text = validPassword;
        when(
          mockLoginUseCase.call(any),
        ).thenAnswer((_) async => const Success(loginResponse));
        when(mockAuthSession.saveToken(any)).thenAnswer((_) async {});

        // Act
        await controller.login();
        await tester.pumpAndSettle(); // Let navigation futures complete

        // Assert
        expect(controller.isRequesting.value, isFalse);
        expect(Get.currentRoute, AppRoutes.main); // Verify correct navigation
        verify(
          mockLoginUseCase.call(
            argThat(
              isA<LoginRequest>()
                  .having((r) => r.email, 'email', validEmail)
                  .having((r) => r.password, 'password', validPassword),
            ),
          ),
        ).called(1);
        verify(mockAuthSession.saveToken(loginResponse.token)).called(1);
      });

      group('Login Submission Failure', () {
        testWidgets(
          'navigates to VerifyOtpScreen on USER_UNVERIFIED failure',
          (tester) async {
            // Arrange: Register minimal routes to support named navigation
            await tester.pumpWidget(
              GetMaterialApp(
                initialRoute: '/',
                getPages: [
                  GetPage(name: '/', page: Scaffold.new),
                  GetPage(name: AppRoutes.main, page: Scaffold.new),
                  GetPage(name: AppRoutes.verifyOtp, page: Scaffold.new),
                ],
              ),
            );
            controller.emailController.text = validEmail;
            controller.passwordController.text = validPassword;

            final unverifiedFailure = ApiFailure(
              ApiErrorResponse(
                  errorCode: 'USER_UNVERIFIED', message: 'Verify your email'),
            );
            when(mockLoginUseCase.call(any))
                .thenAnswer((_) async => Error(unverifiedFailure));

            // Act
            await controller.login();
            await tester.pumpAndSettle(); // Process navigation

            // Assert
            expect(controller.isRequesting.value, isFalse);
            expect(Get.currentRoute, AppRoutes.verifyOtp);
            expect(Get.arguments, validEmail); // Verify email is passed
            verify(
              mockLoginUseCase.call(
                argThat(
                  isA<LoginRequest>()
                      .having((r) => r.email, 'email', validEmail)
                      .having((r) => r.password, 'password', validPassword),
                ),
              ),
            ).called(1);
            verifyNever(mockAuthSession.saveToken(any));
            // Also ensure no snackbar is shown for this specific case
            expect(Get.isSnackbarOpen, isFalse);
          },
        );

        testWidgets('shows error snackbar on generic API failure', (tester) async {
          // Arrange: Widget tree for snackbar host
          await tester.pumpWidget(
            const GetMaterialApp(
              home: Scaffold(),
            ),
          );
          controller.emailController.text = validEmail;
          controller.passwordController.text = validPassword;

          final genericFailure = ApiFailure(
            ApiErrorResponse(
                errorCode: 'INVALID_CREDENTIALS', message: 'Wrong password'),
          );
          when(mockLoginUseCase.call(any))
              .thenAnswer((_) async => Error(genericFailure));

          // Act
          await controller.login();
          await tester.pump(); // Allow snackbar to build

          // Assert
          expect(Get.isSnackbarOpen, isTrue);
          expect(find.text('Wrong password'), findsOneWidget);

          // Cleanup snackbar
          Get.closeAllSnackbars();
          await tester.pumpAndSettle();
        });

        testWidgets('shows error snackbar on ServerFailure', (tester) async {
          // Arrange: Widget tree for snackbar host
          await tester.pumpWidget(
            const GetMaterialApp(
              home: Scaffold(),
            ),
          );
          controller.emailController.text = validEmail;
          controller.passwordController.text = validPassword;

          const serverFailure = ServerFailure(message: 'Server is down');
          when(mockLoginUseCase.call(any))
              .thenAnswer((_) async => const Error(serverFailure));

          // Act
          await controller.login();
          await tester.pump();

          // Assert
          expect(Get.isSnackbarOpen, isTrue);
          expect(find.text('Server is down'), findsOneWidget);

          // Cleanup snackbar
          Get.closeAllSnackbars();
          await tester.pumpAndSettle();
        });
      });

      test('isRequesting state is true during login and false after', () async {
        // Arrange
        controller.emailController.text = validEmail;
        controller.passwordController.text = validPassword;
        when(mockLoginUseCase.call(any))
            .thenAnswer((_) async => const Success(loginResponse));
        when(mockAuthSession.saveToken(any)).thenAnswer((_) async {});

        // Act
        final future = controller.login();

        // Immediately after call
        expect(controller.isRequesting.value, isTrue);

        // Wait completion
        await future;

        // Then
        expect(controller.isRequesting.value, isFalse);
      });

      test('login does not proceed if form is invalid', () async {
        // Arrange: invalid by default

        // Act
        await controller.login();

        // Assert
        verifyNever(mockLoginUseCase.call(any));
      });
    });
  });
}
