import 'package:callimoo/data/network/dto/thread/thread_dto.dart';


class AllThreadDto {
  AllThreadDto({
    this.threads,
    this.unreadThreadsCount,
    this.threadsMentionCount,
  });

  List<ThreadDto>? threads;
  int? unreadThreadsCount;
  int? threadsMentionCount;

  AllThreadDto.fromJson(Map<String, dynamic> json) {
    threads =
        List.from(json['threads']).map((e) => ThreadDto.fromJson(e)).toList();
    unreadThreadsCount = json['unread_threads_count'];
    threadsMentionCount = json['threads_mention_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['threads'] = threads?.map((e) => e.toJson()).toList();
    _data['unread_threads_count'] = unreadThreadsCount;
    _data['threads_mention_count'] = threadsMentionCount;
    return _data;
  }

  // AllThreadFull toAllThreadFull(List<ThreadFull>? threadsFull) =>
  //   AllThreadFull(
  //     threadsMentionCount: this.threadsMentionCount,
  //     unreadThreadsCount: this.unreadThreadsCount,
  //     threads: (threadsFull == null) ? threads?.map((e) => e.toThreadFull(null)).toList() : threadsFull
  //   );



  AllThreadDto copyWith({
    List<ThreadDto>? threads,
    int? unreadThreadsCount,
    int? threadsMentionCount,
  }) =>
      AllThreadDto(
          threads: threads ?? this.threads,
          unreadThreadsCount: unreadThreadsCount ?? this.unreadThreadsCount,
          threadsMentionCount: threadsMentionCount ?? this.threadsMentionCount);
}
