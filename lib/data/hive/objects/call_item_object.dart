import 'package:hive_flutter/hive_flutter.dart';

part 'call_item_object.g.dart';

@HiveType(typeId: 1)
class CallItemObject extends HiveObject {
  @HiveField(6, defaultValue: "")
  late String id;

  @HiveField(0, defaultValue: "")
  late String name;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? iconHash;

  @HiveField(3, defaultValue: 0)
  int? createdAt;

  @HiveField(4, defaultValue: "")
  late String adminLink;

  @HiveField(5)
  String? publicLink;
}
