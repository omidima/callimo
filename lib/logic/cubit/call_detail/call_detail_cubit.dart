import 'package:callimoo/data/base/resource.dart';
import 'package:callimoo/data/hive/dto/app_dto.dart';
import 'package:callimoo/data/hive/objects/call_item_object.dart';
import 'package:callimoo/data/repositories/conversation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'call_detail_state.dart';

class CallDetailCubit extends Cubit<CallDetailScreen> {
  ConversationRepository _conversationRepository;
  CallItemObject item;

  CallDetailCubit(
      {required this.item, ConversationRepository? conversationRepository})
      : _conversationRepository =
            conversationRepository ?? ConversationRepository.getInstance,
        super(InitCallDetailState());

  remove() async {
    var r = await _conversationRepository.deleteMessage(
        AppDto.getWorkspace!.id!, AppDto.getConversation!.id!, item.id);

    if (r.status == ResourceStatus.success) {
      AppDto.removeCall(item.id);
      emit(RemoveSucessState());
    }
  }
}
