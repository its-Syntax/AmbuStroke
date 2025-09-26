import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'views/home_view.dart';

void main() {
  runApp(const NihssApp());
}

class NihssApp extends StatelessWidget {
  const NihssApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIHSS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomeView(),
    );
  }
}
