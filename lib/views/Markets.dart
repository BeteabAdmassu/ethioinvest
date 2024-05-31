import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/stock.dart';
import '../providers/stock_provider.dart';
import '../widgets/StockCard.dart';

class Markets extends ConsumerWidget {
  // Add a flag to track whether data has been fetched
  bool _dataFetched = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockStateNotifier = ref.read(stockStateProvider.notifier);
    final stocks = ref.watch(stockStateProvider);

    // Fetch data only if it hasn't been fetched yet
    if (!_dataFetched) {
      stockStateNotifier.fetchStocks();
      _dataFetched =
          true; // Set the flag to true to indicate data has been fetched
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Markets'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Implement the refresh logic here
          await stockStateNotifier.fetchStocks();
        },
        child: stocks.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Stock Market Overview',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: stocks.length,
                      itemBuilder: (context, index) {
                        Stock stock = stocks[index];
                        return stockCard(stock: stock, context: context);
                      },
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Example code to create a new stock
          final newStock = Stock(
            companyName: 'New Company',
            symbol: 'NEW',
            description: 'A new company',
            averagePrice: 100.0,
            gain: 5.0,
          );
          await ref.read(stockStateProvider.notifier).createStock(newStock);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
