import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../../../../style/colors.dart';
import '../../../../style/costraints.dart';
import '../../../../style/text_style.dart';
import '../widgets/online_img.dart';
import '../widgets/personimg.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    _sendMessageArea() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 70,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.emoji_emotions),
              iconSize: 25,
              color: AppColor.nonactive,
              onPressed: () {},
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Write a message...',
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.attach_file,
              ),
              iconSize: 25,
              color: AppColor.nonactive,
              onPressed: () {},
            ),
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard_voice_sharp,
                  color: AppColor.white,
                ),
                // iconSize: 25,

                color: Theme.of(context).primaryColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.nonactive, size: 30),
        backgroundColor: AppColor.white,
        leadingWidth: 20,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Spacer(),
            PersonImage(radius: 20, image: 'person.jpeg'),
            const SizedBox(width: 5),
            SizedBox(
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Dr \ Ahmed",
                    style: AppTextStyles.boldnames,
                    overflow: TextOverflow.clip,
                  ),
                  // Text(
                  //   "7 Online, from 12 peoples",
                  //   style: AppTextStyles.w300.apply(
                  //     color: AppColor.nonactive,
                  //   ),
                  // )
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.videocam_rounded,
              //  size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.more_vert,
              //  size: 25,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      MyCircleAvatar(image: 'person3.jpeg', online: true),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * .6),
                            padding: const EdgeInsets.all(15.0),
                            decoration: const BoxDecoration(
                              color: Color(0xffdfdfdf),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Milk Mazowski",
                                      style: AppTextStyles.w500.apply(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(
                                      "admin",
                                      style: AppTextStyles.w300
                                          .apply(color: AppColor.nonactive),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "The sent messages don’t need all of that, just the message and the time is enough. However, it is important to set a different color to the Container in order to differentiate between sent and received messages",
                                  style: AppTextStyles.w300.apply(
                                    color: Colors.black87,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "16:04",
                                    style: AppTextStyles.w300
                                        .apply(color: AppColor.nonactive),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            child: Image.asset(
                              'assets/images/large.png',
                              fit: BoxFit.cover,
                              height: 100,
                              width: MediaQuery.of(context).size.width * .6,
                            ),
                          ),
                          const SizedBox(height: 2),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6)),
                                    child: Image.asset(
                                      'assets/images/med.png',
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6)),
                                    child: Image.asset(
                                      'assets/images/med1.png',
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        MyCircleAvatar(image: 'person1.jpeg', online: true),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * .6),
                              padding: const EdgeInsets.all(15.0),
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Text(
                                      "The sent messages don’t need all of that, just the message and the time is enough. However, it is important to set a different color to the Container in order to differentiate between sent and received messages",
                                      style: AppTextStyles.w300.apply(
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "16:04",
                                      style: AppTextStyles.w300
                                          .apply(color: AppColor.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/animation/typing-message.json',
                          height: MediaQueryHelper.sizeFromHeight(context, 11),
                          width: MediaQueryHelper.sizeFromWidth(context, 8)),
                      SizedBox(
                        width: 40,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Positioned(
                                left: 18,
                                child: PersonImage(
                                    radius: 5, image: 'person4.png')),
                            Positioned(
                              left: 8,
                              child:
                                  PersonImage(radius: 5, image: 'person3.jpeg'),
                            ),
                            Positioned(
                              child:
                                  PersonImage(radius: 5, image: 'person2.jpeg'),
                            ),
                          ],
                        ),
                      ),
                      const Text('+2  others are typing...')
                    ],
                  )
                ],
              ),
            ),
          )),
          Container(
            height: 40,
          ),
          Align(alignment: Alignment.bottomCenter, child: _sendMessageArea()),
        ],
      ),
    );
  }
}
