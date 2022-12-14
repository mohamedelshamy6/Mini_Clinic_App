import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_hospital/ui/Screens/login.dart';
import 'package:mini_hospital/ui/Screens/reservation.dart';
import '../widgets/custom_card.dart';
import 'chats/screens/view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoogleSignIn user = GoogleSignIn();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        actions: [
          // user log out.
          TextButton.icon(
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
            icon: Icon(
              Icons.logout,
              color: const Color(0xff1E3163).withOpacity(0.85),
            ),
            label: Text(
              'Sign out',
              style: TextStyle(
                color: const Color(0xff1E3163).withOpacity(0.85),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: const [
                //reservation screen (done).
                CustomCard(
                  text: 'reservation',
                  page: ReservationScreen(),
                ),
                SizedBox(height: 25),
                //chat screen (not finished).
                CustomCard(
                  text: 'chat',
                  page: ChatHome(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
