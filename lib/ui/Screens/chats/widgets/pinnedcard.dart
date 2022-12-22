import 'package:flutter/material.dart';

import '../../../../style/colors.dart';
import '../../../../style/costraints.dart';
import '../../../../style/text_style.dart';
import 'online_img.dart';

class PinnedCard extends StatelessWidget {
  //int id;
  String name;
  String img;
  String msg;
  bool active;
  bool isnew;

  PinnedCard(BuildContext context,
      {required this.name,
      required this.img,
      required this.msg,
      required this.active,
      required this.isnew,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isnew ? AppColor.focuscolur : AppColor.card,
        ),
        padding: EdgeInsets.all(5),
        height: MediaQueryHelper.sizeFromHeight(context, 6),
        width: MediaQueryHelper.sizeFromWidth(context, 2.2),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            isnew
                ? Container(
                    width: 7,
                    height: 7,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius: BorderRadius.circular(30)),
                  )
                : const SizedBox(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: ListTile(
                  minLeadingWidth: 2,

                  // trailing: SizedBox(width: 10,),
                  leading: MyCircleAvatar(image: img, online: active),
                  title: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.boldnames,
                    maxLines: 2,
                  ),
                ),
              ),
              Text(
                msg,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.greytxt,
              ),
            ]),
          ],
        ));
  }
}
