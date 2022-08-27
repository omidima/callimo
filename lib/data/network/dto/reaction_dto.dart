class Reactions {
  String? userId;
  String? emojiName;

  Reactions({this.userId, this.emojiName});

  Reactions.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    emojiName = json['emoji_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['emoji_name'] = this.emojiName;
    return data;
  }
}
