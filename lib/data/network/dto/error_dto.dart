class ErrorDto {

  int? statusCode;
  String? message;
  String? displayMessage;

  ErrorDto({
    this.statusCode,
    this.message,
    this.displayMessage,
  });

  ErrorDto copyWith({
    int? statusCode,
    String? message,
    String? displayMessage,
  }) {
    return new ErrorDto(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      displayMessage: displayMessage ?? this.displayMessage,
    );
  }

  @override
  String toString() {
    return 'ErrorDto{statusCode: $statusCode, message: $message, displayMessage: $displayMessage';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ErrorDto &&
          runtimeType == other.runtimeType &&
          statusCode == other.statusCode &&
          message == other.message &&
          displayMessage == other.displayMessage);

  @override
  int get hashCode =>
      statusCode.hashCode ^ message.hashCode ^ displayMessage.hashCode;

  factory ErrorDto.fromMap(Map<String, dynamic> map) {
    return new ErrorDto(
      statusCode: map['status_code'],
      message: map['message'],
      displayMessage: map['display_message'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status_code': this.statusCode,
      'message': this.message,
      'display_message': this.displayMessage,
    };
  }

  ErrorDto.fromJson(Map<String, dynamic> json)
      : statusCode = json['status_code'],
        message = json['message'],
        displayMessage = json['display_message'];

  Map<String, dynamic> toJson() => {
    'status_code': statusCode,
    'message': message,
    'display_message': displayMessage
  };

}