class DirectReplyMessage {
  String? id;
  String? text;
  String? userId;
  int? deleteAt;

  DirectReplyMessage({this.id, this.text, this.userId, this.deleteAt});

  DirectReplyMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    userId = json['user_id'];
    deleteAt = json['delete_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['user_id'] = this.userId;
    data['delete_at'] = this.deleteAt;
    return data;
  }
}
