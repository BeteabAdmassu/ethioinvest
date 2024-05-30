class Transaction {
  String stockId;
  String transactionType;
  int quantity;
  double pricePerShare;
  double totalAmount;
  String transactionDate;
  String userId;

  Transaction({
    required this.stockId,
    required this.transactionType,
    required this.quantity,
    required this.pricePerShare,
    required this.totalAmount,
    required this.transactionDate,
    required this.userId,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      stockId: json['stock_id'] as String,
      transactionType: json['transaction_type'] as String,
      quantity: json['quantity'] as int,
      pricePerShare: (json['price_per_share'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      transactionDate: json['transaction_date'] as String,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'stock_id': stockId,
        'transaction_type': transactionType,
        'quantity': quantity,
        'price_per_share': pricePerShare,
        'total_amount': totalAmount,
        'transaction_date': transactionDate,
        'userId': userId,
      };
}
