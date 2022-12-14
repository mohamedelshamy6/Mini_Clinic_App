import 'package:flutter/material.dart';



class PersonImage extends StatelessWidget {
  double radius;
  String? image;

  PersonImage({required this.radius,required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.zero,
      child: CircleAvatar(

        backgroundImage:  AssetImage(
          'images/$image',
        ),
        radius: radius,
      ),
    );
  }
}
