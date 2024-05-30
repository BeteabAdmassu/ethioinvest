import 'dart:ui';

import 'package:ethioinvest/views/Setting.dart';
import 'package:ethioinvest/views/Help_support.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../providers/auth_provider.dart';

class ProfilePage extends ConsumerWidget {
  @override
//  _ProfilePageState createState() => _ProfilePageState();

static const String user = "bamlak";
  static const String email = "bamlak@gmail.com";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 100,
                ),
                Text(
                  user,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingPage()),
                    );
                  },
                  icon: Icon(Icons.settings),
                  label: const Text(
                    'Setting',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                     splashFactory: InkRipple.splashFactory,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    foregroundColor:  Color.fromARGB(255, 209, 82, 221),
                   backgroundColor: Colors.white,
                    // Default color
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Help_support()),
                    );
                  },
                  icon: Icon(Icons.help),
                  label: const Text(
                    'Help & Support',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                     splashFactory: InkSplash.splashFactory,
                      backgroundColor: Colors.white, 
                    foregroundColor:  Color.fromARGB(255, 209, 82, 221),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                  // Default color
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () async{
                    
              await authNotifier.logoutUser(context);
            
                  },
                  icon: Icon(Icons.logout),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      splashFactory: InkSplash.splashFactory,
                    backgroundColor: Colors.white, 
                    foregroundColor:  Color.fromARGB(255, 209, 82, 221),
                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 65), // Default color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class _ProfilePageState extends State<ProfilePage> {
  
// }
