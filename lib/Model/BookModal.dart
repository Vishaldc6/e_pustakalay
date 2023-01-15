class Book {
  final String title;
  final String author;
  final String img;
  final String language;
  final List<String> subject;
  final String category;
  final String reealse_date;
  final String copyright;
  final int downloads;
  final String read_link;
  final String download_link;

  Book(this.author, this.img, this.language, this.subject, this.category,
      this.reealse_date, this.copyright, this.downloads,
      {required this.title,
      required this.read_link,
      required this.download_link});

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      map['author'],
      map['img'],
      map['Language'],
      List<String>.from((map['Subject'] as List<dynamic>)).toList(),
      map['Category'],
      map['Release Date'],
      map['Copyright Status'],
      map['Downloads'],
      title: map['title'],
      read_link: map['read_link'],
      download_link: map['download_link'],
    );
  }
}
