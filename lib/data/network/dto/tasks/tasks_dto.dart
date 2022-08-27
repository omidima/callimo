class TaskDto {
  TaskDto(
      {required this.title,
      this.creator_user_id,
      this.due_date,
      this.state,
      this.description,
      this.assignee_user_id,
      this.id});
  String? id;
  String? title;
  String? description;
  int? due_date;
  String? state;
  String? creator_user_id;
  String? assignee_user_id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    id != null ? map['id'] = id : null;
    title != null ? map['title'] = title : null;
    description != null ? map['description'] = description : null;
    due_date != null ? map['due_date'] = due_date : null;
    state != null ? map['state'] = state : null;
    creator_user_id != null ? map['creator_user_id'] = creator_user_id : null;
    assignee_user_id != null
        ? map['assignee_user_id'] = assignee_user_id
        : null;

    return map;
  }

  TaskDto.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    due_date = json['due_date'];
    state = json['state'];
    creator_user_id = json['creator_user_id'];
    assignee_user_id = json['assignee_user_id'];
  }
}

class TaskStatus {
  static String done = "DONE";
  static String todo = "TO_DO";
}
