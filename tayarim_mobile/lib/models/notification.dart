import 'package:flutter/cupertino.dart';

class Notification {
  int id;
  String title;
  String description;
  String createdAt;

  Notification({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['created_at'],
    );
  }
}