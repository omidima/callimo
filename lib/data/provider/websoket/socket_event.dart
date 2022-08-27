enum SocketEvent {
  TYPING,
  MESSAGE_CREATED,
  MESSAGE_EDITED,
  MESSAGE_DELETED,
  CONVERSATION_UPDATED,
  CONVERSATION_VIEWED,
  CONVERSATION_CREATED,
  WORKSPACE_UPDATED,
  HELLO,
  THREAD_VIEWED,
  NOTIFY_PROPS_UPDATED,
  ADDED_TO_CONVERSATION,
  USER_UNREADS,
  CONVERSATION_MEMBER_UPDATED,
  INVITATION_STATUS_UPDATED,
  REMOVED_FROM_CONVERSATION,
  INVITED_TO_WORKSPACE,
  LEAVE_WORKSPACE,
  CONVERSATION_SEEN,
  JOIN_WORKSPACE,
  USER_STATUS_UPDATED,
  CONVERSATION_UNARCHIVED,
  CONVERSATION_ARCHIVED,
  USER_PREFERENCES_UPDATED
}

extension SocketStateType on SocketEvent {
  String get event {
    switch (this) {
      case SocketEvent.TYPING:
        return "typing";
      case SocketEvent.MESSAGE_CREATED:
        return "message_created";
      case SocketEvent.MESSAGE_EDITED:
        return "message_edited";
      case SocketEvent.MESSAGE_DELETED:
        return "message_deleted";
      case SocketEvent.CONVERSATION_UPDATED:
        return "conversation_updated";
      case SocketEvent.CONVERSATION_VIEWED:
        return "conversation_viewed";
      case SocketEvent.WORKSPACE_UPDATED:
        return "workspace_updated";
      case SocketEvent.HELLO:
        return "hello";
      case SocketEvent.THREAD_VIEWED:
        return "thread_viewed";
      case SocketEvent.NOTIFY_PROPS_UPDATED:
        return "notify_props_updated";
      case SocketEvent.USER_PREFERENCES_UPDATED:
        return "user_preferences_updated";
      case SocketEvent.ADDED_TO_CONVERSATION:
        return "added_to_conversation";
      case SocketEvent.USER_UNREADS:
        return "user_unreads";
      case SocketEvent.CONVERSATION_ARCHIVED:
        return "conversation_archived";
      case SocketEvent.CONVERSATION_UNARCHIVED:
        return "conversation_unarchived";
      case SocketEvent.CONVERSATION_MEMBER_UPDATED:
        return "conversation_member_updated";
      case SocketEvent.INVITATION_STATUS_UPDATED:
        return "invitation_status_updated";
      case SocketEvent.REMOVED_FROM_CONVERSATION:
        return "removed_from_conversation";
      case SocketEvent.INVITED_TO_WORKSPACE:
        return "invited_to_workspace";
      case SocketEvent.LEAVE_WORKSPACE:
        return "leave_workspace";
      case SocketEvent.CONVERSATION_SEEN:
        return "conversation_seen";
      case SocketEvent.JOIN_WORKSPACE:
        return "join_workspace";
      case SocketEvent.USER_STATUS_UPDATED:
        return "user_status_updated";
      case SocketEvent.CONVERSATION_CREATED:
        return "conversation_created";
    }
  }
}
