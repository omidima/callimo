import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 5)
class UserDto {
  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? id;
  String? locale;
  String? position;
  String? nickname;
  @HiveField(5)
  String? phoneNumber;
  @HiveField(6)
  String? avatarHash;
  @HiveField(7)
  int? createAt;
  int? updateAt;
  int? deleteAt;
  @HiveField(8)
  String? email;
  bool? emailVerified;
  bool? isBot;
  int? lastAvatarUpdateTime;

  UserDto({
    this.uid,
    this.username,
    this.firstName,
    this.lastName,
    this.id,
    this.locale,
    this.position,
    this.nickname,
    this.phoneNumber,
    this.avatarHash,
    this.createAt,
    this.updateAt,
    this.deleteAt,
    this.email,
    this.emailVerified,
    this.isBot,
    this.lastAvatarUpdateTime,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  String getDisplayName() {
    if (nickname != null && nickname!.isNotEmpty) {
      return nickname!;
    }

    if (firstName != null &&
        firstName!.isNotEmpty &&
        lastName != null &&
        lastName!.isNotEmpty) {
      return "$firstName $lastName";
    }
    if (firstName != null && firstName!.isNotEmpty) {
      return firstName!;
    }
    if (lastName != null && lastName!.isNotEmpty) {
      return lastName!;
    }

    return username.toString();
  }
}
