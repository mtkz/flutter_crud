import 'package:flutter/material.dart';
import 'package:flutter_crud/common/constants.dart';
import 'package:flutter_crud/data/model/user.dart';
import 'package:flutter_crud/data/repo/database_repository.dart';
import 'package:flutter_crud/data/source/database_source.dart';
import 'package:flutter_crud/theme/colors.dart';
import 'package:flutter_crud/ui/screens/root.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

const String boxname = 'users';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<UserEntity>(UserEntityAdapter());
  await Hive.openBox<UserEntity>(boxname);
  runApp(ChangeNotifierProvider<DataBaseRepository<UserEntity>>(
    create: (BuildContext context) =>
        DataBaseRepository<UserEntity>(DataBaseSource(Hive.box(boxname))),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle defaultTextStyle = TextStyle(fontFamily: 'avenir');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: ThemeColors.scaffoldColor,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: ThemeColors.primaryText),
            elevation: 0,
            color: Colors.white,
            centerTitle: true,
          ),
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
            headline6:
                defaultTextStyle.copyWith(color: ThemeColors.primaryText),
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
