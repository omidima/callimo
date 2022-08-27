

class ConversationViewedEvent {
  String? conversation_id;
  String? workspace_id;
  String? organization_id;
  String? type;
  String? viewed_msg_count;
  String? viewed_mention_count;
  Map<String, dynamic>? notify_props;

  ConversationViewedEvent({
    this.conversation_id,
    this.workspace_id,
    this.organization_id,
    this.type,
    this.viewed_msg_count,
    this.viewed_mention_count,
    this.notify_props,
  });

  factory ConversationViewedEvent.fromJson(Map<String, dynamic> json) {
    return ConversationViewedEvent(
      conversation_id: json['conversation_id'],
      notify_props: json['notify_props'],
      organization_id: json['organization_id'],
      type: json['type'],
      viewed_mention_count: json['viewed_mention_count'],
      viewed_msg_count: json['viewed_msg_count'],
      workspace_id: json['workspace_id']
    );
  }
}
