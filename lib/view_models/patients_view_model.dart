import 'package:flutter/cupertino.dart';
import 'package:mini_hospital/models/patients_model.dart';
import 'package:mini_hospital/repositories/patients_repository.dart';

class PatientsViewModel with ChangeNotifier{
  List<PatientsModel>? patient;
  Future<List<PatientsModel>?> getAllPatients() async {
    patient = await fetchPatients();

    notifyListeners();
    return patient;
  }

}