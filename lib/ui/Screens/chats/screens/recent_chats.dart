import 'package:flutter/material.dart';

import '../../../../style/colors.dart';
import '../../../../style/costraints.dart';
import '../cubit/cubit/cubit.dart';
import '../models/recent_model.dart';
import '../widgets/chatbox.dart';
import '../widgets/filter_card.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )),
        elevation: 0,
        title: const Text('Recent Chats',
            style: TextStyle(color: AppColor.primarytext)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            // padding: const EdgeInsets.only(bottom: 60),
            children: [
              // Container(
              //   height: MediaQueryHelper.sizeFromHeight(context, 10),
              //   color: AppColor.white,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: ChatCubit.get(context)
              //         .tabs
              //         .map((e) => FilterCard(tab: e))
              //         .toList(),
              //   ),
              // ),
              Container(
                height: MediaQueryHelper.sizeFromHeight(context, 1.2),
                child: ListView.builder(
                    itemCount: screen.length,
                    itemBuilder: (context, index) {
                      return ChatBox(
                        name: screen[index].name,
                        msg: screen[index].msg,
                        img: screen[index].img,
                        isnew: screen[index].isnew,
                        date: screen[index].data,
                      );
                    }),
              )

            ]),
      ),
    );
  }
}

List<RecentModel> screen = const <RecentModel>[
  RecentModel(
      name: "Darlene Steward",
      img: 'person.jpeg',
      msg: 'Pls take a look at the images.',
      data: '18:31',
      isnew: true),
  RecentModel(
      name: "Fullsnack Designers",
      img: 'person4.png',
      msg: 'Hello guys, we have discussed about ...',
      data: '16.04',
      isnew: false),
  RecentModel(
      name: "Lee Williamson",
      img: 'person1.jpeg',
      msg: 'Yes, that\'s gonna work, hopefully.',
      data: '06:12',
      isnew: false),
  RecentModel(
      name: "Ronald Mccoy",
      img: 'person2.jpeg',
      msg: ' Thanks dude 😉',
      data: 'Yesterday',
      isnew: false),
  RecentModel(
      name: "Albert Bell",
      img: 'person3.jpeg',
      msg: 'I\'m happy this anime has such grea...',
      data: 'Yesterday',
      isnew: false),
  RecentModel(
      name: "Darlene Steward",
      img: 'person4.png',
      msg: 'Pls take a look at the images.',
      data: '18:31',
      isnew: false),
  RecentModel(
      name: "Darlene Steward",
      img: 'person.jpeg',
      msg: 'Pls take a look at the images.',
      data: '18:31',
      isnew: false),
];
