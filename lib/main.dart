import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/injection/app_binding.dart';
import 'package:pkp_hub/app/theme/app_theme.dart';
import 'package:pkp_hub/app/widgets/debug_chucker_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:chucker_flutter/chucker_flutter.dart';

import 'app/navigation/app_pages.dart';
import 'app/theme/app_colors.dart';

Future<void> startApp({required String flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: AppBinding(flavor: flavor),
      builder: (context, child) {
        return DebugChuckerButtonHost(child: child);
      },
    ),
  );
}
