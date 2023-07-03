import 'package:flutter/material.dart';
import 'package:furniture_app_ui_challenge/src/src.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture app UI challenge',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          primaryColor,
          <int, Color>{
            50: const Color(primaryColor).withOpacity(0.1),
            100: const Color(primaryColor).withOpacity(0.2),
            200: const Color(primaryColor).withOpacity(0.3),
            300: const Color(primaryColor).withOpacity(0.4),
            400: const Color(primaryColor).withOpacity(0.5),
            500: const Color(primaryColor).withOpacity(0.6),
            600: const Color(primaryColor).withOpacity(0.7),
            700: const Color(primaryColor).withOpacity(0.8),
            800: const Color(primaryColor).withOpacity(0.9),
            900: const Color(primaryColor).withOpacity(1.0),
          },
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(primaryColor),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.grey[50]!,
          ),
        ),
        scaffoldBackgroundColor: Colors.grey[50],
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey[50]),
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.grey[50]),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(primaryColor),
            ),
            foregroundColor: MaterialStateProperty.all(
              Colors.grey[100],
            ),
          ),
        ),
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(primaryColor)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
