import 'package:flutter/material.dart';
import 'package:mini_hospital/models/patients_model.dart';
import 'package:mini_hospital/repositories/patients_repository.dart';

class PatientsViewModel with ChangeNotifier {

  List<PatientsModel>? patient;
  DateTime? dateTime, dateValue;

  Future<List<PatientsModel>?> getAllPatients() async {
    patient = await fetchPatients();

    notifyListeners();
    return patient;
  }



  setDate(context) async {
    dateTime = await showDatePicker(
        context: context,
        initialDate: dateValue != null ? dateValue! : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    dateValue = dateTime;
    notifyListeners();
    return dateValue;
  }
}
