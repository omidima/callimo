

import '../my_membership.dart';
import 'message_dto.dart';

class MessageCreated {
  String? uId;
  String? senderName;
  String? conversationDisplayName;
  String? conversationName;
  String? conversationType;
  MessageDto? message;
  String? workspaceId;
  String? workspaceDisplayName;
  String? UserDisplayName;
  NotifyProps? memberNotifyProps;

  MessageCreated({
    this.uId,
    this.senderName,
    this.conversationDisplayName,
    this.conversationName,
    this.conversationType,
    this.message,
    this.workspaceId,
    this.workspaceDisplayName,
    this.UserDisplayName,
    this.memberNotifyProps,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageCreated &&
          runtimeType == other.runtimeType &&
          uId == other.uId &&
          senderName == other.senderName &&
          conversationDisplayName == other.conversationDisplayName &&
          conversationName == other.conversationName &&
          conversationType == other.conversationType &&
          message == other.message &&
          workspaceId == other.workspaceId &&
          workspaceDisplayName == other.workspaceDisplayName &&
          UserDisplayName == other.UserDisplayName &&
          memberNotifyProps == other.memberNotifyProps);

  @override
  int get hashCode =>
      uId.hashCode ^
      senderName.hashCode ^
      conversationDisplayName.hashCode ^
      conversationName.hashCode ^
      conversationType.hashCode ^
      message.hashCode ^
      workspaceId.hashCode ^
      workspaceDisplayName.hashCode ^
      UserDisplayName.hashCode ^
      memberNotifyProps.hashCode;

  @override
  String toString() {
    return 'MessageCreated{' +
        ' senderName: $senderName,' +
        ' conversationDisplayName: $conversationDisplayName,' +
        ' conversationName: $conversationName,' +
        ' conversationType: $conversationType,' +
        ' message: $message,' +
        ' workspaceId: $workspaceId,' +
        ' workspaceDisplayName: $workspaceDisplayName,' +
        ' UserDisplayName: $UserDisplayName,' +
        ' memberNotifyProps: $memberNotifyProps,' +
        '}';
  }

  MessageCreated copyWith({
    String? uId,
    String? senderName,
    String? conversationDisplayName,
    String? conversationName,
    String? conversationType,
    MessageDto? message,
    String? workspaceId,
    String? workspaceDisplayName,
    String? UserDisplayName,
    NotifyProps? memberNotifyProps,
  }) {
    return MessageCreated(
      uId: uId ?? this.uId,
      senderName: senderName ?? this.senderName,
      conversationDisplayName:
          conversationDisplayName ?? this.conversationDisplayName,
      conversationName: conversationName ?? this.conversationName,
      conversationType: conversationType ?? this.conversationType,
      message: message ?? this.message,
      workspaceId: workspaceId ?? this.workspaceId,
      workspaceDisplayName: workspaceDisplayName ?? this.workspaceDisplayName,
      UserDisplayName: UserDisplayName ?? this.UserDisplayName,
      memberNotifyProps: memberNotifyProps ?? this.memberNotifyProps,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uId,
      'sender_name': this.senderName,
      'conversation_display_name': this.conversationDisplayName,
      'conversation_name': this.conversationName,
      'conversation_type': this.conversationType,
      'message': this.message,
      'workspace_id': this.workspaceId,
      'workspace_display_name': this.workspaceDisplayName,
      'user_display_name': this.UserDisplayName,
      'member_notify_props': this.memberNotifyProps,
    };
  }

  factory MessageCreated.fromMap(dynamic map) {
    return MessageCreated(
      uId: map['uid'],
      senderName: map['sender_name'] ,
      conversationDisplayName: map['conversation_display_name'] ,
      conversationName: map['conversation_name'] ,
      conversationType: map['conversation_type'],
      message: map['message'] != null ? MessageDto.fromJson(map['message']) : null,
      workspaceId: map['workspace_id'] ,
      workspaceDisplayName: map['workspace_display_name'],
      UserDisplayName: map['user_display_name'],
      memberNotifyProps: map['member_notify_props'] != null ? NotifyProps.fromJson(map['member_notify_props']) : null,
    );
  }

}