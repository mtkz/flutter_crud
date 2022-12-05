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
    const TextStyle defaultTextStyle = TextStyle(fontFamily: 'avenir');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(elevation: 0),
          textTheme: TextTheme(
            bodyText2: defaultTextStyle,
            bodyText1: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
            headline6: defaultTextStyle,
          ),
          colorScheme: const ColorScheme.light(
            primary: ThemeColors.primary,
          )),
      home: const RootScreen(),
    );
  }
}
