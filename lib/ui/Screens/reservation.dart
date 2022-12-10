import 'package:flutter/material.dart';
import 'package:mini_hospital/ui/Screens/filtration.dart';
import 'package:mini_hospital/view_models/patients_view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../widgets/user_details_list_view.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PatientsViewModel>();
    DateTime? dateValue = viewModel.dateValue;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await viewModel.setDate(context);
            },
            icon: Image.asset(
              'images/vFilter.png',
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: const Color(0xff2D46B9),
        title: const Text(
          'All reservation',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: dateValue == null
          ? const ReservationBody()
          : Filtration(
              dateValue: DateFormat('dd/MM/yyyy').format(dateValue),
            ),
    );
  }
}

class ReservationBody extends StatelessWidget {
  const ReservationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PatientsViewModel>();
    final allPatients = viewModel.patient ?? [];
    if (allPatients.isNotEmpty) {
      return UserDetailsListView(
        allPatients: allPatients,
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(color: Colors.black, strokeWidth: 5),
      );
    }
  }
}
