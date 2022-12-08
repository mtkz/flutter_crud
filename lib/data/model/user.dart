import 'package:hive_flutter/adapters.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserEntity {
  // DateOfBirth
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final int phoneNumber;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final int bankAccountNumber;
  @HiveField(5)
  final int year;
  @HiveField(6)
  final int month;
  @HiveField(7)
  final int day;

  UserEntity(
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.bankAccountNumber,
    this.year,
    this.month,
    this.day,
  );
}
