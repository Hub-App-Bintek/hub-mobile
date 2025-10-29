import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/injection/app_binding.dart';
import 'package:pkp_hub/app/theme/app_theme.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

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
    ),
  );
}
