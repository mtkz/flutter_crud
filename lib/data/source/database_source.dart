import 'package:flutter_crud/data/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IDataBaseSource<T> {
  Future<T> register(UserEntity user);
}

class DataBaseSource implements IDataBaseSource<UserEntity> {
  final Box<UserEntity> box;

  DataBaseSource(this.box);

  @override
  Future<UserEntity> register(UserEntity user) async {
    await box.add(user);
    return user;
  }
}
