

import '../message/message_dto.dart';
import '../participants_dto.dart';

class ThreadDto {
  ThreadDto({
    String? uid,
    String? rootMessageId,
    String? conversationId,
    int? messageCount,
    List<Participants>? participants,
    int? lastActivityDate,
    bool? isUnread,
    bool? isMentioned,
    bool? isFollowed,
    List<MessageDto>? messages,
  }) {
    _uid = uid;
    _rootMessageId = rootMessageId;
    _conversationId = conversationId;
    _messageCount = messageCount;
    _participants = participants;
    _lastActivityDate = lastActivityDate;
    _isUnread = isUnread;
    _isMentioned = isMentioned;
    _isFollowed = isFollowed;
    _messages = messages;
  }

  String? _uid;
  String? _rootMessageId;
  String? _conversationId;
  int? _messageCount;
  List<Participants>? _participants;
  int? _lastActivityDate;
  bool? _isUnread;
  bool? _isMentioned;
  bool? _isFollowed;
  List<MessageDto>? _messages;

  String? get uid => _uid;
  String? get rootMessageId => _rootMessageId;
  String? get conversationId => _conversationId;
  int? get messageCount => _messageCount;
  List<Participants>? get participants => _participants;
  int? get lastActivityDate => _lastActivityDate;
  bool? get isUnread => _isUnread;
  bool? get isMentioned => _isMentioned;
  bool? get isFollowed => _isFollowed;
  List<MessageDto>? get messages => _messages;
  set setMessges(List<MessageDto>? messages) => _messages = messages;

  // ThreadFull toThreadFull(List<MessageFull>? messageFull) => ThreadFull(
  //     uid: this.uid,
  //     rootMessageId: this.rootMessageId,
  //     conversationId: this.conversationId,
  //     messageCount: this.messageCount,
  //     participants: this.participants,
  //     lastActivityDate: this.lastActivityDate,
  //     isUnread: this.isUnread,
  //     isMentioned: this.isMentioned,
  //     isFollowed: this.isFollowed,
  //     messages: (messageFull == null)
  //         ? this.messages?.map((e) => e.toMessageFull()).toList()
  //         : messageFull);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['root_message_id'] = _rootMessageId;
    map['conversation_id'] = _conversationId;
    map['message_count'] = _messageCount;
    if (_participants != null) {
      map['participants'] = _participants?.map((v) => v.toJson()).toList();
    }
    map['last_activity_date'] = _lastActivityDate;
    map['is_unread'] = _isUnread;
    map['is_mentioned'] = _isMentioned;
    map['is_followed'] = _isFollowed;
    if (_messages != null) {
      map['messages'] = _messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  ThreadDto.fromJson(dynamic json) {
    _uid = json['uid'];
    _rootMessageId = json['root_message_id'];
    _conversationId = json['conversation_id'];
    _messageCount = json['message_count'];
    if (json['participants'] != null) {
      _participants = [];
      json['participants'].forEach((v) {
        _participants?.add(Participants.fromJson(v));
      });
    }
    _lastActivityDate = json['last_activity_date'];
    _isUnread = json['is_unread'];
    _isMentioned = json['is_mentioned'];
    _isFollowed = json['is_followed'];
    if (json['messages'] != null) {
      _messages = [];
      json['messages'].forEach((v) {
        _messages?.add(MessageDto.fromJson(v));
      });
    }
  }
}
