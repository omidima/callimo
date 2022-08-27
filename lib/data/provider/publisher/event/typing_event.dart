
class TypingEvent {
  String? userId;
  String? threadRootId;
  String? conversationId;
  String? workspaceId;
  TypingEvent({
    this.conversationId,
    this.threadRootId,
    this.userId,
    this.workspaceId
  });
}
