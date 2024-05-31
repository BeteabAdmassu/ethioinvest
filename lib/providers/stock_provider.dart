import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/stock.dart';
import '../services/stock_service.dart';

class StockStateNotifier extends StateNotifier<List<Stock>> {
  final StockService _stockService;
  StockStateNotifier(this._stockService) : super([]);

  Future<void> fetchStocks() async {
    try {
      final stocks = await _stockService.fetchStocks();
      state = stocks;
    } catch (e) {
      print('Error fetching stocks: $e');
    }
  }

  Future<void> createStock(Stock stock) async {
    try {
      await _stockService.createStock(stock);
      state = [...state, stock];
    } catch (e) {
      print('Error adding stock: $e');
    }
  }

  Future<void> updateStock(String documentId, Stock stock) async {
    try {
      await _stockService.updateStock(documentId, stock);
      state = [
        for (final s in state)
          if (s.symbol == documentId) stock else s,
      ];
    } catch (e) {
      print('Error updating stock: $e');
    }
  }

  Future<void> deleteStock(String documentId) async {
    try {
      await _stockService.deleteStock(documentId);
      state = state.where((stock) => stock.symbol != documentId).toList();
    } catch (e) {
      print('Error deleting stock: $e');
    }
  }

  List<Stock> get stocks => state;
}

final stockStateProvider =
    StateNotifierProvider<StockStateNotifier, List<Stock>>((ref) {
  final stockService = ref.watch(stockProvider);
  return StockStateNotifier(stockService);
});