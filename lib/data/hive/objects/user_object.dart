import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserObject extends HiveObject {
  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? first_name;
  @HiveField(2)
  String? last_name;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? number;
  @HiveField(5)
  String? avatar;
}