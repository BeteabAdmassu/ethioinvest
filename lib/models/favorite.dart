class Favorite {
  final String userId;
  final String stockId;

  Favorite({required this.userId, required this.stockId});

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      userId: map['userID'],
      stockId: map['stockID'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userId,
      'stockID': stockId,
    };
  }

  @override
  String toString() {
    return 'Favorite - UserID: $userId, StockID: $stockId';
  }
}
