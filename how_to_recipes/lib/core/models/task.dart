import 'dart:convert';

class Category {
  int id;
  String title;
  String description;
  String imagePath;
  String createdAt;
  Category({
    this.id,
    this.title,
    this.description,
    this.imagePath,
    this.createdAt,
  });
  

  Category copyWith({
    int id,
    String title,
    String description,
    String imagePath,
    String createdAt,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'createdAt': createdAt,
    };
  }

  static Category fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Category(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      imagePath: map['imagePath'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  static Category fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(id: $id, title: $title, description: $description, imagePath: $imagePath, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Category &&
      o.id == id &&
      o.title == title &&
      o.description == description &&
      o.imagePath == imagePath &&
      o.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      imagePath.hashCode ^
      createdAt.hashCode;
  }
}

