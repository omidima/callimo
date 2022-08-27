// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDtoAdapter extends TypeAdapter<UserDto> {
  @override
  final int typeId = 5;

  @override
  UserDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDto(
      uid: fields[0] as String?,
      username: fields[1] as String?,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      id: fields[4] as String?,
      phoneNumber: fields[5] as String?,
      avatarHash: fields[6] as String?,
      createAt: fields[7] as int?,
      email: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDto obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.avatarHash)
      ..writeByte(7)
      ..write(obj.createAt)
      ..writeByte(8)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      uid: json['uid'] as String?,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      id: json['id'] as String?,
      locale: json['locale'] as String?,
      position: json['position'] as String?,
      nickname: json['nickname'] as String?,
      phoneNumber: json['phone_number'] as String?,
      avatarHash: json['avatar_hash'] as String?,
      createAt: json['create_at'] as int?,
      updateAt: json['update_at'] as int?,
      deleteAt: json['delete_at'] as int?,
      email: json['email'] as String?,
      emailVerified: json['email_verified'] as bool?,
      isBot: json['is_bot'] as bool?,
      lastAvatarUpdateTime: json['last_avatar_update_time'] as int?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'id': instance.id,
      'locale': instance.locale,
      'position': instance.position,
      'nickname': instance.nickname,
      'phone_number': instance.phoneNumber,
      'avatar_hash': instance.avatarHash,
      'create_at': instance.createAt,
      'update_at': instance.updateAt,
      'delete_at': instance.deleteAt,
      'email': instance.email,
      'email_verified': instance.emailVerified,
      'is_bot': instance.isBot,
      'last_avatar_update_time': instance.lastAvatarUpdateTime,
    };
