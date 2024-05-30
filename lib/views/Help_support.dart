

import 'package:ethioinvest/views/Profile.dart';

import 'package:flutter/material.dart';

class Help_support extends StatefulWidget {
  @override
  _Help_supportState createState() => _Help_supportState();
}

class _Help_supportState extends State<Help_support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Help & Support',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              const Text(
                'Welcome to the Help & Support page. We\'re here to assist you with any questions or issues you may have regarding our stock trading app. Below you\'ll find a list of frequently asked questions and helpful resources to get you started.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              _buildFAQSection(
                question: '1. How do I create an account?',
                answer: 'To create an account, follow these steps:\n'
                    '1. Open the app and click on the "Sign Up" button.\n'
                    '2. Enter your personal information, including your name, email address, and password.\n'
                    '3. Verify your email address by clicking on the link sent to your inbox.\n'
                    '4. Complete the KYC (Know Your Customer) process by providing the required documents.',
              ),
              SizedBox(height: 16),
              _buildFAQSection(
                question: '2. How do I buy and sell stocks?',
                answer: 'Buying and selling stocks on our app is simple:\n'
                    '1. Log in to your account.\n'
                    '2. Navigate to the "Markets" tab.\n'
                    '3. Search for the stock you wish to buy or sell.\n'
                    '4. Click on the stock to view its details.\n'
                    '5. Click on the "Buy" or "Sell" button and enter the amount.\n'
                    '6. Confirm your transaction.',
              ),
              SizedBox(height: 16),
              _buildFAQSection(
                question: '3. How do I deposit and withdraw funds?',
                answer: 'To deposit funds:\n'
                    '1. Go to the "Portfolio" tab.\n'
                    '2. Click on the "Deposit" button.\n'
                    '3. Choose your preferred payment method and follow the instructions.\n\n'
                    'To withdraw funds:\n'
                    '1. Go to the "Portfolio" tab.\n'
                    '2. Click on the "Withdraw" button.\n'
                    '3. Enter the amount you wish to withdraw and follow the instructions.',
              ),
              SizedBox(height: 16),
              _buildFAQSection(
                question: '4. What are the fees for trading?',
                answer: 'Our app charges a small commission fee on each trade. You can find the detailed fee structure in the "Account Settings" under the "Fees" section.',
              ),
              SizedBox(height: 16),
              _buildFAQSection(
                question: '5. How do I reset my password?',
                answer: 'If you forget your password, you can reset it by following these steps:\n'
                    '1. Click on the "Forgot Password" link on the login page.\n'
                    '2. Enter your registered email address.\n'
                    '3. Check your email for a password reset link and follow the instructions.',
              ),
              
              SizedBox(height: 16),
              const Text(
                'Community Resources',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              const Text(
                'Join our community forums to connect with other users, share trading tips, and stay updated with the latest market news. Visit our community page at community.stocktradingapp.com.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              const Text(
                'Educational Resources',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              const Text(
                'To help you become a better trader, we offer a range of educational resources, including:\n\n'
                    'Video Tutorials: Step-by-step guides on using the app and understanding the stock market.\n\n'
                    'Webinars: Live sessions with trading experts covering various topics.\n\n'
                    'E-Books: Comprehensive guides on investing strategies and market analysis.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              const Text(
                'We hope this Help & Support page provides the information you need to make the most of our app. Happy trading!',
                style: TextStyle(fontSize: 16),
              ),

                ElevatedButton(
        onPressed: () {
  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );

      }, child: const Text('Back',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      style: ElevatedButton.styleFrom(

      )
      ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQSection({required String question, required String answer}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          answer,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

}
    