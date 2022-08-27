import 'package:callimoo/data/base/resource.dart';
import 'package:callimoo/data/hive/dto/app_dto.dart';
import 'package:callimoo/data/repositories/conversation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/hive/objects/call_item_object.dart';
part 'call_log_state.dart';

class CallLogCubit extends Cubit<CallLogState> {
  late List<CallItemObject> _items;
  ConversationRepository _conversationRepository;
  CallLogCubit({ConversationRepository? conversationRepository})
      : _conversationRepository =
            conversationRepository ?? ConversationRepository.getInstance,
        super(ScreenInitState()) {
    _items = AppDto.getCalls;
    emit(UpdateListState(_items));
    loadCallList();
  }

  onChangeList(String text) {
    emit(UpdateListState(
        _items.where((element) => element.name.contains(text)).toList()));
  }

  onDeleteItem(String id, int index) async {
    _items.removeAt(index);
    AppDto.removeCall(id);
    emit(UpdateListState(_items));
  }

  loadCallList() async {
    var result = await _conversationRepository.getConversationMessage(
        AppDto.getConversation!.id!, AppDto.getWorkspace!.id!);

    if (result.status == ResourceStatus.success) {
      _items = AppDto.getCalls;
      emit(UpdateListState(_items));
    }
  }
}
