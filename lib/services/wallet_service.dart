import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../models/Wallet.dart';

final walletProvider = Provider((ref) {
  final databases = ref.watch(databasesProvider);
  final databaseId = ref.watch(databaseIdProvider);
  return WalletService(databases, databaseId);
});

class WalletService {
  final Databases databases;
  final String databaseId;
  String collectionId = '66520a610003c8f2ef79';

  WalletService(this.databases, this.databaseId);

  Future<void> createWallet(Wallet wallet) async {
    await databases.createDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: ID.unique(),
      data: wallet.toMap(),
    );
  }

  Future<List<Wallet>> fetchWallets(String userId) async {
    final response = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [Query.equal('userID', userId)]);
    return response.documents.map((doc) => Wallet.fromMap(doc.data)).toList();
  }

  Future<void> getWallets(String userId) async {
    final response = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [Query.equal('userID', '6658ad7e805eab24b34f')]);

    print(response.documents.length);
  }

  Future<void> updateWallet(String documentId, Wallet wallet) async {
    await databases.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
      data: wallet.toMap(),
    );
  }

  Future<void> deleteWallet(String documentId) async {
    await databases.deleteDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
    );
  }
}
