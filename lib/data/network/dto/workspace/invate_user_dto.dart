class WorkspaceInvationMemberDto {
  String? workspaceId;
  List<InvationUsersItem>? invations;

  WorkspaceInvationMemberDto({
    this.workspaceId,
    this.invations
  });

  WorkspaceInvationMemberDto.fromJson(dynamic json) {
    workspaceId = json['workspace_id'];
    invations = json['invitations'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['workspace_id'] = workspaceId;
    map['invitations'] = invations;
    return map;
  }
}

class InvationUsersItem {
  String? phoneNumber;
  String? userId;

  InvationUsersItem({
    this.phoneNumber,
    this.userId
  });

  InvationUsersItem.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['user_id'] = userId;
    return map;
  }
}
