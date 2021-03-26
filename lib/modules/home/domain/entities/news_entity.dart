class News {
  final int id;
  final String title;
  final String description;
  final String author;
  final String content;
  final DateTime published;
  final bool highlight;
  final bool favorite;
  final String url;
  final String imageUrl;

  News(
      {this.id,
      this.favorite = false,
      this.title,
      this.description,
      this.author,
      this.content,
      this.published,
      this.highlight,
      this.url,
      this.imageUrl});
}
