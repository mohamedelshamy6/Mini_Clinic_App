import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_hospital/ui/Screens/chats/screens/recent_chats.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../../style/colors.dart';


import '../cubit/cubit/cubit.dart';
import '../models/pinned_model.dart';
import '../widgets/personimg.dart';
import '../widgets/pinnedcard.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PinnedModel? pinnedModel;
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: SlidingUpPanel(
        maxHeight: MediaQuery.of(context).size.height,
        minHeight: MediaQuery.of(context).size.height / 1.9,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        body: Scaffold(
          backgroundColor: AppColor.scaffoldbackground,
          appBar: AppBar(
            backgroundColor: AppColor.scaffoldbackground,
            elevation: 0,
            title: const Text('Pinned Chats',
                style: TextStyle(color: AppColor.primarytext)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PersonImage(radius: 15, image: 'person.jpeg'),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
                itemCount: screen.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.7),
                itemBuilder: (_, int index) {
                  return
                      // screen
                      // .map((e) => PinnedCard(e))
                      // .toList();
                      InkWell(
                          onTap: () {
                            print('${screen.length}testttttttttttt');
                          },
                          borderRadius: BorderRadius.circular(10),
                          highlightColor: AppColor.focuscolur,
                          child: PinnedCard(
                            context,
                            name: screen[index].name,
                            img: screen[index].img,
                            msg: screen[index].msg,
                            active: screen[index].active,
                            isnew: screen[index].isnew,
                          ));
                }),
          ),
        ),
        header: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[200]!,
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
              ),
            ),
          ),
        ),
        panel: const RecentChats(),
      ),
    );
  }
}

List<PinnedModel> screen = const <PinnedModel>[
  PinnedModel(
      id: 0,
      name: 'Yara Khaled',
      img: 'person1.jpeg',
      msg: ' That\'s awesome! ..',
      active: false,
      isnew: false),
  PinnedModel(
      id: 1,
      name: 'Mohamed Ali',
      img: 'person.jpeg',
      msg: ' Pis take alookat the.. ',
      active: false,
      isnew: true),
  PinnedModel(
      id: 2,
      name: 'Ali Sameh',
      img: 'person2.jpeg',
      msg: ' Preparing for next vac...',
      active: false,
      isnew: false),
  PinnedModel(
      id: 3,
      name: 'Sara Amgad',
      img: 'person3.jpeg',
      msg: ' © I\'dlike to watch...',
      active: true,
      isnew: false),
 
];
