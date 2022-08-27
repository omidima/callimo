import 'package:callimoo/data/base/NetworkBoundResource.dart';
import 'package:callimoo/data/base/resource.dart';
import 'package:callimoo/data/hive/dto/app_dto.dart';
import 'package:callimoo/data/hive/objects/call_item_object.dart';
import 'package:callimoo/data/network/dto/message/message_dto.dart';
import 'package:callimoo/logic/util/helper.dart';
import 'package:callimoo/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../base/api_wrapper.dart';
import '../base/base_repository.dart';
import '../network/dto/conversation/bbb_dto.dart';

class ConversationRepository extends BaseRepository {
  static final ConversationRepository _instance =
      ConversationRepository._internal();
  ConversationRepository._internal();
  static ConversationRepository get getInstance => _instance;

  Future<ApiWrapper<BbbDto>> createVideoCall(
      String conversationId, String name) async {
    print('clicked');
    try {
      String workspaceId = AppDto.getWorkspace!.id!;
      return ApiWrapper.success(
          data: await restProvider.createVideoCall(
              workspaceId, conversationId, VideoCallNameDto(name)));
    } catch (error) {
      return ApiWrapper.failure(error: error);
    }
  }

  Future<Resource<List<MessageDto>>> getConversationMessage(
    String conversationId,
    String workspaceId,
  ) {
    return NetworkBoundResource<List<CallItemObject>, List<MessageDto>>()
        .asFutureNetwotk(createCall: () async {
      var result =
          await restProvider.getMessages(workspaceId, conversationId, 0, 10);
      return result
          .where((element) => publicLinkFinder(element.text) != null)
          .toList();
    }, processResponse: (data) {
      return data
          .map((e) => CallItemObject()
          ..id = e.id!
            ..adminLink = adminLinkFinder(e.text ?? "")!
            ..publicLink = publicLinkFinder(e.text ?? "")
            ..createdAt = e.createAt
            ..name = titleFinder(e.text ?? "")!)
          .toList();
    }, saveCallResult: (data) async {
      await Callimoo.calls.clear();

      data.forEach((element) {
        AppDto.addCall(element);
      });
    });
  }

  Future<Resource> deleteMessage(
      String workspaceId, String conversationId, String messageId) async {
    return await NetworkBoundResource().asFutureNetwotk(createCall: () async {
      return await restProvider.deleteMessage(
          workspaceId, conversationId, messageId);
    });
  }
}
