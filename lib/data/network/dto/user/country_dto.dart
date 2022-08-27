class CountryDto {
  String? e164_cc;
  String? iso2_cc;
  int? e164_sc;
  bool? geographic;
  int? level;
  String? name;
  String? example;
  String? display_name;
  String? full_example_with_plus_sign;
  String? display_name_no_e164_cc;
  String? e164_key;

  CountryDto({this.e164_cc, this.iso2_cc, this.e164_sc, this.geographic,
    this.level, this.name, this.example, this.display_name,
    this.full_example_with_plus_sign, this.display_name_no_e164_cc,
    this.e164_key}
      );

  factory CountryDto.fromMap(Map json) {
    return CountryDto(
      e164_cc: json['e164_cc'],
      iso2_cc: json['iso2_cc'],
      e164_sc: json['e164_sc'],
      geographic: json['geographic'],
      level: json['level'],
      name: json['name'],
      example: json['example'],
      display_name: json['display_name'],
      full_example_with_plus_sign: json['full_example_with_plus_sign'],
      display_name_no_e164_cc: json['display_name_no_e164_cc'],
      e164_key: json['e164_key'],
    );
  }


}