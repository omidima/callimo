class ThreadUnreadDto {
  ThreadUnreadDto({
      int? unreadThreadsCount, 
      int? threadsMentionCount, 
      List<UnreadThreads>? unreadThreads, 
      List<MentionedThreads>? mentionedThreads,}){
    _unreadThreadsCount = unreadThreadsCount;
    _threadsMentionCount = threadsMentionCount;
    _unreadThreads = unreadThreads;
    _mentionedThreads = mentionedThreads;
}

  ThreadUnreadDto.fromJson(dynamic json) {
    _unreadThreadsCount = json['unread_threads_count'];
    _threadsMentionCount = json['threads_mention_count'];
    if (json['unread_threads'] != null) {
      _unreadThreads = [];
      json['unread_threads'].forEach((v) {
        _unreadThreads?.add(UnreadThreads.fromJson(v));
      });
    }
    if (json['mentioned_threads'] != null) {
      _mentionedThreads = [];
      json['mentioned_threads'].forEach((v) {
        _mentionedThreads?.add(MentionedThreads.fromJson(v));
      });
    }
  }
  int? _unreadThreadsCount;
  int? _threadsMentionCount;
  List<UnreadThreads>? _unreadThreads;
  List<MentionedThreads>? _mentionedThreads;

  int? get unreadThreadsCount => _unreadThreadsCount;
  int? get threadsMentionCount => _threadsMentionCount;
  List<UnreadThreads>? get unreadThreads => _unreadThreads;
  List<MentionedThreads>? get mentionedThreads => _mentionedThreads;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['unread_threads_count'] = _unreadThreadsCount;
    map['threads_mention_count'] = _threadsMentionCount;
    if (_unreadThreads != null) {
      map['unread_threads'] = _unreadThreads?.map((v) => v.toJson()).toList();
    }
    if (_mentionedThreads != null) {
      map['mentioned_threads'] = _mentionedThreads?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class MentionedThreads {
  MentionedThreads({
      String? rootMessageId,}){
    _rootMessageId = rootMessageId;
}

  MentionedThreads.fromJson(dynamic json) {
    _rootMessageId = json['root_message_id'];
  }
  String? _rootMessageId;

  String? get rootMessageId => _rootMessageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['root_message_id'] = _rootMessageId;
    return map;
  }

}

class UnreadThreads {
  UnreadThreads({
      String? rootMessageId,}){
    _rootMessageId = rootMessageId;
}

  UnreadThreads.fromJson(dynamic json) {
    _rootMessageId = json['root_message_id'];
  }
  String? _rootMessageId;

  String? get rootMessageId => _rootMessageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['root_message_id'] = _rootMessageId;
    return map;
  }

}