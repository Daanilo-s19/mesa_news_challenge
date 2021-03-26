import 'dart:convert';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';

class NewsModel extends News {
  NewsModel({
    int id,
    String title,
    String description,
    String author,
    String content,
    DateTime published,
    bool highlight,
    bool favorite = false,
    String url,
    String imageUrl,
  }) : super(
          id: id,
          title: title,
          description: description,
          author: author,
          content: content,
          published: published,
          highlight: highlight,
          favorite: favorite,
          url: url,
          imageUrl: imageUrl,
        );

  NewsModel copyWith({
    int id,
    String title,
    String description,
    String author,
    String content,
    DateTime published,
    bool highlight,
    bool favorite,
    String url,
    String imageUrl,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      content: content ?? this.content,
      published: published ?? this.published,
      highlight: highlight ?? this.highlight,
      favorite: favorite ?? this.favorite,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'title': title,
      'description': description,
      'author': author,
      'content': content,
      'published': published.millisecondsSinceEpoch,
      'highlight': highlight,
      "favorite": favorite,
      'url': url,
      'imageUrl': imageUrl,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map, {int id}) {
    if (map == null) return null;

    return NewsModel(
      id: id,
      favorite: map["favorite"] ?? false,
      title: map['title'],
      description: map['description'],
      author: map['author'],
      content: map['content'],
      published: DateTime.now().add(Duration(days: -id)),
      // published: map['published_at'] != null
      //     ? DateTime.parse(map['published_at'])
      //     : null,
      highlight: map['highlight'],
      url: map['url'],
      imageUrl: map['image_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsModel(id:$id,title: $title, description: $description, author: $author, content: $content, published: $published, highlight: $highlight,favorite: $favorite, url: $url, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsModel &&
        other.id == id &&
        other.title == title &&
        other.favorite == favorite &&
        other.description == description &&
        other.author == author &&
        other.content == content &&
        other.published == published &&
        other.highlight == highlight &&
        other.url == url &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        author.hashCode ^
        content.hashCode ^
        published.hashCode ^
        highlight.hashCode ^
        favorite.hashCode ^
        url.hashCode ^
        imageUrl.hashCode;
  }
}
