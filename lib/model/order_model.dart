class OrderModel {
  String? id;
  String? status;
  String? userId;
  String? cardFront;
  String? cardBack;
  String? selfie;
  String? documentTypeId;
  String? motif;
  DateTime? createdAt;
  DateTime? updatedAt;

  OrderModel({
    this.id,
    this.status,
    this.userId,
    this.cardFront,
    this.cardBack,
    this.selfie,
    this.documentTypeId,
    this.motif,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String?,
      status: json['status'] as String?,
      userId: json['userId'] as String?,
      cardFront: json['cardFront'] as String?,
      cardBack: json['cardBack'] as String?,
      selfie: json['selfie'] as String?,
      documentTypeId: json['documentTypeId'] as String?,
      motif: json['motif'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'userId': userId,
      'cardFront': cardFront,
      'cardBack': cardBack,
      'selfie': selfie,
      'documentTypeId': documentTypeId,
      'motif': motif,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
