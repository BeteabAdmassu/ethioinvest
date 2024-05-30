import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 90),
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 8),
            FavoriteCard(
              title: 'CBE',
              subtitle: 'Commercial Bank of Ethiopia',
              amount: '500 Birr',
              change: '+12.30%',
              changeColor: Colors.green,
              icon: Icons.account_balance_wallet,
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.tealAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              subtitleStyle: TextStyle(fontSize: 14, color: Colors.black),
              iconColor: Colors.white,
              iconSize: 50,
              onTap: () {
                print('CBE tapped');
              },
            ),
          ],
        ),
      ),
    );
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
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
