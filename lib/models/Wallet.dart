class Wallet {
  String? walletId;
  final String userId;
  double balance;

  Wallet({this.walletId, required this.userId, required this.balance});

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      walletId: map['documentId'],
      userId: map['userID'],
      balance: (map['Balance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userId,
      'Balance': balance,
    };
  }

  Wallet copyWith({
    String? walletId,
    String? userId,
    double? balance,
  }) {
    return Wallet(
      walletId: walletId ?? this.walletId,
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
    );
  }

  @override
  String toString() {
    return 'Wallet - UserID: $userId, Balance: $balance';
  }
}
