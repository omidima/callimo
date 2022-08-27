import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../my_membership.dart';
import '../user/user_dto.dart';

part 'workspace_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 2)
class WorkspaceDto {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? displayName;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? iconHash;
  @HiveField(5)
  int? createAt;
  @HiveField(6)
  String? defaultConversationId;
  @HiveField(7)
  String? organizationId;
  @HiveField(8)
  String? timelineConversationId;
  @HiveField(9)
  bool? isInvitation;
  @HiveField(10)
  WorkerNodeDto? workerNode;
  @HiveField(11)
  UserDto? inviter;
  @HiveField(12)
  bool? hasMessage;
  @HiveField(13)
  String? joinLink;
  WorkspaceDto({
    this.id,
    this.name,
    this.displayName,
    this.description,
    this.iconHash,
    this.createAt,
    this.defaultConversationId,
    this.organizationId,
    this.timelineConversationId,
    this.isInvitation,
    this.workerNode,
    this.inviter,
    this.hasMessage,
    this.joinLink,
  });

  factory WorkspaceDto.fromJson(Map<String, dynamic> json) {
    return _$WorkspaceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkspaceDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 3)
class WorkerNodeDto {
  @HiveField(1)
  String? uId;
  @HiveField(2)
  String? apiUrl;
  @HiveField(3)
  String? websocketUrl;
  @HiveField(4)
  String? fileUrl;

  WorkerNodeDto({
    this.uId,
    this.apiUrl,
    this.websocketUrl,
    this.fileUrl,
  });

  factory WorkerNodeDto.fromJson(Map<String, dynamic> json) =>
      _$WorkerNodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerNodeDtoToJson(this);
}
