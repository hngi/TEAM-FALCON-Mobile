import 'dart:convert';

class AStep {
  int id;
  String description;
  int categoryId;
  int step;
  AStep({
    this.id,
    this.description,
    this.categoryId,
    this.step,
  });
  

  AStep copyWith({
    int id,
    String description,
    int categoryId,
    int step,
  }) {
    return AStep(
      id: id ?? this.id,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      step: step ?? this.step,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'categoryId': categoryId,
      'step': step,
    };
  }

  static AStep fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return AStep(
      id: map['id'],
      description: map['description'],
      categoryId: map['categoryId'],
      step: map['step'],
    );
  }

  String toJson() => json.encode(toMap());

  static AStep fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'AStep(id: $id, description: $description, categoryId: $categoryId, step: $step)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is AStep &&
      o.id == id &&
      o.description == description &&
      o.categoryId == categoryId &&
      o.step == step;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      categoryId.hashCode ^
      step.hashCode;
  }
}
