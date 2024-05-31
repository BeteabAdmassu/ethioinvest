import 'package:ethioinvest/views/Markets.dart';
import 'package:ethioinvest/views/Portfolio.dart';
import 'package:ethioinvest/views/Profile.dart';
import 'package:flutter/material.dart';
import '../widgets/balance.dart';
import '../widgets/username.dart';
import '../widgets/favoritesCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    Markets(),
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
        type: BottomNavigationBarType.fixed,
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
  bool textVisible = false;

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  void toggleShow() {
    setState(() {
      textVisible = !textVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                usernameTextWidget(),
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
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 76, 187, 176),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.6), // Shadow color with opacity
                          spreadRadius: 2, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: const Offset(0, 4),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Balance",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          balance(textVisible: textVisible),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text("",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: Icon(
                              textVisible
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Collections',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // image: const DecorationImage(
                    //   opacity: 0.4,
                    //   fit: BoxFit.cover,
                    //   image: NetworkImage(
                    //     "https://imgs.search.brave.com/P5t-v5iqe3i2d-MLbEkqKNjLvb0MJMX-BRlMY2Y-FC4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hLXVz/LnN0b3J5Ymxvay5j/b20vZi8xMDE2Mjg5/LzIxMjJ4MTY3MS80/Y2EwNTE3NGQ3L3Rl/Y2huaWNhbC1qb3Vy/bmFsMi5qcGcvbS8y/MTIyeDA",
                    //   ),
                    // ),
                  ),
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 194, 193, 193),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.6), // Shadow color with opacity
                          spreadRadius: 2, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: const Offset(0, 4),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Banks',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Invest in the biggest banks in Ethiopia",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                      const Icon(
                        Icons.account_balance,
                        size: 35,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Favorites',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                FavoriteCard(
                  onTap: () {
                    print('CBE tapped');
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class FavoriteCard extends StatelessWidget {
  final VoidCallback? onTap;

  const FavoriteCard({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: favoritesCard(),
    );
  }
}
