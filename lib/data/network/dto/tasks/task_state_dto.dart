class TaskStateDto {
  TaskStateDto({
      String? status,}){
    _status = status;
}

  TaskStateDto.fromJson(dynamic json) {
    _status = json['state'];
  }
  String? _status;

  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state'] = _status;
    return map;
  }

}