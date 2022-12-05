import 'package:flutter/material.dart';
import 'package:flutter_crud/theme/colors.dart';
import 'package:flutter_crud/ui/screens/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(elevation: 0),
          colorScheme: const ColorScheme.light(
            primary: ThemeColors.primary,
          )),
      home: const RootScreen(),
    );
  }
}
