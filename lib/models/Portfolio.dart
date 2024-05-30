class PortfolioItem {
  String userId;
  String stockId;
  int quantity;

  PortfolioItem({
    required this.userId,
    required this.stockId,
    required this.quantity,
  });

  factory PortfolioItem.fromJson(Map<String, dynamic> json) {
    return PortfolioItem(
      userId: json['user_id'] as String,
      stockId: json['stock_id'] as String,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'stock_id': stockId,
        'quantity': quantity,
      };
}
