import 'package:ethioinvest/providers/auth_provider.dart';
import 'package:ethioinvest/providers/portfolio_provider.dart';
import 'package:ethioinvest/providers/stock_provider.dart';
import 'package:ethioinvest/widgets/StockCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PortfolioPage extends ConsumerWidget {
  bool _dataFetched = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final userId = authState.userId.toString();
    final stockStateNotifier = ref.read(stockStateProvider.notifier);
    final stocks = ref.watch(stockStateProvider);

    final portfolioStateNotifier = ref.read(portfolioStateProvider.notifier);
    final portfolioStocks = ref.read(portfolioStateProvider);
    if (!_dataFetched) {
      stockStateNotifier.fetchStocks();
      portfolioStateNotifier.fetchPortfolio(userId);
      _dataFetched = true;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Portfolio'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            await portfolioStateNotifier.fetchPortfolio(userId);
            await stockStateNotifier.fetchStocks();
          },
          child: stocks.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(children: [
                    for (var stock in portfolioStocks)
                      stockCard(stock: stock, context: context),
                  ]),
                ),
        ));
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String change;
  final Color changeColor;
  final IconData icon;
  final Gradient? gradient;
  final Color? borderColor;
  final double? borderWidth;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? amountStyle;
  final TextStyle? changeStyle;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  FavoriteCard({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.change,
    required this.changeColor,
    required this.icon,
    this.gradient,
    this.borderColor,
    this.borderWidth,
    this.titleStyle,
    this.subtitleStyle,
    this.amountStyle,
    this.changeStyle,
    this.iconColor,
    this.iconSize,
    this.onTap,
    this.width,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 194, 193, 193),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6), // Shadow color with opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 7, // Blur radius
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Card(
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Icon(icon, size: iconSize ?? 40, color: iconColor),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: titleStyle ??
                            TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subtitle,
                        style: subtitleStyle ??
                            TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      amount,
                      style: amountStyle ??
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      change,
                      style: changeStyle ??
                          TextStyle(
                              color: changeColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
