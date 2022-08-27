class Preference {
  String? _category;
  String? _name;
  String? _value;

  String? get category => _category;
  String? get name => _name;
  String? get value => _value;

  Preference({
      String? category, 
      String? name, 
      String? value}){
    _category = category;
    _name = name;
    _value = value;
}

  Preference.fromJson(dynamic json) {
    _category = json['category'];
    _name = json['name'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['category'] = _category;
    map['name'] = _name;
    map['value'] = _value;
    return map;
  }

}