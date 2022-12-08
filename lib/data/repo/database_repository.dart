import 'package:flutter/cupertino.dart';
import 'package:flutter_crud/data/model/auth_info.dart';
import 'package:flutter_crud/data/model/user.dart';
import 'package:flutter_crud/data/source/database_source.dart';
import 'package:flutter_crud/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final databaseRepository =
    DataBaseRepository(DataBaseSource(Hive.box<UserEntity>(boxname)));

class DataBaseRepository<T> extends ChangeNotifier implements IDataBaseSource {
  final IDataBaseSource<T> dataBaseSource;
  static final ValueNotifier<AuthInfo?> authChangeNotifier =
      ValueNotifier(null);

  DataBaseRepository(this.dataBaseSource);

  @override
  Future register(UserEntity user) async {
    await _persisAuthinfo(user);
    dataBaseSource.register(user);
  }

  @override
  Future<bool> checkUser(String email) {
    return dataBaseSource.checkUser(email);
  }

  Future<UserEntity> _persisAuthinfo(UserEntity user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('firstName', user.firstName);
    sharedPreferences.setString('lastName', user.lastName);
    sharedPreferences.setInt('phoneNumber', user.phoneNumber);
    sharedPreferences.setString('email', user.email);
    sharedPreferences.setInt('bankAccountNumber', user.bankAccountNumber);
    sharedPreferences.setInt('year', user.year);
    sharedPreferences.setInt('month', user.month);
    sharedPreferences.setInt('day', user.day);
    loadAuthIfo();
    return user;
  }

  Future<void> signout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
    authChangeNotifier.value = null;
  }

  Future<void> loadAuthIfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String firstname = sharedPreferences.getString('firstName') ?? '';
    final String lastname = sharedPreferences.getString('lastName') ?? '';
    final int phoneNumber = sharedPreferences.getInt('phoneNumber') ?? 0;
    final int bankAccountNumber =
        sharedPreferences.getInt('bankAccountNumber') ?? 0;
    final int year = sharedPreferences.getInt('year') ?? 0;
    final int month = sharedPreferences.getInt('month') ?? 0;
    final int day = sharedPreferences.getInt('day') ?? 0;
    final String email = sharedPreferences.getString('email') ?? '';

    if (email.isNotEmpty) {
      authChangeNotifier.value = AuthInfo(
        firstName: firstname,
        lastName: lastname,
        phoneNumber: phoneNumber,
        email: email,
        bankAccountNumber: bankAccountNumber,
        year: year,
        month: month,
        day: day,
      );
    }
  }
}
