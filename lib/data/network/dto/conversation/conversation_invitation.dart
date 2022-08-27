class ConversationInvitation {
  String? userId;
  ConversationInvitation({required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'user_id': this.userId,
    };
  }

  factory ConversationInvitation.fromMap(Map<String, dynamic> map) {
    return ConversationInvitation(
      userId: map['user_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': this.userId
    };
  }

  factory ConversationInvitation.fromJson(Map<String, dynamic> map) {
    return ConversationInvitation(
        userId: map['user_id'] as String);
  }
}