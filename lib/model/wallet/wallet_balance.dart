class WalletBalance {
  final String? id;
  final int? balance;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  WalletBalance({
    this.id,
    this.balance,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory WalletBalance.fromJson(Map<String, dynamic>? json) {
    if (json == null) return WalletBalance();

    return WalletBalance(
      id: json['id'] as String?,
      balance: json['balance'] as int?,
      userId: json['userId'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'balance': balance,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
