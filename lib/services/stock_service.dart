import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/stock.dart';
import '../providers/database_provider.dart';

final stockProvider = Provider((ref) {
  final databases = ref.watch(databasesProvider);
  final databaseId = ref.watch(databaseIdProvider);
  return StockService(databases, databaseId);
});

class StockService {
  final Databases databases;
  final String databaseId;
  String collectionId = '66520b85001b88ba69ee';

  StockService(this.databases, this.databaseId);

  Future<void> createStock(Stock stock) async {
    await databases.createDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: ID.unique(),
      data: stock.toMap(),
    );
  }

  Future<List<Stock>> fetchStocks() async {
    final response = await databases.listDocuments(
      databaseId: databaseId,
      collectionId: collectionId,
    );
    debugPrint(response.documents.first.toString());
    return response.documents.map((doc) => Stock.fromMap(doc.data)).toList();
  }

  Future<Stock> fetchStockById(String stockId) async {
    final response = await databases.getDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: stockId,
    );
    return Stock.fromMap(response.data);
  }

  Future<void> updateStock(String documentId, Stock stock) async {
    await databases.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
      data: stock.toMap(),
    );
  }

  Future<void> deleteStock(String documentId) async {
    await databases.deleteDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
    );
  }
}
