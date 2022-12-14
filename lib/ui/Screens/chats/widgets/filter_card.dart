import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../style/colors.dart';
import '../../../../style/costraints.dart';
import '../cubit/cubit/cubit.dart';
import '../cubit/states/states.dart';
import '../models/tab_model.dart';


class FilterCard extends StatelessWidget {
  const FilterCard({Key? key, required this.tab}) : super(key: key);
  final TabModel tab;

  @override
  Widget build(BuildContext context) {
    final ChatCubit cubit = ChatCubit.get(context);
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 5),
          child: InkWell(
            onTap: () => cubit.changeTab(tab),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cubit.selectedTab == tab.id
                    ? AppColor.mainColor
                    : AppColor.white,
              ),
              height: MediaQueryHelper.sizeFromWidth(context, 10),
              width: MediaQueryHelper.sizeFromWidth(context, 5),
              child: Center(
                  child: Text(
                    tab.text,
                    style: TextStyle(
                        color: cubit.selectedTab == tab.id
                            ? AppColor.white
                            : AppColor.nonactive),
                  )),
            ),
          ),
        );
      },
    );
  }
}
