import 'package:todo_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class CustomTextStyles {
  static final style50 = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
  static final style25 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static const style20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: Colors.black45,
  );
  static const style18 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black
  );
  static const style15 = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 15,
      color: Colors.black
  );
}
