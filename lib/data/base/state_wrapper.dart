import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_wrapper.freezed.dart';

@freezed
class StateWrapper<T> with _$StateWrapper<T> {
  const factory StateWrapper.idle() = Idle<T>;
  const factory StateWrapper.loading() = Loading<T>;
  const factory StateWrapper.data({required T data}) = Data<T>;
  // const factory StateWrapper.error({required NetworkExceptions error}) =
  // Error<T>;
}
