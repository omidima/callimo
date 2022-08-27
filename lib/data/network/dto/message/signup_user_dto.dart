class SignupUserDto {
  String? username;
  String? password;
  late String email;
  String? last_name;
  String? first_name;
  String? avatar_hash;
  String? type;

  SignupUserDto(
    {String? username,
    String? password,
    required String email,
    String? last_name,
    String? first_name,
    String? avatar_hash,
    String? type,}
  ){
    this.username = username;
    this.password = password;
    this.email = email;
    this.last_name = last_name;
    this.first_name = first_name;
    this.avatar_hash = avatar_hash;
    this.type = type;
  }

  SignupUserDto.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    last_name = json['last_name'];
    first_name = json['first_name'];
    avatar_hash = json['avatar_hash'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    map['email'] = email;
    map['last_name'] = last_name;
    map['first_name'] = first_name;
    map['avatar_hash'] = avatar_hash;
    map['type'] = type;
    return map;
  }

}

