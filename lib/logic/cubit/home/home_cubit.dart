import 'dart:async';

import 'package:callimoo/data/base/resource.dart';
import 'package:callimoo/data/hive/dto/app_dto.dart';
import 'package:callimoo/data/network/dto/conversation/bbb_dto.dart';
import 'package:callimoo/data/network/dto/message/create_message.dart';
import 'package:callimoo/data/network/dto/message/message_created.dart';
import 'package:callimoo/data/network/dto/message/message_dto.dart';
import 'package:callimoo/data/provider/publisher/event_publisher.dart';
import 'package:callimoo/data/provider/websoket/socket_manager.dart';
import 'package:callimoo/data/repositories/config_repository.dart';
import 'package:callimoo/data/repositories/conversation_repository.dart';
import 'package:callimoo/data/repositories/user_repository.dart';
import 'package:callimoo/data/repositories/workspace_repository.dart';
import 'package:callimoo/logic/util/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  String? name;
  ConversationRepository _conversationRepository;
  UserRepository _userRepository;
  late StreamSubscription _subscription;
  HomeCubit(
      {ConversationRepository? conversationRepository,
      UserRepository? userRepository})
      : _conversationRepository =
            conversationRepository ?? ConversationRepository.getInstance,
        _userRepository = userRepository ?? UserRepository.getInstance,
        super(InitState()) {
    _subscription =
        EventPublisher.getInstance().on<CreateMessage>().listen((event) {});
  }

  createCallMessage() async {
    if (name != null && name!.isNotEmpty) {
      if (AppDto.getConversation == null) {
        await ConfigRepository.getInstance.config();
        var conversations = await _userRepository.getUserConversations(
            AppDto.getWorkspace!.id!, "");
        if (conversations.status == ResourceStatus.success) {
          var result = await _conversationRepository.createVideoCall(
              (conversations.data![0].id ?? ""), name!);
          result.when(
              success: (success) {
                print(success.toJson());
              },
              failure: (failure) {});
        }
      }else {
        var result = await _conversationRepository.createVideoCall(
            (AppDto.getConversation!.id ?? ""), name!);
        result.when(
            success: (success) {
              print(success.toJson());
            },
            failure: (failure) {});
      }
    } else {
      emit(CallErrorState(message: "لطفا نام جلسه را وارد نمایید."));
    }
  }
}
