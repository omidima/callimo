class OrganizationDto {
  String? id;
  String? name;
  String? description;
  String? iconHash;
  String? bannerHash;
  String? workspaceInvitationPermissionMode;
  _MyMebmership? myMembership;

  OrganizationDto({
    this.id,
    this.name,
    this.description,
    this.iconHash,
    this.bannerHash,
    this.workspaceInvitationPermissionMode,
  });
  
  OrganizationDto.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.description = json['description'];
    this.iconHash = json['icon_hash'];
    this.bannerHash = json['banner_hash'];
    this.workspaceInvitationPermissionMode =
        json['workspace_invitation_permission_mode'];
    this.myMembership = _MyMebmership.frmJson(json['my_membership']);
  }

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "name": this.name,
        "description": this.description,
        "icon_hash": this.iconHash,
        "banner_hash": this.bannerHash,
        "workspace_invitation_permission_mode":
            this.workspaceInvitationPermissionMode,
        "my_membership": this.myMembership
      };
}

class _MyMebmership {
  String? userId;
  List<dynamic>? roles;
  List<dynamic>? preferences;
  List<dynamic>? features;

  _MyMebmership.frmJson(Map<String, dynamic> json) {
    this.userId = json['user_id'];
    this.roles = json['roles'];
    this.preferences = json['preferences'];
    this.features = json['features'];
  }

  Map<String, dynamic> toJson() => {
        "user_id": this.userId,
        "roles": this.roles,
        "preferences": this.preferences,
        "features": this.features
      };
}
