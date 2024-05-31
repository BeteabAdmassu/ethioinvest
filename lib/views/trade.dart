import 'package:ethioinvest/models/Stock.dart';
import 'package:flutter/material.dart';

class Trade extends StatelessWidget {
  final Stock stock;
  const Trade({super.key, required this.stock});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(stock.companyName),
        ),
        body: Text(stock.companyName)
        //bottomNavigationBar: const BottomAppBar(),
        );
  }
}
