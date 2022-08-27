class ForwardSourceMessage {
  String? id;
  String? senderId;

  ForwardSourceMessage({this.id, this.senderId});

  ForwardSourceMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    return data;
  }
}
