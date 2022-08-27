class Participants {
  String? id;
  String? uid;

  Participants({this.id, this.uid});

  Participants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    return data;
  }
}
