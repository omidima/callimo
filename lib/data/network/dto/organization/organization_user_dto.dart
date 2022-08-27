class OrganizationUserDto {
  List<dynamic>? roles;
  String? user_id;
  String? first_name;
  String? last_name;
  String? email;
  String? avatar_hash;
  String? username;
  String? availability;
  int? last_activity_date;

  OrganizationUserDto({
    this.availability,
    this.email,
    this.first_name,
    this.last_activity_date,
    this.last_name,
    this.avatar_hash,
    this.username,
    this.roles,
    this.user_id,
  });

  OrganizationUserDto.fromJson(Map<String, dynamic> json) {
    availability = json['availability'];
    email = json['email'];
    first_name = json['first_name'];
    last_activity_date = json['last_activity_date'];
    last_name = json['last_name'];
    avatar_hash = json['avatar_hash'];
    username = json['username'];
    roles = json['roles'];
    user_id = json['user_id'];
  }
}
