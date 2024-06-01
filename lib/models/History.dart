

class History  {

    String stockId;
    double price;
    String date;
    String historyId;


  History( {required this.price, required this.stockId,required this.date,required this.historyId});

 

  Map<String, dynamic> toMap() {
    return {
      'documentId': historyId,
      'price': price,
      'stockID': stockId,
      'date':date,
    };
  }

 factory History.fromMap(Map<String, dynamic> map) {
    return History(
     
      price: map['price'] ?? '',
      stockId: map['stockID'] ?? '',
      date: map['date'] ?? '',
       historyId: map['Document ID'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Favorite - price: $price, StockID: $stockId';
  }
}

