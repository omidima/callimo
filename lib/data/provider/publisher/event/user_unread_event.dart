import '../../../network/dto/workspace/workspace_unread_dto.dart';

class UserUnreadEvent {
  List<WorkspaceUnreadDto>? unreadDto;
  UserUnreadEvent(this.unreadDto);
}
