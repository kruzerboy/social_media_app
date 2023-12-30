// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// class Message {
//   final String text;
//   final String sender;
//   final DateTime timestamp;

//   Message({
//     required this.text,
//     required this.sender,
//     required this.timestamp,
//   });

//   Message copyWith({
//     String? text,
//     String? sender,
//     DateTime? timestamp,
//   }) {
//     return Message(
//       text: text ?? this.text,
//       sender: sender ?? this.sender,
//       timestamp: timestamp ?? this.timestamp,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'text': text,
//       'sender': sender,
//       'timestamp': timestamp.millisecondsSinceEpoch,
//     };
//   }

//   factory Message.fromMap(Map<String, dynamic> map) {
//     return Message(
//       text: map['text'] as String,
//       sender: map['sender'] as String,
//       timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'Message(text: $text, sender: $sender, timestamp: $timestamp)';

//   @override
//   bool operator ==(covariant Message other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.text == text &&
//       other.sender == sender &&
//       other.timestamp == timestamp;
//   }

//   @override
//   int get hashCode => text.hashCode ^ sender.hashCode ^ timestamp.hashCode;
// }


class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers({
    required this.name,
    required this.messageText,
    required this.imageURL,
    required this.time,
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
      time: time ?? this.time,
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
      time: map['time'] as String,
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
