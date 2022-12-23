import 'package:flutter/material.dart';
import 'package:mini_hospital/ui/Screens/chats/screens/chat_screen/chat_screen.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';
import '../screens/Chatroom.dart';
import 'new_msg.dart';
import 'online_img.dart';

class ChatBox extends StatelessWidget {
  String name;
  String img;
  String msg;
  String date;
  bool isnew;

  ChatBox(
      {required this.name,
      required this.img,
      required this.msg,
      required this.date,
      required this.isnew,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ChatScreen()));
        },
        tileColor: isnew ? AppColor.focuscolur : AppColor.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        selectedColor: AppColor.focuscolur,
        leading: MyCircleAvatar(image: img, online: isnew),
        title: Text(name, style: AppTextStyles.boldnames),
        subtitle: Text(msg,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.greytxt),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(date), isnew ? NewMsg() : SizedBox()],
        ),
      ),
    );
  }
}
