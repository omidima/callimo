// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkspaceDtoAdapter extends TypeAdapter<WorkspaceDto> {
  @override
  final int typeId = 2;

  @override
  WorkspaceDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkspaceDto(
      id: fields[0] as String?,
      name: fields[1] as String?,
      displayName: fields[2] as String?,
      description: fields[3] as String?,
      iconHash: fields[4] as String?,
      createAt: fields[5] as int?,
      defaultConversationId: fields[6] as String?,
      organizationId: fields[7] as String?,
      timelineConversationId: fields[8] as String?,
      isInvitation: fields[9] as bool?,
      workerNode: fields[10] as WorkerNodeDto?,
      inviter: fields[11] as UserDto?,
      hasMessage: fields[12] as bool?,
      joinLink: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkspaceDto obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.iconHash)
      ..writeByte(5)
      ..write(obj.createAt)
      ..writeByte(6)
      ..write(obj.defaultConversationId)
      ..writeByte(7)
      ..write(obj.organizationId)
      ..writeByte(8)
      ..write(obj.timelineConversationId)
      ..writeByte(9)
      ..write(obj.isInvitation)
      ..writeByte(10)
      ..write(obj.workerNode)
      ..writeByte(11)
      ..write(obj.inviter)
      ..writeByte(12)
      ..write(obj.hasMessage)
      ..writeByte(13)
      ..write(obj.joinLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkspaceDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WorkerNodeDtoAdapter extends TypeAdapter<WorkerNodeDto> {
  @override
  final int typeId = 3;

  @override
  WorkerNodeDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkerNodeDto(
      uId: fields[1] as String?,
      apiUrl: fields[2] as String?,
      websocketUrl: fields[3] as String?,
      fileUrl: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkerNodeDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.uId)
      ..writeByte(2)
      ..write(obj.apiUrl)
      ..writeByte(3)
      ..write(obj.websocketUrl)
      ..writeByte(4)
      ..write(obj.fileUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkerNodeDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkspaceDto _$WorkspaceDtoFromJson(Map<String, dynamic> json) => WorkspaceDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      description: json['description'] as String?,
      iconHash: json['icon_hash'] as String?,
      createAt: json['create_at'] as int?,
      defaultConversationId: json['default_conversation_id'] as String?,
      organizationId: json['organization_id'] as String?,
      timelineConversationId: json['timeline_conversation_id'] as String?,
      isInvitation: json['is_invitation'] as bool?,
      workerNode: json['worker_node'] == null
          ? null
          : WorkerNodeDto.fromJson(json['worker_node'] as Map<String, dynamic>),
      inviter: json['inviter'] == null
          ? null
          : UserDto.fromJson(json['inviter'] as Map<String, dynamic>),
      hasMessage: json['has_message'] as bool?,
      joinLink: json['join_link'] as String?,
    );

Map<String, dynamic> _$WorkspaceDtoToJson(WorkspaceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_name': instance.displayName,
      'description': instance.description,
      'icon_hash': instance.iconHash,
      'create_at': instance.createAt,
      'default_conversation_id': instance.defaultConversationId,
      'organization_id': instance.organizationId,
      'timeline_conversation_id': instance.timelineConversationId,
      'is_invitation': instance.isInvitation,
      'worker_node': instance.workerNode,
      'inviter': instance.inviter,
      'has_message': instance.hasMessage,
      'join_link': instance.joinLink,
    };

WorkerNodeDto _$WorkerNodeDtoFromJson(Map<String, dynamic> json) =>
    WorkerNodeDto(
      uId: json['u_id'] as String?,
      apiUrl: json['api_url'] as String?,
      websocketUrl: json['websocket_url'] as String?,
      fileUrl: json['file_url'] as String?,
    );

Map<String, dynamic> _$WorkerNodeDtoToJson(WorkerNodeDto instance) =>
    <String, dynamic>{
      'u_id': instance.uId,
      'api_url': instance.apiUrl,
      'websocket_url': instance.websocketUrl,
      'file_url': instance.fileUrl,
    };
