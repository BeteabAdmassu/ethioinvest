import 'package:ethioinvest/models/Stock.dart';
import 'package:ethioinvest/providers/auth_provider.dart';
import 'package:ethioinvest/views/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Trade extends ConsumerWidget {
  final Stock stock;
  Trade({super.key, required this.stock});
  final TextEditingController _quantityController = TextEditingController();
  double _totalCost = 0.0;

  @override
  build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(stock.companyName),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/companyLogos/${stock.symbol}.png',
                            height: 40,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                stock.symbol,
                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                stock.companyName,
                                style: const TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${stock.averagePrice} Birr',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${stock.gain > 0 ? '+' : '-'} ${stock.gain > 0 ? stock.gain : stock.gain * -1}%',
                            style: stock.gain > 0
                                ? const TextStyle(
                                    color: Colors.green, fontSize: 13)
                                : const TextStyle(
                                    color: Colors.red, fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 250,
                child: Placeholder(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 160,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => _showBuyDialog(context),
                          child: Text(
                            'Buy ${stock.averagePrice} Birr',
                            style: const TextStyle(fontSize: 16),
                          )),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 40,
                      width: 160,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            foregroundColor: Colors.teal,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: sell,
                          child: Text(
                            'Sell ${stock.averagePrice}',
                            style: const TextStyle(fontSize: 16),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About ${stock.companyName}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(stock.description)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void _showBuyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Enter Quantity"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Quantity"),
                    onChanged: (value) {
                      setState(() {
                        _totalCost =
                            (int.tryParse(value) ?? 0) * stock.averagePrice;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Text("Total Cost: $_totalCost Birr"),
                  const SizedBox(height: 20),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: const Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(height: 7),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          padding: const EdgeInsets.symmetric(vertical: 24)),
                      child: const Text("Proceed to Checkout"),
                      onPressed: () {
                        String quantity = _quantityController.text;
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Checkout(
                                stock: stock, quantity: int.parse(quantity)),
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

  @override
  void dispose() {
    _quantityController.dispose();
  }

  void buy(String userId, WidgetRef ref) {
    // int quantity = 4;
    // PortfolioItem portfolioItem = PortfolioItem(
    //     userId: userId, stockId: stock.stockId, quantity: quantity);
    // ref.read(portfolioStateProvider.notifier).createPortfolio(portfolioItem);
    // Transaction transaction = Transaction(
    //     stockId: stock.stockId,
    //     transactionType: 'buy',
    //     quantity: quantity,
    //     pricePerShare: stock.averagePrice,
    //     totalAmount: stock.averagePrice * quantity,
    //     transactionDate: DateTime.now().toString(),
    //     userId: userId);
    // ref.read(transactionStateProvider.notifier).createTransaction(transaction);
  }

  void sell() {}
}
