import 'package:ethioinvest/models/Transaction.dart';
import 'package:ethioinvest/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionStateNotifier extends StateNotifier<List<Transaction>> {
  final TransactionService _transactionService;
  TransactionStateNotifier(this._transactionService) : super([]);

  Future<void> fetchTransactions(String userID) async {
    try {
      final transactions = await _transactionService.fetchTransactions(userID);
      state = transactions;
    } catch (e) {
      debugPrint('Error fetching Transactions: $e');
    }
  }

  Future<void> createTransaction(Transaction transaction) async {
    try {
      await _transactionService.createTransaction(transaction);
      state = [...state, transaction];
    } catch (e) {
      debugPrint('Error adding Transaction: $e');
    }
  }

  List<Transaction> get transactions => state;
}

final transactionStateProvider =
    StateNotifierProvider<TransactionStateNotifier, List<Transaction>>((ref) {
  final transactionService = ref.watch(transactionProvider);
  return TransactionStateNotifier(transactionService);
});
