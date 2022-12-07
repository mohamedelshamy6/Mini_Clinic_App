import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_hospital/models/patients_model.dart';

Future<List<PatientsModel>> fetchPatients() async {
  List<PatientsModel> result = [];
  CollectionReference patientRef =
      FirebaseFirestore.instance.collection('patients');
  QuerySnapshot querySnapshot = await patientRef.get();
  List<QueryDocumentSnapshot> docsList = querySnapshot.docs;
  for (var doc in docsList) {
    PatientsModel patient =
        PatientsModel.fromFire(doc.data() as Map<dynamic, dynamic>);
    result.add(patient);
  }
  return result;
}
