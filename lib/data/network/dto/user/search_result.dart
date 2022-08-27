class SearchResult {
  String? _term;
  String? _inConversationId;
  String? _notInConversationId;
  bool? _allowDeleted;

  String? get term => _term;
  String? get inConversationId => _inConversationId;
  String? get notInConversationId => _notInConversationId;
  bool? get allowDeleted => _allowDeleted;

  SearchResult({
      String? term, 
      String? inConversationId, 
      String? notInConversationId, 
      bool? allowDeleted}){
    _term = term;
    _inConversationId = inConversationId;
    _notInConversationId = notInConversationId;
    _allowDeleted = allowDeleted;
}

  SearchResult.fromJson(dynamic json) {
    _term = json['term'];
    _inConversationId = json['in_conversation_id'];
    _notInConversationId = json['not_in_conversation_id'];
    _allowDeleted = json['allow_deleted'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['term'] = _term;
    map['in_conversation_id'] = _inConversationId;
    map['not_in_conversation_id'] = _notInConversationId;
    map['allow_deleted'] = _allowDeleted;
    return map;
  }

}