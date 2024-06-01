class Wallet {
  final String userId;
  double balance;

  Wallet({required this.userId, required this.balance});

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
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

  @override
  String toString() {
    return 'Wallet - UserID: $userId, Balance: $balance';
  }
}
