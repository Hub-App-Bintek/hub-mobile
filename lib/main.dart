import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/injection/dependency_injection.dart';
import 'package:pkp_hub/app/theme/app_theme.dart';

import 'app/navigation/app_pages.dart';

Future<void> startApp({String? flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init(flavor: flavor);

  runApp(
    GetMaterialApp(
      title: 'PKP Hub',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // or ThemeMode.system for auto
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}

void main() async {
  // Default entry uses dart-define FLAVOR (or 'development') via DependencyInjection
  await startApp();
}
