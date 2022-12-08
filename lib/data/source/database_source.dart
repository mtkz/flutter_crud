import 'package:flutter_crud/data/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:collection/collection.dart';

abstract class IDataBaseSource<T> {
  Future<T> register(UserEntity user);
  Future<bool> checkUser(String email);
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
  Future<bool> checkUser(String email) async {
    final user = box.values
        .firstWhereOrNull((element) => element.email == email);
    if (user == null) {
      return false;
    }
    return true;
  }
}
