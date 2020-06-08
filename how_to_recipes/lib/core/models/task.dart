import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:how_to_recipes/core/models/step.dart';

final String tableTask = 'task';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDescription = 'description';

class Task {
  int id;
  String title;
  String description;
  String image;
  String createdAt;
  Task({
    this.id,
    this.title,
    this.description,
    this.image,
    this.createdAt,
  });

  Task copyWith({
    int id,
    String title,
    String description,
    String image,
    String createdAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'createdAt': createdAt,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  static Task fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, image: $image, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Task &&
      o.id == id &&
      o.title == title &&
      o.description == description &&
      o.image == image &&
      o.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      createdAt.hashCode;
  }
}

