class DocumentModel {
  String? id;
  String? name;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  // Constructor
  DocumentModel({
    this.id,
    this.name,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  // From JSON (deserialization)
  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  // To JSON (serialization)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
