import 'package:flutter/material.dart';
import 'package:ethioinvest/views/Profile.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  String _namevalue = '';
  String _emailvalue='';
  String _passwordvalue='';
String user='Bamlak';
String email='bamlak@gmail.com';
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        
        child: Container(
          
          child: Column(
         
            children: <Widget>[
                SizedBox(height: 10),
              Text(
                'Setting Page',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
                Icon(
    Icons.person,
    size: 100,
    
  ),
  
  Text(user, style: TextStyle( color: Colors.grey,fontSize: 17, fontWeight: FontWeight.bold) ),
   Text(email, style: TextStyle(color: Colors.grey,fontSize: 17, fontWeight: FontWeight.bold) ),

               SizedBox(height: 30),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _namevalue = value;
                  });
                },
              ),
               SizedBox(height: 30),
                 TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _emailvalue = value;
                  });
                },
              ),
               SizedBox(height: 30),
                 TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _passwordvalue = value;
                  });
                },
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
             children: <Widget> [
              
            
              
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },

                child: Text('Back'),
                style: ElevatedButton.styleFrom(
            splashFactory: InkSplash.splashFactory, 

        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
       //  backgroundColor: const Color.fromARGB(255, 184, 224, 215),
         
                  
        
      ),
              ),


               SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                },
                child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                           splashFactory: InkSplash.splashFactory, 
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        // backgroundColor: const Color.fromARGB(255, 184, 224, 215),
         
                  
                        ),
              ),

             ],
            )
            ],
          ),
        ),
      ),
    );
  }
}
