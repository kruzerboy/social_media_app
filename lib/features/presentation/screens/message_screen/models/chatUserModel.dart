// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers({
    required this.name,
    required this.messageText,
    required this.imageURL,
    required this.time, required String text, required String secondaryText, required String image,
  });

  

  ChatUsers copyWith({
    String? name,
    String? messageText,
    String? imageURL,
    String? time,
  }) {
    return ChatUsers(
      name: name ?? this.name,
      messageText: messageText ?? this.messageText,
      imageURL: imageURL ?? this.imageURL,
      time: time ?? this.time, text: '', secondaryText: '', image: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'messageText': messageText,
      'imageURL': imageURL,
      'time': time,
    };
  }

  factory ChatUsers.fromMap(Map<String, dynamic> map) {
    return ChatUsers(
      name: map['name'] as String,
      messageText: map['messageText'] as String,
      imageURL: map['imageURL'] as String,
      time: map['time'] as String, text: '', secondaryText: '', image: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatUsers.fromJson(String source) => ChatUsers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatUsers(name: $name, messageText: $messageText, imageURL: $imageURL, time: $time)';
  }

  @override
  bool operator ==(covariant ChatUsers other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.messageText == messageText &&
      other.imageURL == imageURL &&
      other.time == time;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      messageText.hashCode ^
      imageURL.hashCode ^
      time.hashCode;
  }
}
