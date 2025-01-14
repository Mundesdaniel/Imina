class Abia {
  final int number;
  final String title;
  final String content;

  Abia({required this.number, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'title': title,
      'content': content,
    };
  }

  factory Abia.fromMap(Map<String, dynamic> map) {
    return Abia(
      number: map['number'],
      title: map['title'],
      content: map['content'],
    );
  }

  static List<Abia> cast() {
    throw UnimplementedError('cast() is not implemented yet.');
  }
}
