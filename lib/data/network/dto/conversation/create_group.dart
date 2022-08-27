class CreateGroup {
  CreateGroup({
      String? displayName, 
      String? purpose, 
      String? header, 
      String? type, 
      List<String>? userIds, 
      String? iconHash,}){
    _displayName = displayName;
    _purpose = purpose;
    _header = header;
    _type = type;
    _userIds = userIds;
    _iconHash = iconHash;
}

  CreateGroup.fromJson(dynamic json) {
    _displayName = json['display_name'];
    _purpose = json['purpose'];
    _header = json['header'];
    _type = json['type'];
    _userIds = json['user_ids'] != null ? json['user_ids'].cast<String>() : [];
    _iconHash = json['icon_hash'];
  }
  String? _displayName;
  String? _purpose;
  String? _header;
  String? _type;
  List<String>? _userIds;
  String? _iconHash;

  String? get displayName => _displayName;
  String? get purpose => _purpose;
  String? get header => _header;
  String? get type => _type;
  List<String>? get userIds => _userIds;
  String? get iconHash => _iconHash;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['display_name'] = _displayName;
    map['purpose'] = _purpose;
    map['header'] = _header;
    map['type'] = _type;
    map['user_ids'] = _userIds;
    map['icon_hash'] = _iconHash;
    return map;
  }

}