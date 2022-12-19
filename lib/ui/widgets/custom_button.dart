import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/home_screen.dart';

class CustomLoginButton extends StatelessWidget {
   CustomLoginButton({

     required this.formKey,
     required this.auth,
     required this.emailController,
     required this.passController,
   }
  ) ;

  final GlobalKey<FormState> formKey;
  final FirebaseAuth auth;
  final TextEditingController emailController;
  final TextEditingController passController;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: MaterialButton(
          color: Colors.blue[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: () async {
            if (formKey.currentState!.validate()) {}

              auth
                  .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passController.text)
                  .then((value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              });


          },
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
