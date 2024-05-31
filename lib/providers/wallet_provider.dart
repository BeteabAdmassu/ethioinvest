import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/wallet.dart';
import '../services/wallet_service.dart';

class WalletStateNotifier extends StateNotifier<List<Wallet>> {
  final WalletService _walletService;
  WalletStateNotifier(this._walletService) : super([]);

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

//  Future<void> updateWallet(String documentId, Wallet wallet) async {
//     try {
//       await _walletService.updateWallet(documentId, wallet);
//       state = [
//         for (final w in state)
//           if (w.id == documentId) wallet else w,
//       ];
//     } catch (e) {
//       print('Error updating wallet: $e');
//     }
//   }

//   Future<void> deleteWallet(String documentId) async {
//     try {
//       await _walletService.deleteWallet(documentId);
//       state = state.where((wallet) => wallet.id != documentId).toList();
//     } catch (e) {
//       print('Error deleting wallet: $e');
//     }
//   }

  List<Wallet> get wallets => state;
}

final walletStateProvider =
    StateNotifierProvider<WalletStateNotifier, List<Wallet>>((ref) {
  final walletService = ref.watch(walletProvider);
  return WalletStateNotifier(walletService);
});
