import 'package:ethioinvest/models/Portfolio.dart';
import 'package:ethioinvest/models/Stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Trade extends StatelessWidget {
  final Stock stock;
  //PortfolioItem portfolio;
  const Trade({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
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
                          onPressed: buy,
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
                    Text(stock.description),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void buy() {}

  void sell() {}
}
