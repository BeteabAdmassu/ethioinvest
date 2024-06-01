import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../models/Portfolio.dart';

final portfolioProvider = Provider((ref) {
  final databases = ref.watch(databasesProvider);
  final databaseId = ref.watch(databaseIdProvider);
  return portfolioService(databases, databaseId);
});

class portfolioService {
  final Databases databases;
  final String databaseId;
  String collectionId = '6652120c001d13415ac9';

  portfolioService(this.databases, this.databaseId);

  Future<void> createPortfolio(PortfolioItem portfolio) async {
    await databases.createDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: ID.unique(),
      data: portfolio.toJson(),
    );
  }

  Future<List<PortfolioItem>> fetchPortfolio(String userId) async {
    final response = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [Query.equal('userID', userId)]);
    return response.documents
        .map((doc) => PortfolioItem.fromJson(doc.data))
        .toList();
  }

  Future<void> updatePortfolio(
      String documentId, PortfolioItem portfolio) async {
    await databases.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
      data: portfolio.toJson(),
    );
  }

  Future<void> deletePortfolio(String documentId) async {
    await databases.deleteDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
    );
  }
}
