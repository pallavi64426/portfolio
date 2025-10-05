import 'package:flutter/material.dart';
import 'themes.dart';
import 'portfolio_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pallavi Singh Portfolio',
      theme: AppThemes.darkTheme,
      scrollBehavior: ScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
      home: const PortfolioPage(),
    );
  }
}
