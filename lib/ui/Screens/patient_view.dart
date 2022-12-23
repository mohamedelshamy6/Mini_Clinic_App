import 'package:flutter/material.dart';
import 'package:mini_hospital/style/text_style.dart';

import '../../style/costraints.dart';
import 'chats/screens/chat_screen/message_bubble.dart';

class PatientView extends StatelessWidget {
  const PatientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Sameh"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.history))
        ],
      ),
      body: Column(
        children: [
          const Text("Description", style: AppTextStyles.largefont),
          Material(
            elevation: 15,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  )),
              padding: const EdgeInsets.all(5),
              child: const Text(
                  'I have bla bla bla bla bla bla bla bla bla bla bla bla  bla bla bla bla bla bla bla bla bla bla bla bla '),
            ),
          ),
          Container(
            height: MediaQueryHelper.sizeFromHeight(context, 5),
            width: MediaQueryHelper.sizeFromHeight(context, 2),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            // alignment: !isMe
            //     ? Alignment.centerRight
            //     : Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ShowImage(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnZc4nu61fo87fwxBfVNGokRj1TP8t6IrdEQ&usqp=CAU",
                  ),
                ),
              ),
              child: Container(
                  height: MediaQueryHelper.sizeFromHeight(context, 4),
                  width: MediaQueryHelper.sizeFromHeight(context, 3.5),
                  decoration: BoxDecoration(border: Border.all()),
                  // alignment:
                  // message != "" ? null : Alignment.center,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnZc4nu61fo87fwxBfVNGokRj1TP8t6IrdEQ&usqp=CAU",
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const Text("prescriptions", style: AppTextStyles.largefont),
          Expanded(
            child: Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                return const Text("data",style: AppTextStyles.largefont,);
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
