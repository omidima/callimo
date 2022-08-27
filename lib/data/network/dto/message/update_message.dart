

import '../files/files_dto.dart';

class UpdateMessage {

  bool? _isPinned;
  String? _text;
  List<MessageFile>? _files;
  bool? _hasReactions;
  String? _props;
  String? _timelineLabel;

  bool? get isPinned => _isPinned;
  String? get text => _text;
  List<MessageFile>? get files => _files;
  bool? get hasReactions => _hasReactions;
  String? get props => _props;
  String? get timelineLabel => _timelineLabel;


  UpdateMessage({
      bool? isPinned, 
      String? text, 
      List<MessageFile>? files, 
      bool? hasReactions, 
      String? props, 
      String? timelineLabel,}){
    _isPinned = isPinned;
    _text = text;
    _files = files;
    _hasReactions = hasReactions;
    _props = props;
    _timelineLabel = timelineLabel;
}

  UpdateMessage.fromJson(dynamic json) {
    _isPinned = json['is_pinned'];
    _text = json['text'];
    if (json['files'] != null) {
      _files = [];
      json['files'].forEach((v) {
        _files?.add(MessageFile.fromJson(v));
      });
    }
    _hasReactions = json['has_reactions'];
    _props = json['props'];
    _timelineLabel = json['timeline_label'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_pinned'] = _isPinned;
    map['text'] = _text;
    if (_files != null) {
      map['files'] = _files?.map((v) => v.toJson()).toList();
    }
    map['has_reactions'] = _hasReactions;
    map['props'] = _props;
    map['timeline_label'] = _timelineLabel;
    return map;
  }

}