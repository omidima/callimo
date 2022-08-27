class ExistsDto {
  bool? exists;
  ExistsDto({this.exists});

  ExistsDto.fromJson(dynamic json) {
    exists = json['exists'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exists'] = exists;
    return map;
  }

}