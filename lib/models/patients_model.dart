import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class PatientsModel {
  String? name, pain, description, date, time;
  Timestamp? fullDate;
  int? age;

  PatientsModel(this.name, this.pain, this.description, this.fullDate,
      this.date, this.time, this.age);

  PatientsModel.fromFire(Map<dynamic, dynamic> map) {
    name = map['name'];
    age = map['age'];
    pain = map['pain'];
    description = map['description'];
    fullDate = map['date'] as Timestamp;
    date = DateFormat('dd/MM/yyyy').format(((fullDate)!.toDate()));
    time = DateFormat('hh:mm a').format(((fullDate)!.toDate()));
  }
}
