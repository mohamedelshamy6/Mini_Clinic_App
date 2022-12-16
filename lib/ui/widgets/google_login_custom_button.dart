import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Screens/home_screen.dart';

class GoogleLoginCustomButton extends StatelessWidget {
  GoogleLoginCustomButton({
    Key? key,
  }) : super(key: key);
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            signInWithGoogle().then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                )));
          },
          child: Row(
            children: [
              SizedBox(
                width: 50,
                child: Image.asset('images/google.png'),
              ),
              const SizedBox(width: 75),
              const Text(
                'Google',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

   Future<UserCredential> signInWithGoogle() async {
     GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
     GoogleSignInAuthentication? googleSignInAuthentication =
     await googleSignInAccount?.authentication;
     AuthCredential authCredential = GoogleAuthProvider.credential(
         accessToken: googleSignInAuthentication?.accessToken,
         idToken: googleSignInAuthentication?.idToken);
     return await auth.signInWithCredential(authCredential);
   }






  }

