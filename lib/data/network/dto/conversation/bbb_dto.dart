class BbbDto {
  int? statusCode;
  String? id;
  String? message;
  String? requestId;

  BbbDto({
    this.requestId,
    this.message,
    this.id,
    this.statusCode,
  });

  BbbDto.fromJson(dynamic json) {
    requestId = json['request_id'];
    message = json['message'];
    id = json['id'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['request_id'] = requestId;
    map['message'] = message;
    map['id'] = id;
    map['status_code'] = statusCode;
    return map;
  }
}

class VideoCallNameDto {
  String? name;
  bool? is_public;
  VideoCallNameDto(this.name, {this.is_public = true});

  VideoCallNameDto.fromJson(dynamic json) {
    name = json['name'];
    is_public = json['is_public'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['is_public'] = true;
    return map;
  }
}
