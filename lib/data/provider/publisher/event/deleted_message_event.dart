import '../../../network/dto/message/message_dto.dart';

class DeletedMessageEvent {
  final MessageDto? messageDto;
  DeletedMessageEvent({this.messageDto});
}
