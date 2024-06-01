import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/favorite.dart';
import '../services/favorites_service.dart';
import '../models/Stock.dart';
import '../providers/stock_provider.dart';

class FavoritesStateNotifier extends StateNotifier<List<Stock>> {
  final FavoritesService _favoritesService;
  final StockStateNotifier _stockStateNotifier;
  FavoritesStateNotifier(this._favoritesService, this._stockStateNotifier)
      : super([]);

  Future<void> fetchFavorites(String userId) async {
    try {
      final favoriteStocks = await _favoritesService.fetchFavorites(userId);
      List<Stock> stocks = [];
      for (var favorite in favoriteStocks) {
        final stock =
            await _stockStateNotifier.fetchStockById(favorite.stockId);
        stocks.add(stock);
      }
      state = stocks;
    } catch (e) {
      print('Error fetching favorites: $e');
    }
  }

  Future<void> createFavorite(Favorite favorite) async {
    try {
      await _favoritesService.createFavorite(favorite);
    } catch (e) {
      print('Error adding favorite: $e');
    }
  }

  Future<void> updateFavorite(String documentId, Favorite favorite) async {
    try {
      await _favoritesService.updateFavorite(documentId, favorite);
    } catch (e) {
      print('Error updating favorite: $e');
    }
  }

  Future<void> deleteFavorite(String documentId) async {
    try {
      await _favoritesService.deleteFavorite(documentId);
    } catch (e) {
      print('Error deleting favorite: $e');
    }
  }

  void reset() {
    state = [];
  }
}

final favoritesStateProvider =
    StateNotifierProvider<FavoritesStateNotifier, List<Stock>>((ref) {
  final favoritesService = ref.watch(favoritesProvider);
  final stockStateNotifier = ref.read(stockStateProvider.notifier);
  return FavoritesStateNotifier(favoritesService, stockStateNotifier);
});
