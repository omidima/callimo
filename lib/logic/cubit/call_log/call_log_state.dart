part of 'call_log_cubit.dart';

abstract class CallLogState {}

class ScreenInitState extends CallLogState {}

class UpdateListState extends CallLogState {
  List<CallItemObject> items;
  UpdateListState(this.items);
}

class RemoveTaskState extends CallLogState {
  int index;
  RemoveTaskState(this.index);
}
