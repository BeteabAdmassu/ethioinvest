import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../models/favorite.dart';

final favoritesProvider = Provider((ref) {
  final databases = ref.watch(databasesProvider);
  final databaseId = ref.watch(databaseIdProvider);
  return FavoritesService(databases, databaseId);
});

class FavoritesService {
  final Databases databases;
  final String databaseId;
  String collectionId = '665985c40012c24fd7d6';

  FavoritesService(this.databases, this.databaseId);

  Future<void> createFavorite(Favorite favorite) async {
    await databases.createDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: ID.unique(),
      data: favorite.toMap(),
    );
  }

  Future<List<Favorite>> fetchFavorites(String userId) async {
    final response = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [Query.equal('userID', userId)]);
    return response.documents.map((doc) => Favorite.fromMap(doc.data)).toList();
  }

  Future<void> updateFavorite(String documentId, Favorite favorite) async {
    await databases.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
      data: favorite.toMap(),
    );
  }

  Future<void> deleteFavorite(String documentId) async {
    await databases.deleteDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: documentId,
    );
  }
}
