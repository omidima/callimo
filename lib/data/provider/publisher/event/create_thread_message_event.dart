import '../../../network/dto/message/message_dto.dart';

class CreateThreadMessageEvent {
  MessageDto? messageDto;
  CreateThreadMessageEvent({this.messageDto});
}