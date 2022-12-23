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
      child: const RecentChats(),
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
