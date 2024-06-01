import 'package:ethioinvest/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/Wallet.dart';
import '../services/wallet_service.dart';

class WalletStateNotifier extends StateNotifier<List<Wallet>> {
  final Ref _ref;
  final WalletService _walletService;
  WalletStateNotifier(this._walletService, this._ref) : super([]);

  Future<void> fetchWallets(String userId) async {
    try {
      final wallets = await _walletService.fetchWallets(userId);
      state = wallets;
    } catch (e) {
      print('Error fetching wallets: $e');
    }
  }

  Future<void> createWallet(Wallet wallet) async {
    try {
      final wallets = await _walletService.createWallet(wallet);
    } catch (e) {
      print('Error adding wallet: $e');
    }
  }

  Future<void> updateWallet(Wallet wallet, String userId) async {
    try {
      final userId = _ref.read(authProvider).userId;
      await _walletService.updateWallet(wallet.walletId!, wallet);
      fetchWallets(userId!);
    } catch (e) {
      print('Error updating wallet: $e');
    }
  }

//   Future<void> deleteWallet(String documentId) async {
//     try {
//       await _walletService.deleteWallet(documentId);
//       state = state.where((wallet) => wallet.id != documentId).toList();
//     } catch (e) {
//       print('Error deleting wallet: $e');
//     }
//   }
  void reset() {
    state = [];
  }

  List<Wallet> get wallets => state;
}

final walletStateProvider =
    StateNotifierProvider<WalletStateNotifier, List<Wallet>>((ref) {
  final walletService = ref.watch(walletProvider);
  return WalletStateNotifier(walletService, ref);
});
