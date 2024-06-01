import 'package:ethioinvest/models/Portfolio.dart';
import 'package:ethioinvest/models/Stock.dart';
import 'package:ethioinvest/models/Transaction.dart';
import 'package:ethioinvest/models/Wallet.dart';
import 'package:ethioinvest/providers/auth_provider.dart';
import 'package:ethioinvest/providers/portfolio_provider.dart';
import 'package:ethioinvest/providers/transaction_provider.dart';
import 'package:ethioinvest/providers/wallet_provider.dart';
import 'package:ethioinvest/services/wallet_service.dart';
import 'package:ethioinvest/views/home_screen.dart';
import 'package:ethioinvest/widgets/balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Checkout extends ConsumerWidget {
  final Stock stock;
  final int quantity;
  const Checkout({super.key, required this.stock, required this.quantity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final userId = authState.userId.toString();
    final wallets = ref.watch(walletStateProvider);
    final balance = wallets.first.balance;
    double totalPrice = quantity * stock.averagePrice;
    return Scaffold(
      appBar: AppBar(title: Text('${stock.symbol} Purchase')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FractionallySizedBox(
                widthFactor: 1.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FractionallySizedBox(
                      widthFactor: 0.9,
                      child: Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(5, 0, 0, 0),
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Quantity',
                                    style: TextStyle(
                                        color: Color.fromARGB(173, 0, 0, 0),
                                        fontSize: 17),
                                  ),
                                  Text(
                                    '$quantity Shares',
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const Divider(
                                height: 45,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Buy Price',
                                    style: TextStyle(
                                        color: Color.fromARGB(173, 0, 0, 0),
                                        fontSize: 17),
                                  ),
                                  Text(
                                    '${stock.averagePrice} Birr',
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const Divider(
                                height: 45,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Purchase Fee',
                                    style: TextStyle(
                                        color: Color.fromARGB(173, 0, 0, 0),
                                        fontSize: 17),
                                  ),
                                  Text(
                                    'Free',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 194, 6),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(5, 0, 0, 0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.wallet),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Wallet Balance',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text('$balance Birr')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Purchase',
                      style: TextStyle(
                          color: Color.fromARGB(173, 0, 0, 0), fontSize: 17),
                    ),
                    Text(
                      '$totalPrice Birr',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: const EdgeInsets.symmetric(vertical: 24)),
                    child: const Text(
                      "Complete Purchase",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      if (totalPrice > balance) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Insufficient funds"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        buy(userId, ref, quantity, wallets.first);
                        _showBuyDialog(context);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void buy(String userId, WidgetRef ref, int quantity, Wallet wallet) {
    PortfolioItem portfolioItem = PortfolioItem(
        userId: userId, stockId: stock.stockId, quantity: quantity);
    ref.read(portfolioStateProvider.notifier).createPortfolio(portfolioItem);

    Transaction transaction = Transaction(
        stockId: stock.stockId,
        transactionType: 'buy',
        quantity: quantity,
        pricePerShare: stock.averagePrice,
        totalAmount: stock.averagePrice * quantity,
        transactionDate: DateTime.now().toString(),
        userId: userId);
    ref.read(transactionStateProvider.notifier).createTransaction(transaction);

    // wallet.balance -= stock.averagePrice * quantity;
    // ref.read(walletStateProvider.notifier).updateWallet(wallet);
  }

  void _showBuyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Transaction Complete'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.done_outline_rounded,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Transaction Complete'),
                  const SizedBox(
                    height: 10,
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          padding: const EdgeInsets.symmetric(vertical: 24)),
                      child: const Text("Finished"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
