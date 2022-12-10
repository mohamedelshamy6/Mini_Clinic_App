import 'package:flutter/material.dart';
import 'package:mini_hospital/ui/widgets/user_details_list_view.dart';
import 'package:provider/provider.dart';
import '../../view_models/patients_view_model.dart';

class Filtration extends StatefulWidget {
  const Filtration({Key? key, this.dateValue}) : super(key: key);
  final String? dateValue;

  @override
  State<Filtration> createState() => _FiltrationState();
}

class _FiltrationState extends State<Filtration> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PatientsViewModel>();
    final allPatients = viewModel.patient ?? [];
    final result = [];
    if (allPatients.isNotEmpty) {
      //filtering reservations by date
      setState(() {
        result.addAll(
          allPatients.where(
            (element) => element.date == widget.dateValue,
          ),
        );
      });
      return UserDetailsListView(allPatients: result);
    } else {
      return const Center(
        child: Text(
          'There is nothing to show .',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}
