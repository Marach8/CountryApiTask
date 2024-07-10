import 'package:country_api_task/src/providers/theme_mode_provider.dart';
import 'package:country_api_task/src/utils/themes/app_theme.dart';
import 'package:country_api_task/src/views/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AgroMallTaskAppThemeData.lightTheme,
      darkTheme: AgroMallTaskAppThemeData.darkTheme,
      home: const AgroMallTaskHomepageScreen(),
    );
  }
}