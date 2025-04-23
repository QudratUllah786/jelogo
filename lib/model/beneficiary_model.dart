class BeneficiaryModel {
  String? id;
  String? userId;
  String? name;
  String? beneficiaryType;
  String? phone;
  String? rib;
  String? countryCode;
  DateTime? createdAt;
  DateTime? updatedAt;

  BeneficiaryModel({
    this.id,
    this.userId,
    this.name,
    this.beneficiaryType,
    this.phone,
    this.rib,
    this.countryCode,
    this.createdAt,
    this.updatedAt,
  });

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return BeneficiaryModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      beneficiaryType: json['beneficiaryType'] as String?,
      phone: json['phone'] as String?,
      rib: json['rib'] as String?,
      countryCode: json['countryCode'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'beneficiaryType': beneficiaryType,
      'phone': phone,
      'rib': rib,
      'countryCode': countryCode,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
