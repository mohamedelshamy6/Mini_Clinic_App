import 'package:flutter/material.dart';
import 'package:mini_hospital/style/text_style.dart';
import 'package:mini_hospital/ui/Screens/patient_view.dart';

import '../../style/costraints.dart';
import 'chats/screens/chat_screen/message_bubble.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("History"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Description", style: AppTextStyles.largefont),
            ),
            Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 100,
                width: MediaQueryHelper.sizeFromWidth(context, 1.08),
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    // borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    )),
                padding: const EdgeInsets.all(5),
                child: const Text(
                    style: AppTextStyles.w700,
                    'I have bla bla bla bla bla bla bla bla bla bla bla bla  bla bla bla bla bla bla bla bla bla bla bla bla '),
              ),
            ),
            Container(
              height: MediaQueryHelper.sizeFromHeight(context, 5),
              width: MediaQueryHelper.sizeFromWidth(context, 1),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ShowImage(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ37TSO0ADP1c41hwUk2lRIWndK0swJyyasNQ&usqp=CAU",
                    ),
                  ),
                ),
                child: Container(
                    height: MediaQueryHelper.sizeFromHeight(context, 4),
                    width: MediaQueryHelper.sizeFromHeight(context, 3.5),
                    decoration: BoxDecoration(
                      //shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.blue, width: 2),
                      //  borderRadius: BorderRadius.circular(20)
                    ),
                    // alignment:
                    // message != "" ? null : Alignment.center,
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ37TSO0ADP1c41hwUk2lRIWndK0swJyyasNQ&usqp=CAU",
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("prescriptions", style: AppTextStyles.largefont),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: addpres.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "The history is empty.",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Expanded(
                          child: Container(
                          width: MediaQuery.of(context).size.width,
                          child:
                              ListView.builder(itemBuilder: (context, index) {
                            return Material(
                              elevation: 15,
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: 100,
                                width: MediaQueryHelper.sizeFromWidth(
                                    context, 1.08),
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    )),
                                padding: const EdgeInsets.all(5),
                                child: Text('${addpres[index]}',
                                    style: AppTextStyles.w700),
                              ),
                            );
                          }),
                        ))),
            )
          ],
        ),
      ),
    );
  }
}
