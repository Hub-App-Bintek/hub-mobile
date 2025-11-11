import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/injection/app_binding.dart';
import 'package:pkp_hub/app/theme/app_theme.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';
import 'package:pkp_hub/features/main/bindings/projects_binding.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';

import 'app/navigation/app_pages.dart';
import 'app/theme/app_colors.dart';

Future<void> startApp({required String flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the correct .env file before runApp
  final envFile = switch (flavor) {
    'development' => '.env.development',
    'staging' => '.env.staging',
    'production' => '.env.production',
    _ => '.env.development',
  };
  await dotenv.load(fileName: envFile);

  // Initialize intl date symbols for Indonesian locale once
  await initializeDateFormatting('id_ID');
  Intl.defaultLocale = 'id_ID';

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: AppColors.white),
  );

  runApp(
    GetMaterialApp(
      title: AppStrings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: AppBinding(flavor: flavor),
      routingCallback: (routing) {
        final isBackToMain =
            routing?.current == AppRoutes.main && routing?.previous != null;
        if (!isBackToMain) return;

        if (!Get.isRegistered<MainController>()) return;
        final mainController = Get.find<MainController>();

        switch (mainController.selectedIndex.value) {
          case 0:
            if (Get.isRegistered<HomeController>()) {
              Get.find<HomeController>().refresh();
            }
            break;
          case 1:
            if (Get.isRegistered<ProjectsController>(
              tag: ProjectsBinding.mainTag,
            )) {
              Get.find<ProjectsController>(
                tag: ProjectsBinding.mainTag,
              ).refreshProjects();
            }
            break;
          default:
            break;
        }
      },
    ),
  );
}
