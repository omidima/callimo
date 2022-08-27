class UserChangeStatusEvent {
  String? userId;
  String? conversationId;
  String? workspaceId;
  String? status;
  String? lastActivity;
  UserChangeStatusEvent(
      {this.conversationId,
      this.status,
      this.userId,
      this.workspaceId,
      this.lastActivity});
}
