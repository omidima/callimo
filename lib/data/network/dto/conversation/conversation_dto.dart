import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:callimoo/data/network/dto/my_membership.dart';

part 'conversation_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 4)
class ConversationDto {
  @HiveField(0)
  String? id;
  @HiveField(1)
  int? createAt;
  @HiveField(2)
  int? updateAt;
  @HiveField(3)
  int? deleteAt;
  @HiveField(4)
  String? workspaceId;
  @HiveField(5)
  String? type;
  @HiveField(6)
  String? displayName;
  @HiveField(7)
  String? header;
  @HiveField(8)
  String? purpose;
  @HiveField(9)
  int? totalMsgCount;
  @HiveField(10)
  String? creatorId;
  @HiveField(11)
  String? iconHash;
  @HiveField(12)
  bool? archived;
  @HiveField(13)
  String? directUserId;
  @HiveField(14)
  int? directUserLastSeenAt;
  @HiveField(15)
  String? directUserFirstName;
  @HiveField(16)
  String? directUserLastName;
  @HiveField(17)
  String? directUserDisplayName;
  @HiveField(18)
  String? directUserUsername;

  ConversationDto({
    this.id,
    this.createAt,
    this.updateAt,
    this.deleteAt,
    this.workspaceId,
    this.type,
    this.displayName,
    this.header,
    this.purpose,
    this.totalMsgCount,
    this.creatorId,
    this.iconHash,
    this.archived,
    this.directUserId,
    this.directUserLastSeenAt,
    this.directUserFirstName,
    this.directUserLastName,
    this.directUserDisplayName,
    this.directUserUsername,
  });

  factory ConversationDto.fromJson(Map<String, dynamic> json) =>
      _$ConversationDtoFromJson(json);

  Map<String, dynamic> tojson() => _$ConversationDtoToJson(this);
}
