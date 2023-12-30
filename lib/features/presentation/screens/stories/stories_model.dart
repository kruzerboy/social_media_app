// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Story {
  final String title;
  final String content;

  Story({
    required this.title,
    required this.content,
  });

  Story copyWith({
    String? title,
    String? content,
  }) {
    return Story(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Story(title: $title, content: $content)';

  @override
  bool operator ==(covariant Story other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}
