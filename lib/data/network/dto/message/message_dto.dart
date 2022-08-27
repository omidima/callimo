

import '../direct_replay_dto.dart';
import '../files/files_dto.dart';
import '../forward_dto.dart';
import '../reaction_dto.dart';
import '../thread/thread_dto.dart';

class MessageDto {
  String? id;
  int? createAt;
  int? deleteAt;
  int? editAt;
  String? userId;
  String? conversationId;
  String? threadRootId;
  String? text;
  String? type;
  Props? props;
  List<MessageFile>? files;
  ForwardSourceMessage? forwardSourceMessage;
  DirectReplyMessage? directReplyMessage;
  String? directReplyMessageId;
  String? pendingMessageId;
  ThreadDto? thread;
  List<Reactions>? reactions;
  String? timelineLabel;
  String? workspaceId;
  String? workspaceDisplayName;

  MessageDto(
      {this.id,
      this.createAt,
      this.deleteAt,
      this.editAt,
      this.userId,
      this.conversationId,
      this.threadRootId,
      this.text,
      this.type,
      this.props,
      this.files,
      this.forwardSourceMessage,
      this.directReplyMessage,
      this.directReplyMessageId,
      this.pendingMessageId,
      this.thread,
      this.reactions,
      this.timelineLabel,
      this.workspaceId,
      this.workspaceDisplayName});

  MessageDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createAt = json['create_at'];
    deleteAt = json['delete_at'];
    editAt = json['edit_at'];
    userId = json['user_id'];
    conversationId = json['conversation_id'];
    threadRootId = json['thread_root_id'];
    text = json['text'];
    type = json['type'];
    props = json['props'] != null ? Props.fromJson(json['props']) : null;
    if (json['files'] != null) {
      files = <MessageFile>[];
      json['files'].forEach((v) {
        files!.add(MessageFile.fromJson(v));
      });
    }
    forwardSourceMessage = json['forward_source_message'] != null
        ? ForwardSourceMessage.fromJson(json['forward_source_message'])
        : null;
    directReplyMessage = json['direct_reply_message'] != null
        ? DirectReplyMessage.fromJson(json['direct_reply_message'])
        : null;
    directReplyMessageId = json['direct_reply_message_id'];
    pendingMessageId = json['pending_message_id'];
    thread = json['thread'] != null ? ThreadDto.fromJson(json['thread']) : null;
    if (json['reactions'] != null) {
      reactions = <Reactions>[];
      json['reactions'].forEach((v) {
        reactions!.add(Reactions.fromJson(v));
      });
    }
    timelineLabel = json['timeline_label'];
    workspaceId = json['workspace_id'];
    workspaceDisplayName = json['workspace_display_name'];
  }

  MessageDto.fromSocket(Map<String, dynamic> json) {
    id = json['uid'];
    createAt = json['create_at'];
    deleteAt = json['delete_at'];
    editAt = json['edit_at'];
    userId = json['user_id'];
    conversationId = json['conversation_id'];
    threadRootId = json['thread_root_id'];
    text = json['text'];
    type = json['type'];
    props = json['props'] != null ? Props.fromJson(json['props']) : null;
    if (json['files'] != null) {
      files = <MessageFile>[];
      json['files'].forEach((v) {
        files!.add(MessageFile.fromJson(v));
      });
    }
    forwardSourceMessage = json['forward_source_message'] != null
        ? ForwardSourceMessage.fromJson(json['forward_source_message'])
        : null;
    directReplyMessage = json['direct_reply_message'] != null
        ? DirectReplyMessage.fromJson(json['direct_reply_message'])
        : null;
    directReplyMessageId = json['direct_reply_message_id'];
    pendingMessageId = json['pending_message_id'];
    thread = json['thread'] != null ? ThreadDto.fromJson(json['thread']) : null;
    if (json['reactions'] != null) {
      reactions = <Reactions>[];
      json['reactions'].forEach((v) {
        reactions!.add(Reactions.fromJson(v));
      });
    }
    timelineLabel = json['timeline_label'];
    workspaceId = json['workspace_id'];
    workspaceDisplayName = json['workspace_display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['create_at'] = this.createAt;
    data['delete_at'] = this.deleteAt;
    data['edit_at'] = this.editAt;
    data['user_id'] = this.userId;
    data['conversation_id'] = this.conversationId;
    data['thread_root_id'] = this.threadRootId;
    data['text'] = this.text;
    data['type'] = this.type;
    if (this.props != null) {
      data['props'] = this.props!.toJson();
    }
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    if (this.forwardSourceMessage != null) {
      data['forward_source_message'] = this.forwardSourceMessage!.toJson();
    }
    if (this.directReplyMessage != null) {
      data['direct_reply_message'] = this.directReplyMessage!.toJson();
    }
    data['direct_reply_message_id'] = this.directReplyMessageId;
    data['pending_message_id'] = this.pendingMessageId;
    if (this.thread != null) {
      data['thread'] = this.thread!.toJson();
    }
    if (this.reactions != null) {
      data['reactions'] = this.reactions!.map((v) => v.toJson()).toList();
    }
    data['timeline_label'] = this.timelineLabel;
    data['workspace_id'] = this.workspaceId;
    data['workspace_display_name'] = this.workspaceDisplayName;
    return data;
  }

  // MessageFull toMessageFull() => MessageFull(
  //     id: this.id,
  //     createAt: this.createAt,
  //     deleteAt: this.deleteAt,
  //     editAt: this.editAt,
  //     userId: this.userId,
  //     conversationId: this.conversationId,
  //     threadRootId: this.threadRootId,
  //     text: this.text,
  //     type: this.type,
  //     props: this.props,
  //     files: this.files,
  //     forwardSourceMessage: this.forwardSourceMessage,
  //     directReplyMessage: this.directReplyMessage,
  //     directReplyMessageId: this.directReplyMessageId,
  //     pendingMessageId: this.pendingMessageId,
  //     thread: this.thread,
  //     reactions: this.reactions,
  //     timelineLabel: this.timelineLabel,
  //     workspaceId: this.workspaceId,
  //     workspaceDisplayName: this.workspaceDisplayName);
  @override
  String toString() {
    return 'MessageDto{' +
        ' id: $id,' +
        ' createAt: $createAt,' +
        ' deleteAt: $deleteAt,' +
        ' editAt: $editAt,' +
        ' userId: $userId,' +
        ' conversationId: $conversationId,' +
        ' threadRootId: $threadRootId,' +
        ' text: $text,' +
        ' type: $type,' +
        ' props: $props,' +
        ' files: $files,' +
        ' forwardSourceMessage: $forwardSourceMessage,' +
        ' directReplyMessage: $directReplyMessage,' +
        ' directReplyMessageId: $directReplyMessageId,' +
        ' pendingMessageId: $pendingMessageId,' +
        ' thread: $thread,' +
        ' reactions: $reactions,' +
        ' timelineLabel: $timelineLabel,' +
        ' workspaceId: $workspaceId,' +
        ' workspaceDisplayName: $workspaceDisplayName,' +
        '}';
  }
}

class Props {
  String? userId;
  String? username;
  String? newConversationName;
  String? addedUsername;
  String? addedUserId;
  String? removedUserId;
  String? removedUsername;
  String? oldConversationName;
  List<String>? mentions;
  Props();
  Props.fromJson(Map<String, dynamic> json) {
    this.userId = json['userId'];
    this.username = json['username'];
    this.newConversationName = json['newConversationName'];
    this.oldConversationName = json['oldConversationName'];
    this.addedUsername = json['addedUsername'];
    this.addedUserId = json['addedUserId'];
    this.removedUsername = json['removedUsername'];
    this.removedUserId = json['removedUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['newConversationName'] = this.newConversationName;
    data['oldConversationName'] = this.oldConversationName;
    data['addedUsername'] = this.addedUsername;
    data['addedUserId'] = this.addedUserId;
    data['removedUsername'] = this.removedUsername;
    data['removedUserId'] = this.removedUserId;
    return data;
  }
}
