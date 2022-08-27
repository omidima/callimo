

import '../../../network/dto/message/message_dto.dart';

class EditMessageEvent {
  final MessageDto? messageDto;
  EditMessageEvent({this.messageDto});
}