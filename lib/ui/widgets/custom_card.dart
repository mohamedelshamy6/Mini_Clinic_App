import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.text,
    required this.page,
  }) : super(key: key);
  final String text;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            )),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [
                const Color(0xff1E3163).withOpacity(0.85),
                const Color(0xff2D46B9).withOpacity(0.85)
              ], stops: const [
                0.2,
                0.8
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
            child: Center(
              child: Text(
                text == 'reservation'
                    ? 'Go to reservation screen'
                    : 'Go to chat screen',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
