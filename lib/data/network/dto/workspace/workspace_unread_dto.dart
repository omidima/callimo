
class WorkspaceUnreadDto {
  String? _workspaceId;
  int? _msgCount;
  int? _mentionCount;
  int? _mutedImportantMsgCount;
  int? _unreadThreadsCount;
  int? _threadsMentionCount;
  List<UnreadConversations>? _unreadConversations;
  List<MentionedConversations>? _mentionedConversations;
  List<UnreadThreads>? _unreadThreads;
  List<MentionedThreads>? _mentionedThreads;

  String? get workspaceId => _workspaceId;
  int? get msgCount => _msgCount;
  int? get mentionCount => _mentionCount;
  int? get mutedImportantMsgCount => _mutedImportantMsgCount;
  int? get unreadThreadsCount => _unreadThreadsCount;
  int? get threadsMentionCount => _threadsMentionCount;
  List<UnreadConversations>? get unreadConversations => _unreadConversations;
  List<MentionedConversations>? get mentionedConversations => _mentionedConversations;
  List<UnreadThreads>? get unreadThreads => _unreadThreads;
  List<MentionedThreads>? get mentionedThreads => _mentionedThreads;

  WorkspaceUnreadDto({
      String? workspaceId, 
      int? msgCount, 
      int? mentionCount, 
      int? mutedImportantMsgCount, 
      int? unreadThreadsCount, 
      int? threadsMentionCount, 
      List<UnreadConversations>? unreadConversations,
      List<MentionedConversations>? mentionedConversations,
      List<UnreadThreads>? unreadThreads,
      List<MentionedThreads>? mentionedThreads}){
    _workspaceId = workspaceId;
    _msgCount = msgCount;
    _mentionCount = mentionCount;
    _mutedImportantMsgCount = mutedImportantMsgCount;
    _unreadThreadsCount = unreadThreadsCount;
    _threadsMentionCount = threadsMentionCount;
    _unreadConversations = unreadConversations;
    _mentionedConversations = mentionedConversations;
    _unreadThreads = unreadThreads;
    _mentionedThreads = mentionedThreads;
}

  WorkspaceUnreadDto.fromJson(dynamic json) {
    _workspaceId = json['workspace_id'];
    _msgCount = json['msg_count'];
    _mentionCount = json['mention_count'];
    _mutedImportantMsgCount = json['muted_important_msg_count'];
    _unreadThreadsCount = json['unread_threads_count'];
    _threadsMentionCount = json['threads_mention_count'];
    if (json['unread_conversations'] != null) {
      _unreadConversations = [];
      json['unread_conversations'].forEach((v) {
        _unreadConversations?.add(UnreadConversations.fromJson(v));
      });
    }
    if (json['mentioned_conversations'] != null) {
      _mentionedConversations = [];
      json['mentioned_conversations'].forEach((v) {
        _mentionedConversations?.add(MentionedConversations.fromJson(v));
      });
    }
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

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['workspace_id'] = _workspaceId;
    map['msg_count'] = _msgCount;
    map['mention_count'] = _mentionCount;
    map['muted_important_msg_count'] = _mutedImportantMsgCount;
    map['unread_threads_count'] = _unreadThreadsCount;
    map['threads_mention_count'] = _threadsMentionCount;
    if (_unreadConversations != null) {
      map['unread_conversations'] = _unreadConversations?.map((v) => v.toJson()).toList();
    }
    if (_mentionedConversations != null) {
      map['mentioned_conversations'] = _mentionedConversations?.map((v) => v.toJson()).toList();
    }
    if (_unreadThreads != null) {
      map['unread_threads'] = _unreadThreads?.map((v) => v.toJson()).toList();
    }
    if (_mentionedThreads != null) {
      map['mentioned_threads'] = _mentionedThreads?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  hasMessage() {
    if (
        (_mentionCount!=null && _mentionCount! > 0) ||
        (_unreadThreadsCount!=null && _unreadThreadsCount! > 0) ||
        (_threadsMentionCount!=null && _threadsMentionCount! > 0) ||
        (_unreadConversations!=null && _unreadConversations!.length > 0) ||
        (_mentionedConversations!=null && _mentionedConversations!.length > 0) ||
        (_unreadThreads!=null && _unreadThreads!.length > 0) ||
        (_mentionedThreads!=null && _mentionedThreads!.length > 0)
    ) {
      return true;
    }
    return false;
  }
}


class MentionedThreads {
  String? _rootMessageId;

  String? get rootMessageId => _rootMessageId;

  MentionedThreads({
      String? rootMessageId}){
    _rootMessageId = rootMessageId;
}

  MentionedThreads.fromJson(dynamic json) {
    _rootMessageId = json['root_message_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['root_message_id'] = _rootMessageId;
    return map;
  }

}

class UnreadThreads {
  String? _rootMessageId;

  String? get rootMessageId => _rootMessageId;

  UnreadThreads({
      String? rootMessageId}){
    _rootMessageId = rootMessageId;
}

  UnreadThreads.fromJson(dynamic json) {
    _rootMessageId = json['root_message_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['root_message_id'] = _rootMessageId;
    return map;
  }

}

class MentionedConversations {
  String? _conversationId;
  String? _workspaceId;
  int? _unreadCount;

  String? get conversationId => _conversationId;
  String? get workspaceId => _workspaceId;
  int? get unreadCount => _unreadCount;

  MentionedConversations({
      String? conversationId, 
      String? workspaceId, 
      int? unreadCount}){
    _conversationId = conversationId;
    _workspaceId = workspaceId;
    _unreadCount = unreadCount;
}

  MentionedConversations.fromJson(dynamic json) {
    _conversationId = json['conversation_id'];
    _workspaceId = json['workspace_id'];
    _unreadCount = json['unread_count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['conversation_id'] = _conversationId;
    map['workspace_id'] = _workspaceId;
    map['unread_count'] = _unreadCount;
    return map;
  }

}

class UnreadConversations {
  String? _conversationId;
  String? _workspaceId;
  int? _unreadCount;

  String? get conversationId => _conversationId;
  String? get workspaceId => _workspaceId;
  int? get unreadCount => _unreadCount;

  UnreadConversations({
      String? conversationId, 
      String? workspaceId, 
      int? unreadCount}){
    _conversationId = conversationId;
    _workspaceId = workspaceId;
    _unreadCount = unreadCount;
}

  UnreadConversations.fromJson(dynamic json) {
    _conversationId = json['conversation_id'];
    _workspaceId = json['workspace_id'];
    _unreadCount = json['unread_count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['conversation_id'] = _conversationId;
    map['workspace_id'] = _workspaceId;
    map['unread_count'] = _unreadCount;
    return map;
  }

}