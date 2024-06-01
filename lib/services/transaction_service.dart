import 'package:appwrite/appwrite.dart';
import 'package:ethioinvest/models/Transaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';

final transactionProvider = Provider((ref) {
  final databases = ref.watch(databasesProvider);
  final databaseId = ref.watch(databaseIdProvider);
  return TransactionService(databases, databaseId);
});

class TransactionService {
  final Databases databases;
  final String databaseId;
  String collectionId = '66520ca40015e255c642';

  TransactionService(this.databases, this.databaseId);

  Future<void> createTransaction(Transaction transaction) async {
    await databases.createDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: ID.unique(),
      data: transaction.toJson(),
    );
  }

  Future<List<Transaction>> fetchTransactions(String userId) async {
    final response = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [Query.equal('userID', userId)]);
    return response.documents
        .map((doc) => Transaction.fromJson(doc.data))
        .toList();
  }

  Future<void> updateTransaction(
      String documentId, Transaction transaction) async {
    await databases.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
      data: transaction.toJson(),
    );
  }

  Future<void> deleteTransaction(String documentId) async {
    await databases.deleteDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
    );
  }
}
