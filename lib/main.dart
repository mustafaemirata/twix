import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twitter/pages/register_page.dart';
import 'package:twitter/themes/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
