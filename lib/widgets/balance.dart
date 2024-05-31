
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/wallet_provider.dart';

class balance extends ConsumerStatefulWidget {
  final bool textVisible;

  const balance({
    Key? key,
    required this.textVisible,
  }) : super(key: key);

  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends ConsumerState<balance> {
  @override
  void initState() {
    super.initState();
    // Use WidgetsBinding to ensure context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).initializeUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final wallets = ref.watch(walletStateProvider);
    final balance = wallets.isNotEmpty ? wallets.first.balance : 'N/A';

    return Text(
      widget.textVisible ? '$balance Birr' : '*****',
      style: TextStyle(color: Colors.white, fontSize: 18),
    );
  }
}
