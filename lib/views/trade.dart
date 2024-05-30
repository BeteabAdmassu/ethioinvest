import 'package:flutter/material.dart';

class Trade extends StatelessWidget {
  const Trade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markets'),
      ),
      body: Column(children: [
        Expanded(
          child: Center(
            child: Column(
              children: [StockCard()],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(),
    );
  }

  FractionallySizedBox StockCard(
      {String symbol = 'AIB', name = "Awash International Bank"}) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Card.outlined(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: SizedBox(
            height: 70,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/companyLogos/$symbol.png',
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
                            symbol,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, // Make the text bold
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            name,
                            style: const TextStyle(color: Colors.black54),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('900'),
                      Text('90%'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
