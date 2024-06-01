import 'package:ethioinvest/models/Portfolio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/Portfolio_service.dart';
import '../models/stock.dart';
import '../providers/stock_provider.dart';

class PortfolioStateNotifier extends StateNotifier<List<Stock>> {
  final portfolioService _portfolioService;
  final StockStateNotifier _stockStateNotifier;
  PortfolioStateNotifier(this._portfolioService, this._stockStateNotifier)
      : super([]);

  Future<void> fetchPortfolio(String userId) async {
    try {
      final portfolioStocks = await _portfolioService.fetchPortfolio(userId);
      List<Stock> stocks = [];
      for (var portfolio in portfolioStocks) {
        final stock =
            await _stockStateNotifier.fetchStockById(portfolio.stockId);
        stocks.add(stock);
      }
      print(stocks.length);
      state = stocks;
    } catch (e) {
      print('Error fetching portfolio: $e');
    }
  }

  Future<void> createPortfolio(PortfolioItem portfolio) async {
    try {
      await _portfolioService.createPortfolio(portfolio);
    } catch (e) {
      print('Error adding portfolio: $e');
    }
  }

  Future<void> updatePortfolio(
      String documentId, PortfolioItem portfolio) async {
    try {
      await _portfolioService.updatePortfolio(documentId, portfolio);
    } catch (e) {
      print('Error updating portfolio: $e');
    }
  }

  Future<void> deletePortfolio(String documentId) async {
    try {
      await _portfolioService.deletePortfolio(documentId);
    } catch (e) {
      print('Error deleting portfolio: $e');
    }
  }
}

final portfolioStateProvider =
    StateNotifierProvider<PortfolioStateNotifier, List<Stock>>((ref) {
  final portfolioService = ref.watch(portfolioProvider);
  final stockStateNotifier = ref.read(stockStateProvider.notifier);
  return PortfolioStateNotifier(portfolioService, stockStateNotifier);
});
