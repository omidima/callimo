

import 'organization_user_dto.dart';

class OrganizationMember {
  int? totalCount;
  List<OrganizationUserDto>? items;

  OrganizationMember({this.totalCount, this.items});

  OrganizationMember.fromJson(Map<String, dynamic> json) {
    this.totalCount = json['totalCount'];
    this.items = [];
    json['items']
        .forEach((e) => items!.add(OrganizationUserDto.fromJson(e)));
  }

  Map<String, dynamic> toJson() =>
      {"totalCount": this.totalCount, "items": this.items};
}
