import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class HomeModel {
  String? taskTitle;
  DateTime? taskDate;
  DateTime? timeStamp;

  HomeModel({this.taskTitle, this.taskDate, this.timeStamp});

  factory HomeModel.fromJson(json){
    return HomeModel(
      taskTitle: json[AppStrings.taskTitle],
      taskDate:  (json[AppStrings.taskDate] as Timestamp).toDate(),
      timeStamp: (json[AppStrings.taskTimeStamp] as Timestamp).toDate(),
    );
  }
}