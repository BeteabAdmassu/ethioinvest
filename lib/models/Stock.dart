class Stock {
  String companyName;
  String symbol;
  String description;
  double averagePrice;
  double gain;

  Stock({
    required this.companyName,
    required this.symbol,
    required this.description,
    required this.averagePrice,
    required this.gain,
  });

  Map<String, dynamic> toMap() {
    return {
      'company_name': companyName,
      'symbol': symbol,
      'Description': description,
      'AveragePrice': averagePrice,
      'Gains': gain,
    };
  }

  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      companyName: map['company_name'] ?? '',
      symbol: map['symbol'] ?? '',
      description: map['Description'] ?? '',
      averagePrice: (map['AveragePrice'] ?? 0.0).toDouble(),
      gain: (map['Gains'] ?? 0.0).toDouble(),
    );
  }
}
