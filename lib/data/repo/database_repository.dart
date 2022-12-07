import 'package:flutter_crud/data/model/user.dart';
import 'package:flutter_crud/data/source/database_source.dart';

class DataBaseRepository<T> implements IDataBaseSource {
  final IDataBaseSource<T> dataBaseSource;

  DataBaseRepository(this.dataBaseSource);

  @override
  Future register(UserEntity user) {
    return dataBaseSource.register(user);
  }
}
