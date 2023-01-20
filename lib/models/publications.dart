// To parse this JSON data, do
//
//     final publications = publicationsFromMap(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'publications.g.dart';

@HiveType(typeId: 5)
class Publications {
  Publications({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @HiveField(0)
  final int userId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String body;

  factory Publications.fromJson(String str) =>
      Publications.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Publications.fromMap(Map<String, dynamic> json) => Publications(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
