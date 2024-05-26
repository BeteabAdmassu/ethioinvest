import 'package:ethioinvest/views/Markets.dart';
import 'package:ethioinvest/views/Portfolio.dart';
import 'package:ethioinvest/views/Profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MarketsPage(),
    PortfolioPage(),
    ProfilePage(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Markets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String amount = "10,000";
  String username = 'Bamlak';
  String percent = '+12.30%';
  bool _textVisible = true;

  void toggleShow() {
    setState(() {
      _textVisible = !_textVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $username'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Investments',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              
              height: 110,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 76, 187, 176),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                       color: Colors.black.withOpacity(0.6), // Shadow color with opacity
                    spreadRadius: 2, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 4),
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Gains and Loses",
                          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(_textVisible?'$amount Birr': '*****',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("This Week",
                          style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(
                          _textVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: toggleShow,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Collections',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(

              foregroundDecoration: BoxDecoration(
 borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  opacity: 0.4,
                  fit:BoxFit.cover,
                  image: NetworkImage("https://imgs.search.brave.com/P5t-v5iqe3i2d-MLbEkqKNjLvb0MJMX-BRlMY2Y-FC4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hLXVz/LnN0b3J5Ymxvay5j/b20vZi8xMDE2Mjg5/LzIxMjJ4MTY3MS80/Y2EwNTE3NGQ3L3Rl/Y2huaWNhbC1qb3Vy/bmFsMi5qcGcvbS8y/MTIyeDA"))
              ),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 194, 193, 193),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                       color: Colors.black.withOpacity(0.6), // Shadow color with opacity
                    spreadRadius: 2, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 4),
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Banks',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Invest in the biggest banks in Ethiopia",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      SizedBox(height: 8),
                      Text(
                        percent,
                        style: TextStyle(color: const Color.fromARGB(255, 2, 252, 10)),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.account_balance,
                    size: 35,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Favorites',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
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
            SizedBox(height: 8),
            FavoriteCard(
              title: 'AIB',
              subtitle: 'Awash Bank',
              amount: '900 Birr',
              change: '+11.30%',
              changeColor: Colors.green,
              icon: Icons.account_balance,
              gradient: LinearGradient(
                colors: [Colors.lightGreen, Colors.tealAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              subtitleStyle: TextStyle(fontSize: 14, color: Colors.black),
              iconColor: Colors.white,
              iconSize: 50,
              onTap: () {
                print('Awash Bank card tapped');
              },
            ),
            SizedBox(height: 8),
            FavoriteCard(
              title: 'RIDE',
              subtitle: 'Ride Ethiopia',
              amount: '200 Birr',
              change: '-18.30%',
              changeColor: Colors.red,
              icon: Icons.directions_car,
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
                print('Ride card tapped');
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
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Card(
          shadowColor: Colors.amber,
          elevation: 6,
          color: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
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
