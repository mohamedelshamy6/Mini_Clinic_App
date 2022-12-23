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
                          "No prescriptions Yet... Add One Now",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Material(
                        elevation: 15,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 100,
                          width: MediaQueryHelper.sizeFromWidth(context, 1.08),
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              )),
                          padding: const EdgeInsets.all(5),
                          child: Text('${addpres.last}',
                              style: AppTextStyles.w700),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPrescription()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

///add SnackBar is opened when click on floatingActionButton to add prescriptions and save it in list then view it on same screen
class AddPrescription extends StatelessWidget {
  AddPrescription({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a prescription"),
        actions: const [Icon(Icons.search)],
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 20,
                controller: controller,
                // initialValue: 'Write here.....',
                style: AppTextStyles.boldnames,
                decoration: InputDecoration(
                  labelText: 'Add a prescription',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Colors.greenAccent), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Colors.greenAccent), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addpres.add(controller.text);
                //addpres.clear();
                print(addpres);
              },
              child: const Text(
                "Save",
                style: AppTextStyles.w700,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //addpres.add(controller.text);
                addpres.clear();
                print(addpres);
              },
              child: const Text(
                "Clear all prescriptions",
                style: AppTextStyles.w700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      )),
    );
  }
}

List<String> addpres = [];
