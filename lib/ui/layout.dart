import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Screens/chats/screens/recent_chats.dart';
import 'Screens/home_screen.dart';
import 'Screens/login.dart';
import 'Screens/reservation.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ReservationScreen(),
    RecentChats(),
    SizedBox()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignIn user = GoogleSignIn();
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          onTap: _onItemTapped,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            const BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long), label: ""),
            const BottomNavigationBarItem(icon: Icon(Icons.chat), label: ""),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      //google sign out
                      user.signOut();
                      // when signing out .. go to login screen.
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    icon: Icon(Icons.logout)),
                label: ""),
          ]),
    );
  }
}
