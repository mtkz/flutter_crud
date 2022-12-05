import 'package:flutter/material.dart';
import 'package:flutter_crud/common/constants.dart';
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
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(10),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ThemeColors.border, width: 1),
              borderRadius:
                  BorderRadius.circular(ThemeConstants.themeBorderRadius),
            ),
          ),
          textTheme: TextTheme(
            bodyText2: defaultTextStyle,
            bodyText1: defaultTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
            headline6: defaultTextStyle,
            headline5: defaultTextStyle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: const ColorScheme.light(
            primary: ThemeColors.primary,
            onPrimary: ThemeColors.onPrimary,
          )),
      home: const RootScreen(),
    );
  }
}
