import 'package:flutter/material.dart';

//todo: cupertino!
Future<DateTime?> selectDate(BuildContext context,
    {DateTime? initialDate}) async {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime firstDate = DateTime(2000, 1, 1);

  final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? today,
      firstDate: firstDate,
      lastDate: today,
      initialEntryMode:
          DatePickerEntryMode.calendarOnly); // This prevents manual input mode

  return selectedDate;
}
