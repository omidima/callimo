class SearchRequestDto {
  String? terms;
  String? conversationId;
  bool? isPhrase;

  SearchRequestDto({required this.terms, this.isPhrase = true, this.conversationId});

  SearchRequestDto.formJson(Map<String, dynamic> data) {
    terms = data['terms'];
    data['conversation_id'] != null ?conversationId = data['conversation_id'] : null;
    data['conversation_id'] != null ? isPhrase = data['is_phrase'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['terms'] = this.terms;
    this.conversationId!.isNotEmpty ? data['conversation_id'] = this.conversationId : null;
    this.isPhrase != null ? data['is_phrase'] = this.isPhrase: null;

    return data;
  }
}