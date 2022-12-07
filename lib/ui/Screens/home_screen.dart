import 'package:flutter/material.dart';
import 'package:mini_hospital/ui/Screens/reservetion.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReservationScreen(),
                        )),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xff1E3163).withOpacity(0.85),
                                const Color(0xff2D46B9).withOpacity(0.85)
                              ],
                              stops: const [
                                0.2,
                                0.8
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        child: const Center(
                          child: Text(
                            'Go to reservation screen',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(15),
                    ),
                    child:Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xff1E3163).withOpacity(0.85),
                              const Color(0xff2D46B9).withOpacity(0.85)
                            ],
                            stops: const [
                              0.2,
                              0.8
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                      ),
                      child: const Center(
                        child: Text(
                          'Go to chat screen',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
