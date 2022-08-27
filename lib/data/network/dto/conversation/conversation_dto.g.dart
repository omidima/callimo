// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConversationDtoAdapter extends TypeAdapter<ConversationDto> {
  @override
  final int typeId = 4;

  @override
  ConversationDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConversationDto(
      id: fields[0] as String?,
      createAt: fields[1] as int?,
      updateAt: fields[2] as int?,
      deleteAt: fields[3] as int?,
      workspaceId: fields[4] as String?,
      type: fields[5] as String?,
      displayName: fields[6] as String?,
      header: fields[7] as String?,
      purpose: fields[8] as String?,
      totalMsgCount: fields[9] as int?,
      creatorId: fields[10] as String?,
      iconHash: fields[11] as String?,
      archived: fields[12] as bool?,
      directUserId: fields[13] as String?,
      directUserLastSeenAt: fields[14] as int?,
      directUserFirstName: fields[15] as String?,
      directUserLastName: fields[16] as String?,
      directUserDisplayName: fields[17] as String?,
      directUserUsername: fields[18] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ConversationDto obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createAt)
      ..writeByte(2)
      ..write(obj.updateAt)
      ..writeByte(3)
      ..write(obj.deleteAt)
      ..writeByte(4)
      ..write(obj.workspaceId)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.displayName)
      ..writeByte(7)
      ..write(obj.header)
      ..writeByte(8)
      ..write(obj.purpose)
      ..writeByte(9)
      ..write(obj.totalMsgCount)
      ..writeByte(10)
      ..write(obj.creatorId)
      ..writeByte(11)
      ..write(obj.iconHash)
      ..writeByte(12)
      ..write(obj.archived)
      ..writeByte(13)
      ..write(obj.directUserId)
      ..writeByte(14)
      ..write(obj.directUserLastSeenAt)
      ..writeByte(15)
      ..write(obj.directUserFirstName)
      ..writeByte(16)
      ..write(obj.directUserLastName)
      ..writeByte(17)
      ..write(obj.directUserDisplayName)
      ..writeByte(18)
      ..write(obj.directUserUsername);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationDto _$ConversationDtoFromJson(Map<String, dynamic> json) =>
    ConversationDto(
      id: json['id'] as String?,
      createAt: json['create_at'] as int?,
      updateAt: json['update_at'] as int?,
      deleteAt: json['delete_at'] as int?,
      workspaceId: json['workspace_id'] as String?,
      type: json['type'] as String?,
      displayName: json['display_name'] as String?,
      header: json['header'] as String?,
      purpose: json['purpose'] as String?,
      totalMsgCount: json['total_msg_count'] as int?,
      creatorId: json['creator_id'] as String?,
      iconHash: json['icon_hash'] as String?,
      archived: json['archived'] as bool?,
      directUserId: json['direct_user_id'] as String?,
      directUserLastSeenAt: json['direct_user_last_seen_at'] as int?,
      directUserFirstName: json['direct_user_first_name'] as String?,
      directUserLastName: json['direct_user_last_name'] as String?,
      directUserDisplayName: json['direct_user_display_name'] as String?,
      directUserUsername: json['direct_user_username'] as String?,
    );

Map<String, dynamic> _$ConversationDtoToJson(ConversationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'create_at': instance.createAt,
      'update_at': instance.updateAt,
      'delete_at': instance.deleteAt,
      'workspace_id': instance.workspaceId,
      'type': instance.type,
      'display_name': instance.displayName,
      'header': instance.header,
      'purpose': instance.purpose,
      'total_msg_count': instance.totalMsgCount,
      'creator_id': instance.creatorId,
      'icon_hash': instance.iconHash,
      'archived': instance.archived,
      'direct_user_id': instance.directUserId,
      'direct_user_last_seen_at': instance.directUserLastSeenAt,
      'direct_user_first_name': instance.directUserFirstName,
      'direct_user_last_name': instance.directUserLastName,
      'direct_user_display_name': instance.directUserDisplayName,
      'direct_user_username': instance.directUserUsername,
    };
