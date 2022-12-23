import 'package:flutter/material.dart';
import 'package:mini_hospital/style/costraints.dart';
import 'package:mini_hospital/view_models/patients_view_model.dart';
import 'package:mini_hospital/view_models/single_patient_view_model.dart';
import 'package:provider/provider.dart';

import '../Screens/patient_view.dart';

class UserDetailsListView extends StatelessWidget {
  const UserDetailsListView({
    Key? key,
    required this.allPatients,
  }) : super(key: key);

  final List allPatients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allPatients.length,
      itemBuilder: (context, index) {
        var patient = allPatients[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Provider<SinglePatientViewModel>(
                          create: (context) =>
                              SinglePatientViewModel(singlePatient: patient),
                          child: const PatientView(),
                        )));
          },
          child: Card(
            margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
                  const Color(0xff2D46B9).withOpacity(0.85),
                  const Color(0xff1E3163).withOpacity(0.85),
                ], stops: const [
                  0.2,
                  0.9
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQueryHelper.sizeFromHeight(context, 3.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white70,
                            child: Icon(
                              Icons.person,
                              color: const Color(0xff1E3163).withOpacity(0.85),
                              size: 50,
                            ),
                          ),
                          //  TextButton(onPressed: (){}, child: Text("Write a prescription"),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : ${patient.name}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Age : ${patient.age}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Pain : ${patient.pain}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          Theme(
                            data: ThemeData().copyWith(
                                iconTheme:
                                    const IconThemeData(color: Colors.white70),
                                dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              iconColor: Colors.white70,
                              collapsedIconColor: Colors.white70,
                              tilePadding: EdgeInsets.zero,
                              title: const Text(
                                'Pain description : ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                              ),
                              children: [
                                Text(
                                  '${patient.description} ',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Text(
                            'Date : ${patient.date}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Time : ${patient.time}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
