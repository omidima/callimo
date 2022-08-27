part of "otp_cubit.dart";

@immutable
abstract class OtpState {}

class OtpLoading extends OtpState {}

class InitState extends OtpState {}

class HasCodeState extends OtpState {}

class UserNeedSignup extends OtpState {}

class OtpSuccess extends OtpState {}

// class UserHasWorkspace extends OtpState {
//   List<WorkspaceItem>? items;
//   UserHasWorkspace({this.items});
// }

class OtpError extends OtpState {
  String? error;
}

class OtpInvalidTime extends OtpState {}
