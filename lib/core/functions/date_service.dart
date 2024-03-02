import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

String parseDate(DateTime dateTime) {
  return DateFormat('EE. yyyy/MM/dd').format(dateTime);
}

String getWelcomeMessageBasedOnTime() {
  String greeting = "";
  int hours = DateTime.now().hour;

  if (hours >= 1 && hours <= 12) {
    greeting = "Good Morning";
  } else if (hours >= 12 && hours <= 16) {
    greeting = "Good Afternoon";
  } else if (hours >= 16 && hours <= 21) {
    greeting = "Good Evening";
  } else if (hours >= 21 && hours <= 24) {
    greeting = "Good Night";
  }

  return greeting;
}

Future<DateTime?> selectDate(BuildContext context, DateTime startDate) async {
  return await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: startDate,
      lastDate: startDate.add(30.days));
}
