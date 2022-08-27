class WorkspaceCreateDto {
  String? _displayName;
  String? _iconHash;

  String? get displayName => _displayName;
  String? get iconHash => _iconHash;
  void setIconHash(String? iconHash) {
    _iconHash = iconHash;
  }

  WorkspaceCreateDto({
    String? displayName,
    String? iconHash,
  }) {
    _displayName = displayName;
    _iconHash = iconHash;
  }

  WorkspaceCreateDto.fromJson(dynamic json) {
    _displayName = json['display_name'];
    _iconHash = json['icon_hash'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['display_name'] = _displayName;
    map['icon_hash'] = _iconHash;
    return map;
  }
}
