class Stock {
  String companyName;
  String description;
  String symbol;
  double averagePrice;
  double gain;

  Stock({
    required this.companyName,
    required this.description,
    required this.symbol,
    required this.averagePrice,
    required this.gain,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      companyName: json['company_name'] as String,
      description: json['description'] as String,
      symbol: json['symbol'] as String,
      averagePrice: (json['average_price'] ?? 0.0) as double,
      gain: (json['gain'] ?? 0.0) as double,
    );
  }

  Map<String, dynamic> toJson() => {
        'company_name': companyName,
        'description': description,
        'symbol': symbol,
        'average_price': averagePrice,
        'gain': gain,
      };
}
