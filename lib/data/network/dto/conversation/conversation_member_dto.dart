
class ConversationMemberDto {
  ConversationMemberDto({
      String? workspaceId, 
      String? conversationId, 
      String? userId, 
      List<String>? roles, 
      int? lastViewedAt, 
      int? msgCount, 
      int? mentionCount, 
      // NotifyProps? notifyProps,
      int? lastUpdateAt,}){
    _workspaceId = workspaceId;
    _conversationId = conversationId;
    _userId = userId;
    _roles = roles;
    _lastViewedAt = lastViewedAt;
    _msgCount = msgCount;
    _mentionCount = mentionCount;
    // _notifyProps = notifyProps;
    _lastUpdateAt = lastUpdateAt;
}

  ConversationMemberDto.fromJson(dynamic json) {
    _workspaceId = json['workspace_id'];
    _conversationId = json['conversation_id'];
    _userId = json['user_id'];
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _lastViewedAt = json['last_viewed_at'];
    _msgCount = json['msg_count'];
    _mentionCount = json['mention_count'];
    // _notifyProps = json['notify_props'] != null ? NotifyProps.fromJson(json['notifyProps']) : null;
    _lastUpdateAt = json['last_update_at'];
  }
  String? _workspaceId;
  String? _conversationId;
  String? _userId;
  List<String>? _roles;
  int? _lastViewedAt;
  int? _msgCount;
  int? _mentionCount;
  // NotifyProps? _notifyProps;
  int? _lastUpdateAt;

  String? get workspaceId => _workspaceId;
  String? get conversationId => _conversationId;
  String? get userId => _userId;
  List<String>? get roles => _roles;
  int? get lastViewedAt => _lastViewedAt;
  int? get msgCount => _msgCount;
  int? get mentionCount => _mentionCount;
  // NotifyProps? get notifyProps => _notifyProps;
  int? get lastUpdateAt => _lastUpdateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['workspace_id'] = _workspaceId;
    map['conversation_id'] = _conversationId;
    map['user_id'] = _userId;
    map['roles'] = _roles;
    map['last_viewed_at'] = _lastViewedAt;
    map['msg_count'] = _msgCount;
    map['mention_count'] = _mentionCount;
    // if (_notifyProps != null) {
    //   map['notify_props'] = _notifyProps?.toJson();
    // }
    map['last_update_at'] = _lastUpdateAt;
    return map;
  }

}

// class NotifyProps {
//   NotifyProps({
//       String? email,
//       String? push,
//       String? desktop,
//       String? markUnread,}){
//     _email = email;
//     _push = push;
//     _desktop = desktop;
//     _markUnread = markUnread;
// }

//   NotifyProps.fromJson(dynamic json) {
//     _email = json['email'];
//     _push = json['push'];
//     _desktop = json['desktop'];
//     _markUnread = json['mark_unread'];
//   }
//   String? _email;
//   String? _push;
//   String? _desktop;
//   String? _markUnread;
//
//   String? get email => _email;
//   String? get push => _push;
//   String? get desktop => _desktop;
//   String? get markUnread => _markUnread;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['email'] = _email;
//     map['push'] = _push;
//     map['desktop'] = _desktop;
//     map['mark_unread'] = _markUnread;
//     return map;
//   }
//
// }