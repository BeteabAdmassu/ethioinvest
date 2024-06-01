// import 'package:appwrite/appwrite.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fl_chart/fl_chart.dart';
// import '../services/historyservice.dart';
// import 'database_provider.dart';

// // Define a provider for the HistoryService
// final historyServiceProvider = Provider((ref) {
//   final databases = ref.watch(databasesProvider);
//   final databaseId = ref.watch(databaseIdProvider);
//   return HistoryService(databases, databaseId);
// });

// // Define a StateNotifier for managing the history data
// class HistoryNotifier extends StateNotifier<List<FlSpot>> {
//   final HistoryService _historyService;

//   HistoryNotifier(this._historyService) : super([]);

//   Future<void> fetchHistoryData(String stockID) async {
//     final data = await _historyService.fetchChartData(stockID);
//     state = data;
//   }
// }

// // Define a StateNotifierProvider for HistoryNotifier
// final historyProvider = StateNotifierProvider<HistoryNotifier, List<FlSpot>>((ref) {
//   final historyService = ref.read(historyServiceProvider);
//   return HistoryNotifier(historyService);
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../services/historyservice.dart';

// Define a provider for the HistoryService
final historyServiceProvider = Provider((ref) {
  return HistoryService();
});

// Define a StateNotifier for managing the history data
class HistoryNotifier extends StateNotifier<List<FlSpot>> {
  final HistoryService _historyService;

  HistoryNotifier(this._historyService) : super([]);

  Future<void> fetchHistoryData(String stockID) async {
    final data = await _historyService.fetchChartData(stockID);
    state = data;
  }
}

// Define a StateNotifierProvider for HistoryNotifier
final historyProvider = StateNotifierProvider<HistoryNotifier, List<FlSpot>>((ref) {
  final historyService = ref.read(historyServiceProvider);
  return HistoryNotifier(historyService);
});

