class SendSignOtpModel {
  final bool? status;
  final String? message;
  final CodeData? data;

  SendSignOtpModel({
    this.status,
    this.message,
    this.data,
  });

  factory SendSignOtpModel.fromJson(Map<String, dynamic> json) {
    return SendSignOtpModel(
      status: json.containsKey('status') ? json['status'] as bool? : null,
      message: json.containsKey('message') ? json['message'] as String? : null,
      data: json.containsKey('data') && json['data'] != null
          ? CodeData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
class CodeData {
  final String? id;
  final String? phone;
  final String? code;
  final String? countryCode;
  final bool? used;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? expireAt;

  CodeData({
    this.id,
    this.phone,
    this.code,
    this.countryCode,
    this.used,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.expireAt,
  });

  factory CodeData.fromJson(Map<String, dynamic> json) {
    return CodeData(
      id: json.containsKey('id') ? json['id'] as String? : null,
      phone: json.containsKey('phone') ? json['phone'] as String? : null,
      code: json.containsKey('code') ? json['code'] as String? : null,
      countryCode: json.containsKey('countryCode') ? json['countryCode'] as String? : null,
      used: json.containsKey('used') ? json['used'] as bool? : null,
      type: json.containsKey('type') ? json['type'] as String? : null,
      createdAt: json.containsKey('createdAt') ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json.containsKey('updatedAt') ? DateTime.tryParse(json['updatedAt']) : null,
      expireAt: json.containsKey('expireAt') ? DateTime.tryParse(json['expireAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'code': code,
      'countryCode': countryCode,
      'used': used,
      'type': type,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'expireAt': expireAt?.toIso8601String(),
    };
  }
}
