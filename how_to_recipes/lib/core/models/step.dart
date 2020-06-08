import 'dart:convert';

class Step {
  String id;
  String description;
  Step({
    this.id,
    this.description,
  });

  Step copyWith({
    String id,
    String description,
  }) {
    return Step(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
    };
  }

  static Step fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Step(
      id: map['id'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  static Step fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Step(id: $id, description: $description)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Step &&
      o.id == id &&
      o.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
