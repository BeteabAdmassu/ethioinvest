import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorites_provider.dart';
import '../models/stock.dart';
import '../views/trade.dart';

class favoritesCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Stock> favoriteStocks = ref.watch(favoritesStateProvider);

    return Column(
      children: favoriteStocks.map((favoriteStock) {
        return FractionallySizedBox(
          widthFactor: 1,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the radius as needed
                side: const BorderSide(color: Colors.black54), // Outline color
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Trade(stock: favoriteStock),
                    ),
                  );
                },
                child: SizedBox(
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
                              'assets/companyLogos/${favoriteStock.symbol}.png',
                              height: 40,
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  favoriteStock.symbol,
                                  style: const TextStyle(
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  favoriteStock.companyName,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${favoriteStock.averagePrice} Birr',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${favoriteStock.gain > 0 ? '+' : '-'} ${favoriteStock.gain > 0 ? favoriteStock.gain : favoriteStock.gain * -1}%',
                              style: favoriteStock.gain > 0
                                  ? const TextStyle(
                                      color: Colors.green, fontSize: 13)
                                  : const TextStyle(
                                      color: Colors.red, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
