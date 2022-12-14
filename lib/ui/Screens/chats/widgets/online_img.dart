import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  String? image;

  bool? online;

  MyCircleAvatar({required this.image, required this.online, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/$image')
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.all(5.5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                    color: online==true ? Colors.green : Colors.grey)))
      ],
    );
  }
}
