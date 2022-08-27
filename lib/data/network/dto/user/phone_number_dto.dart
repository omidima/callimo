class PhoneNumberDto {
  String? _phoneNumber;
  String? get term => _phoneNumber;

  PhoneNumberDto({String? phoneNumber}){
    _phoneNumber = phoneNumber;
  }

  PhoneNumberDto.fromJson(dynamic json) {
    _phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['phone_number'] = _phoneNumber;

    return map;
  }

}