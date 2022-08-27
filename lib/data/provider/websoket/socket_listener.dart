import 'dart:convert';

import '../../network/dto/message/message_created.dart';
import '../../network/dto/message/message_dto.dart';
import '../../network/dto/workspace/workspace_dto.dart';
import '../../network/dto/workspace/workspace_unread_dto.dart';
import '../publisher/event/conversation_create_event.dart';
import '../publisher/event/conversation_viewed_event.dart';
import '../publisher/event/create_message_event.dart';
import '../publisher/event/create_thread_message_event.dart';
import '../publisher/event/deleted_message_event.dart';
import '../publisher/event/edit_message_event.dart';
import '../publisher/event/invited_to_workspace.dart';
import '../publisher/event/user_unread_event.dart';
import '../publisher/event_publisher.dart';

class WebSocketAction {
  void onMessageCreated(dynamic data) {
    var messageCreated = MessageCreated.fromMap(json.decode(data));
    var threadRootId = messageCreated.message!.threadRootId;

    // if (threadRootId != null && threadRootId.isNotEmpty) {
    //   EventPublisher.getInstance()
    //       .fire(CreateThreadMessageEvent(messageDto: messageCreated.message));
    // } else {
    //   EventPublisher.getInstance()
    //       .fire(CreateMessageEvent(messageDto: messageCreated.message));
    // }

    if (messageCreated.UserDisplayName == "لیموبات" &&
        messageCreated.message!.text!.contains("#جلسه_تصویری")) {
      EventPublisher.getInstance()
          .fire(CreateMessageEvent(messageDto: messageCreated.message));
    }

    // updateWorkspaceUnread();
    // db.insertData(MessagesConverter()
    //     .convertToMessage(messageCreated.message!.toMessageFull()));
  }

  void onMessageEdited(dynamic data) {
    var event = EditMessageEvent(
        messageDto: MessageDto.fromJson(json.decode(data)['message']));
    EventPublisher.getInstance().fire(event);

    // db.updateMessageWithId(
    //     event.messageDto!.id!,
    //     MessagesConverter()
    //         .convertToMessage(event.messageDto!.toMessageFull()));
  }

  void onMessageDeleted(dynamic data) {
    var messageCreated = MessageDto.fromSocket(json.decode(data));
    EventPublisher.getInstance()
        .fire(DeletedMessageEvent(messageDto: messageCreated));

    // db.deleteData(messageCreated.id!);
  }

  void onConversationViewed(dynamic data) {
    var newData = json.decode(data);
    EventPublisher.getInstance().fire(ConversationViewedEvent());
  }

  void onTyping(dynamic data) {}

  void onUserUnread(dynamic data) {
    List<WorkspaceUnreadDto> unread = [];

    json.decode(data).forEach((e) {
      unread.add(WorkspaceUnreadDto.fromJson(e));
    });

    // WorkspaceRepository.getInstance.workspaceUnread = unread;
    // EventPublisher.getInstance().fire(UserUnreadEvent(unread));
  }

  void updateWorkspaceUnread() async {
    // EventPublisher.getInstance().fire(UserUnreadEvent([
    //   WorkspaceUnreadDto(
    //       workspaceId: await Pref.get(key: PrefKey.LAST_WORKSPACE_ID))
    // ]));
  }

  void onUserStatusChange(dynamic data) {}

  void onAddToConversation(dynamic data) {
    var item = json.decode(data);
    EventPublisher.getInstance().fire(ConversationCreateEvent(
        conversationId: item["uid"],
        organizationId: item["organization_id"],
        type: item["type"],
        workspaceId: item["workspace_id"]));
  }

  void onConversationCreated(dynamic data) async {
    var item = json.decode(data);

    // if (item["workspace_id"] ==
    //     await Pref.get(key: PrefKey.LAST_WORKSPACE_ID)) {
    //   EventPublisher.getInstance().fire(ConversationCreateEvent(
    //       conversationId: item["conversation_id"],
    //       organizationId: item["organization_id"],
    //       type: item["type"],
    //       workspaceId: item["workspace_id"]));
    // }
  }

  void onInvatedToWorkspace(dynamic data) async {
    var item = json.decode(data);
    var workspace = WorkspaceDto.fromJson(item);

    EventPublisher.getInstance()
        .fire(InvatedToWorkspace(workspaceDto: workspace));

    // workspaceDao.insertData(WorkspaceConverter.convertToWorkspace(workspace));
  }
}
