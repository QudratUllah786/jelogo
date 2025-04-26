import 'package:jelogo/model/user/user_model.dart';

class TransactionModel {
  String? id;
  String? uuid;
  int? amount;
  String? status;
  dynamic? fee;
  String? userId;
  String? phone;
  String? operatorSlug;
  String? reason;
  String? recipient;
  String? output;
  String? action;
  String? transactionTypeSlug;
  bool? treatment;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? user;

  TransactionModel({
    this.id,
    this.uuid,
    this.amount,
    this.status,
    this.fee,
    this.userId,
    this.phone,
    this.operatorSlug,
    this.reason,
    this.recipient,
    this.output,
    this.action,
    this.transactionTypeSlug,
    this.treatment,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      uuid: json['uuid'],
      amount: json['amount'],
      status: json['status'],
      fee: json['fee'],
      userId: json['userId'],
      phone: json['phone'],
      operatorSlug: json['operatorSlug'],
      reason: json['reason'],
      recipient: json['recipient'],
      output: json['output'],
      action: json['action'],
      transactionTypeSlug: json['transactionTypeSlug'],
      treatment: json['treatment'],
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'amount': amount,
      'status': status,
      'fee': fee,
      'userId': userId,
      'phone': phone,
      'operatorSlug': operatorSlug,
      'reason': reason,
      'recipient': recipient,
      'output': output,
      'action': action,
      'transactionTypeSlug': transactionTypeSlug,
      'treatment': treatment,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'user': user?.toJson(),
    };
  }
}

