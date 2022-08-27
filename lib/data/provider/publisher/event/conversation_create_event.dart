

class ConversationCreateEvent {
  String conversationId;
  String workspaceId;
  String? organizationId;
  String? type;

  ConversationCreateEvent({
    required this.conversationId,
    required this.organizationId,
    required this.type,
    required this.workspaceId
  });
}
