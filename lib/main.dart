import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const ModaUygulamasiApp());
}

class ModaUygulamasiApp extends StatelessWidget {
  const ModaUygulamasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moda Uygulamasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFA56D47),
          primary: const Color(0xFFA56D47),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}