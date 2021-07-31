class Info {
  final int count;
  final int pages;
  final String? prev;
  final String? next;

  Info({
    required this.count,
    required this.pages,
    required this.prev,
    required this.next,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
        count: json['count'],
        pages: json['pages'],
        prev: json['prev'],
        next: json['next'],
    );
  }
}
