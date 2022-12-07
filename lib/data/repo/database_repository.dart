import 'package:flutter/cupertino.dart';
import 'package:flutter_crud/data/model/user.dart';
import 'package:flutter_crud/data/source/database_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseRepository<T> extends ChangeNotifier implements IDataBaseSource {
  final IDataBaseSource<T> dataBaseSource;

  DataBaseRepository(this.dataBaseSource);

  @override
  Future register(UserEntity user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('firstName', user.firstName);
    sharedPreferences.setString('lastName', user.lastName);
    sharedPreferences.setInt('phoneNumber', user.phoneNumber);
    sharedPreferences.setString('email', user.email);
    sharedPreferences.setInt('bankAccountNumber', user.bankAccountNumber);
    return dataBaseSource.register(user);
  }

  @override
  Future<bool> checkUser(int phoneNumber) {
    return dataBaseSource.checkUser(phoneNumber);
  }
}
