import 'package:ethioinvest/models/Stock.dart';
import 'package:ethioinvest/views/trade.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget stockCard({required Stock stock, required BuildContext context}) {
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
                builder: (context) => Trade(stock: stock),
              ),
            );
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
                              fontWeight: FontWeight.bold, // Make the text bold
                              fontSize: 16.0,
                            ),
                          ),
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            strutStyle: const StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                text: stock.companyName),
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
                        '${stock.averagePrice} Birr',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${stock.gain > 0 ? '+' : '-'} ${stock.gain > 0 ? stock.gain : stock.gain * -1}%',
                        style: stock.gain > 0
                            ? const TextStyle(color: Colors.green, fontSize: 13)
                            : const TextStyle(color: Colors.red, fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
