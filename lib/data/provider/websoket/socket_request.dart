class SocketRequest {

  Object? data;
  String? event;

  SocketRequest({
    this.data,
    this.event,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocketRequest &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          event == other.event);

  @override
  int get hashCode => data.hashCode ^ event.hashCode;

  @override
  String toString() {
    return 'SocketRequest{' + ' data: $data,' + ' event: $event,' + '}';
  }

  SocketRequest copyWith({
    Object? data,
    String? event,
  }) {
    return SocketRequest(
      data: data ?? this.data,
      event: event ?? this.event,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': this.data,
      'event': this.event,
    };
  }

  factory SocketRequest.fromMap(Map<String, dynamic> map) {
    return SocketRequest(
      data: map['data'] as Object,
      event: map['event'] as String,
    );
  }

}