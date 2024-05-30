class Listing {
  String userId;
  String stockId;
  double price;

  Listing({
    required this.userId,
    required this.stockId,
    required this.price,
  });

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      userId: json['userId'] as String,
      stockId: json['stockId'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'stockId': stockId,
        'price': price,
      };
}
