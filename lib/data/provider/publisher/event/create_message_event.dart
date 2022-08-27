


import '../../../network/dto/message/message_dto.dart';

class CreateMessageEvent {
  final MessageDto? messageDto;
  CreateMessageEvent({this.messageDto});
}