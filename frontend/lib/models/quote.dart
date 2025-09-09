class Quote {
  String id;
  String text;
  String author;
  bool favorite;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    this.favorite = false,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'].toString(),
      text: json['text'] ?? '',
      author: json['author'] ?? '',
      favorite: json['favorite'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'author': author,
        'favorite': favorite,
      };
}
