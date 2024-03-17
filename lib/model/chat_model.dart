// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  String model;
  List<Message> messages;

  ChatModel({
    this.model = "gpt-3.5-turbo",
    required this.messages,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        model: json["model"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class Message {
  String role;
  String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
      };
}
