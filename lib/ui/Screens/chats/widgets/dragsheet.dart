import 'package:flutter/material.dart';

class DragSheet extends StatelessWidget {
  const DragSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
        return ListView.builder(itemBuilder: (context, index) {
          return Text("data");
        });
      }),
    );
  }
}
