class WorkspaceMemberDto {
  String? _workspaceId;
  String? _userId;
  List<String>? _roles;
  String? _nickname;
  String? _position;
  String? _email;
  String? _phoneNumber;
  String? _avatarHash;
  int? _deleteAt;
  String? _availability;
  int? _lastActivityDate;
  NotifyProps? _notifyProps;
  String? displayName;
  bool isSelected = false;

  String? get workspaceId => _workspaceId;
  String? get userId => _userId;
  set setUserId(String? userId) => _userId = userId;
  List<String>? get roles => _roles;
  String? get nickname => _nickname;
  String? get position => _position;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get avatarHash => _avatarHash;
  set setAvatarHash(String? avatarHash) => _avatarHash = avatarHash;
  int? get deleteAt => _deleteAt;
  String? get availability => _availability;
  int? get lastActivityDate => _lastActivityDate;
  NotifyProps? get notifyProps => _notifyProps;

  WorkspaceMemberDto(
      {String? workspaceId,
      String? userId,
      List<String>? roles,
      String? nickname,
      String? position,
      String? email,
      String? phoneNumber,
      String? avatarHash,
      int? deleteAt,
      String? availability,
      int? lastActivityDate,
      NotifyProps? notifyProps}) {
    _workspaceId = workspaceId;
    _userId = userId;
    _roles = roles;
    _nickname = nickname;
    _position = position;
    _email = email;
    _phoneNumber = phoneNumber;
    _avatarHash = avatarHash;
    _deleteAt = deleteAt;
    _availability = availability;
    _lastActivityDate = lastActivityDate;
    _notifyProps = notifyProps;
  }

  WorkspaceMemberDto.fromJson(dynamic json) {
    _workspaceId = json['workspace_id'];
    _userId = json['user_id'];
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _nickname = json['nickname'];
    _position = json['position'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _avatarHash = json['avatar_hash'];
    _deleteAt = json['delete_at'];
    _availability = json['availability'];
    _lastActivityDate = json['last_activity_date'];
    _notifyProps = json['notify_props'] != null
        ? NotifyProps.fromJson(json['notifyProps'])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['workspace_id'] = _workspaceId;
    map['user_id'] = _userId;
    map['roles'] = _roles;
    map['nickname'] = _nickname;
    map['position'] = _position;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['avatar_hash'] = _avatarHash;
    map['delete_at'] = _deleteAt;
    map['availability'] = _availability;
    map['last_activity_date'] = _lastActivityDate;
    if (_notifyProps != null) {
      map['notify_props'] = _notifyProps?.toJson();
    }
    return map;
  }
}

class NotifyProps {
  String? _email;
  String? _push;
  String? _desktop;
  String? _desktopSound;
  String? _mentionKeys;
  String? _conversation;
  String? _firstName;

  String? get email => _email;
  String? get push => _push;
  String? get desktop => _desktop;
  String? get desktopSound => _desktopSound;
  String? get mentionKeys => _mentionKeys;
  String? get conversation => _conversation;
  String? get firstName => _firstName;

  NotifyProps(
      {String? email,
      String? push,
      String? desktop,
      String? desktopSound,
      String? mentionKeys,
      String? conversation,
      String? firstName}) {
    _email = email;
    _push = push;
    _desktop = desktop;
    _desktopSound = desktopSound;
    _mentionKeys = mentionKeys;
    _conversation = conversation;
    _firstName = firstName;
  }

  NotifyProps.fromJson(dynamic json) {
    _email = json['email'];
    _push = json['push'];
    _desktop = json['desktop'];
    _desktopSound = json['desktop_sound'];
    _mentionKeys = json['mention_keys'];
    _conversation = json['conversation'];
    _firstName = json['first_name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['email'] = _email;
    map['push'] = _push;
    map['desktop'] = _desktop;
    map['desktop_sound'] = _desktopSound;
    map['mention_keys'] = _mentionKeys;
    map['conversation'] = _conversation;
    map['first_name'] = _firstName;
    return map;
  }
}
