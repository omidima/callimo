class AttachDeviceDto {
  AttachDeviceDto({
      String? deviceToken,}){
    _deviceToken = deviceToken;
}

  AttachDeviceDto.fromJson(dynamic json) {
    _deviceToken = json['device_token'];
  }
  String? _deviceToken;

  String? get deviceToken => _deviceToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['device_token'] = _deviceToken;
    return map;
  }

}