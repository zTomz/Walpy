import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walpy/pages/explore_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Walpy',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3a86ff),
        ),
        scaffoldBackgroundColor: const Color(0xFFE3F2FD),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.nunito().copyWith(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              height: 1),
          bodyText1: GoogleFonts.nunito().copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
      ),
      routes: {
        "/home": (context) => const ExplorePage(),
        "/explore": (context) => const ExplorePage(),
      },
      initialRoute: "/home",
    );
  }
}
