import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/injection/app_binding.dart';
import 'package:pkp_hub/app/theme/app_theme.dart';

import 'app/navigation/app_pages.dart';

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

  runApp(
    GetMaterialApp(
      title: 'PKP Hub',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: AppBinding(flavor: flavor),
    ),
  );
}
