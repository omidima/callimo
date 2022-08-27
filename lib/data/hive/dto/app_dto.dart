import 'package:callimoo/data/base/pref_key.dart';
import 'package:callimoo/data/hive/objects/call_item_object.dart';
import 'package:callimoo/data/network/dto/conversation/conversation_dto.dart';
import 'package:callimoo/data/network/dto/user/user_dto.dart';
import 'package:callimoo/main.dart';

import '../../network/dto/workspace/workspace_dto.dart';

class AppDto {
  static void setWorkspace(WorkspaceDto workspaceDto) {
    Callimoo.config.put(PrefKey.WORKSPACE, workspaceDto);
  }

  static WorkspaceDto? get getWorkspace {
    return Callimoo.config.get(
      PrefKey.WORKSPACE,
    );
  }

  static void setConversation(ConversationDto conversationDto) {
    Callimoo.config.put(PrefKey.CONVERSATION, conversationDto);
  }

  static ConversationDto? get getConversation {
    if (!Callimoo.config.keys.contains(PrefKey.CONVERSATION)) {
      return null;
    }
    return Callimoo.config.get(
      PrefKey.CONVERSATION,
    );
  }

  static void addCall(CallItemObject callItemObject) async {
    await Callimoo.calls.add(callItemObject);
  }

  static void removeCall(String id) async {
    int? i;
    Callimoo.calls.values.toList().asMap().forEach((key, element) {
      if (element.id == id) {
        i = key;
      }
    });

    await Callimoo.calls.delete(i);
  }

  static List<CallItemObject> get getCalls {
    return Callimoo.calls.values.toList();
  }

  static void setUserInfo(UserDto userDto) {
    Callimoo.config.put(PrefKey.USERDATA, userDto);
  }

  static UserDto? get getUserInfo {
    return Callimoo.config.get(
      PrefKey.USERDATA,
    );
  }
}
