
class ViewThreadDto {
  ViewThreadDto({
      bool? isViewed,}){
    _isViewed = isViewed;
}

  ViewThreadDto.fromJson(dynamic json) {
    _isViewed = json['is_viewed'];
  }
  bool? _isViewed;

  bool? get isViewed => _isViewed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_viewed'] = _isViewed;
    return map;
  }

}