import 'package:flutter/material.dart';

import '../../const/strings.dart';

class Calendar extends StatelessWidget {
  final void Function() onDateChanged;
  final double width;

  const Calendar({required this.onDateChanged, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
      ),
      child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2010, 8),
        lastDate: DateTime.now().add(Duration(days: 100000)),
        onDateChanged: (DateTime value) {
          onDateChanged;
        },
      ),
    );
  }
}
