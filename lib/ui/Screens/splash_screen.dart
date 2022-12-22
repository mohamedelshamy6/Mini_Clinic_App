import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_hospital/services/notification_services.dart';
import 'package:mini_hospital/ui/Screens/home_screen.dart';
import 'package:mini_hospital/ui/Screens/login.dart';
import 'package:mini_hospital/view_models/patients_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

List dates = [];

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<User?> user;

  @override
  void initState() {
    allNotification();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {});
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FirebaseAuth.instance.currentUser == null
                ? const Login()
                : const HomeScreen(),
          ));
    });
    super.initState();
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  allNotification() {
    for (Timestamp i in dates) {
      DateTime date = i.toDate().subtract(const Duration(minutes: 15));
      NotificationApi().showScheduledNotification(
          scheduleDate: date,

          title: 'Patient reminder',
          body: 'You have an appointment in 15 minutes');
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PatientsViewModel>();
    final allDates = viewModel.patient ?? [];
    for (int i = 0; i < allDates.length; i++) {
      setState(() {
        dates.add(allDates[i].fullDate);
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding:const EdgeInsets.fromLTRB(0, 150, 0, 35),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Lottie.asset('images/logo.json',width: 200,height: 200),
                const Text(
                  'Loading ... ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 5),
                const Text(
                  'Sameh Elbadry',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
