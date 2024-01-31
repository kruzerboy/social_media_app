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


