import 'package:flutter_crud/data/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:collection/collection.dart';

abstract class IDataBaseSource<T> {
  Future<T> register(UserEntity user);
  Future<bool> checkUser(int phoneNumber);
}

class DataBaseSource implements IDataBaseSource<UserEntity> {
  final Box<UserEntity> box;

  DataBaseSource(this.box);

  @override
  Future<UserEntity> register(UserEntity user) async {
    await box.add(user);
    return user;
  }

  @override
  Future<bool> checkUser(int phoneNumber) async {
    final user =
        box.values.firstWhereOrNull((element) => element.phoneNumber == phoneNumber );
    if (user != null) {
      return false;
    }
    return true;
  }
}
