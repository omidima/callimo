import 'dart:convert';

import '../files/files_dto.dart';

class MessageType {
  static const String VOICE_MESSAGE = "VOICE_MESSAGE";
  static const String TEXT_MESSAGE = "TEXT_MESSAGE";
  static const String SYSTEM_MESSAGE = "SYSTEM_MESSAGE";
  static const String GEO_LOCATION = "GEO_LOCATION";
  static const String FILE_MESSAGE = "FILE_MESSAGE";
  static const String IMAGE_MESSAGE = "IMAGE_MESSAGE";

  fromJson(String json) {
    if (json == VOICE_MESSAGE) {
      return VOICE_MESSAGE;
    }
    if (json == TEXT_MESSAGE) {
      return TEXT_MESSAGE;
    }
  }
}

class CreateMessage {
  String? userId;
  String? threadRootId;
  int? createAt;
  String? text;
  String? pendingMessageId;
  List<FilesDto>? files;
  String? type;

  CreateMessage(
      {this.userId,
      this.threadRootId,
      this.createAt,
      this.text,
      this.pendingMessageId,
      this.type,
      this.files});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreateMessage &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          threadRootId == other.threadRootId &&
          createAt == other.createAt &&
          text == other.text &&
          pendingMessageId == other.pendingMessageId);

  @override
  int get hashCode =>
      userId.hashCode ^
      threadRootId.hashCode ^
      createAt.hashCode ^
      text.hashCode ^
      pendingMessageId.hashCode;

  @override
  String toString() {
    return 'MessageUpload{' +
        ' userId: $userId,' +
        ' threadRootId: $threadRootId,' +
        ' createAt: $createAt,' +
        ' text: $text,' +
        ' pendingMessageId: $pendingMessageId,' +
        '}';
  }

  CreateMessage copyWith({
    String? userId,
    String? threadRootId,
    int? createAt,
    String? text,
    String? pendingMessageId,
  }) {
    return CreateMessage(
      userId: userId ?? this.userId,
      threadRootId: threadRootId ?? this.threadRootId,
      createAt: createAt ?? this.createAt,
      text: text ?? this.text,
      type: type ?? this.type,
      pendingMessageId: pendingMessageId ?? this.pendingMessageId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': this.userId,
      'thread_root_id': this.threadRootId,
      'create_at': this.createAt,
      'text': this.text,
      'type': this.type,
      'pending_message_id': this.pendingMessageId,
      'files': files
    };
  }

  factory CreateMessage.fromMap(Map<String, dynamic> map) {
    return CreateMessage(
        userId: map['user_id'] as String,
        threadRootId: map['thread_root_id'] as String,
        createAt: map['create_at'] as int,
        text: map['text'] as String,
        type: map['type'] as String,
        pendingMessageId: map['pending_message_id'] as String,
        files: [FilesDto.fromJson(map['files'])]);
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'thread_root_id': threadRootId,
      'user_id': userId,
      'create_at': createAt,
      'type': type,
      'pending_message_id': pendingMessageId,
      'files': files
    };
  }

  factory CreateMessage.fromJson(Map<String, dynamic> map) {
    return CreateMessage(
        userId: map['user_id'] as String,
        threadRootId: map['thread_root_id'] as String,
        createAt: map['create_at'] as int,
        text: map['text'] as String,
        type: map['type'] as String,
        pendingMessageId: map['pending_message_id'] as String,
        files: [FilesDto.fromJson(map['files'])]);
  }
}
