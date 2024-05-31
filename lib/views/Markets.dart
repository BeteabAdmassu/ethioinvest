import 'package:ethioinvest/models/Stock.dart';
import 'package:ethioinvest/widgets/StockCard.dart';
import 'package:flutter/material.dart';

class Markets extends StatelessWidget {
  const Markets({super.key});

  @override
  Widget build(BuildContext context) {
    List<Stock> stocks = [
      Stock(
        companyName: "Awash International Bank",
        symbol: "AIB",
        description:
            "Awash International Bank was founded in 199x and has been serving many customers",
        averagePrice: 39.92,
        gain: 81.22,
      ),
      Stock(
        companyName: "Dashen Bank",
        symbol: "DSHB",
        description:
            "Dashen Bank provides various banking services and has a strong presence in the market.",
        averagePrice: 45.50,
        gain: 92.10,
      ),
      Stock(
        companyName: "Commercial Bank of Ethiopia",
        symbol: "CBE",
        description:
            "Commercial Bank of Ethiopia is the largest commercial bank in Ethiopia.",
        averagePrice: 60.75,
        gain: 105.30,
      ),
      Stock(
        companyName: "Nib International Bank",
        symbol: "SSUN",
        description:
            "Nib International Bank offers innovative banking solutions and excellent customer service.",
        averagePrice: 32.20,
        gain: 78.90,
      ),
      Stock(
        companyName: "Berhan Bank",
        symbol: "BOA",
        description:
            "Berhan Bank is known for its efficient and customer-friendly banking services.",
        averagePrice: 28.50,
        gain: 70.00,
      ),
      Stock(
        companyName: "Awash International Bank",
        symbol: "AIB",
        description:
            "Awash International Bank was founded in 199x and has been serving many customers",
        averagePrice: 39.92,
        gain: 81.22,
      ),
      Stock(
        companyName: "Dashen Bank",
        symbol: "DSHB",
        description:
            "Dashen Bank provides various banking services and has a strong presence in the market.",
        averagePrice: 45.50,
        gain: 92.10,
      ),
      Stock(
        companyName: "Commercial Bank of Ethiopia",
        symbol: "CBE",
        description:
            "Commercial Bank of Ethiopia is the largest commercial bank in Ethiopia.",
        averagePrice: 60.75,
        gain: 105.30,
      ),
      Stock(
        companyName: "Nib International Bank",
        symbol: "SSUN",
        description:
            "Nib International Bank offers innovative banking solutions and excellent customer service.",
        averagePrice: 32.20,
        gain: 78.90,
      ),
      Stock(
        companyName: "Berhan Bank",
        symbol: "BOA",
        description:
            "Berhan Bank is known for its efficient and customer-friendly banking services.",
        averagePrice: 28.50,
        gain: 70.00,
      ),
      Stock(
        companyName: "Commercial Bank of Ethiopia",
        symbol: "CBE",
        description:
            "Commercial Bank of Ethiopia is the largest commercial bank in Ethiopia.",
        averagePrice: 60.75,
        gain: 105.30,
      ),
      Stock(
        companyName: "Nib International Bank",
        symbol: "SSUN",
        description:
            "Nib International Bank offers innovative banking solutions and excellent customer service.",
        averagePrice: 32.20,
        gain: 78.90,
      ),
      Stock(
        companyName: "Berhan Bank",
        symbol: "BOA",
        description:
            "Berhan Bank is known for its efficient and customer-friendly banking services.",
        averagePrice: 28.50,
        gain: 70.00,
      ),
      Stock(
        companyName: "Commercial Bank of Ethiopia",
        symbol: "CBE",
        description:
            "Commercial Bank of Ethiopia is the largest commercial bank in Ethiopia.",
        averagePrice: 60.75,
        gain: 105.30,
      ),
      Stock(
        companyName: "Nib International Bank",
        symbol: "SSUN",
        description:
            "Nib International Bank offers innovative banking solutions and excellent customer service.",
        averagePrice: 32.20,
        gain: 78.90,
      ),
      Stock(
        companyName: "Berhan Bank",
        symbol: "BOA",
        description:
            "Berhan Bank is known for its efficient and customer-friendly banking services.",
        averagePrice: 28.50,
        gain: 70.00,
      ),
      Stock(
        companyName: "Nib International Bank",
        symbol: "SSUN",
        description:
            "Nib International Bank offers innovative banking solutions and excellent customer service.",
        averagePrice: 32.20,
        gain: 78.90,
      ),
      Stock(
        companyName: "Berhan Bank",
        symbol: "BOA",
        description:
            "Berhan Bank is known for its efficient and customer-friendly banking services.",
        averagePrice: 28.50,
        gain: 70.00,
      ),
      Stock(
        companyName: "Commercial Bank of Ethiopia",
        symbol: "CBE",
        description:
            "Commercial Bank of Ethiopia is the largest commercial bank in Ethiopia.",
        averagePrice: 60.75,
        gain: 105.30,
      ),
      Stock(
        companyName: "Nib International Bank",
        symbol: "SSUN",
        description:
            "Nib International Bank offers innovative banking solutions and excellent customer service.",
        averagePrice: 32.20,
        gain: 78.90,
      ),
      Stock(
        companyName: "Berhan Bank",
        symbol: "BOA",
        description:
            "Berhan Bank is known for its efficient and customer-friendly banking services.",
        averagePrice: 28.50,
        gain: 70.00,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markets'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          for (var stock in stocks) stockCard(stock: stock, context: context),
        ]),
      ),
    );
  }
}
