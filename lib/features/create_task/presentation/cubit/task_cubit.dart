import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/create_task/presentation/cubit/task_state.dart';

class TaskCubit extends Cubit<TaskStat> {
  TaskCubit() : super(TaskInitial());

  String? taskTitle;
  DateTime? taskDate;
  DateTime? timeStamp;
  GlobalKey<FormState> addTaskFormKey = GlobalKey();

  Future<void> createNewTask() async {
    try {
      CollectionReference addTask =
          FirebaseFirestore.instance.collection(FireBaseStrings.tasks);
      emit(TaskLoadingState());
      addTask.add({
        AppStrings.taskTitle: taskTitle,
        AppStrings.taskDate: taskDate,
        AppStrings.taskTimeStamp: timeStamp
      });
      emit(TaskSuccessState());
    } catch (e) {
      emit(TaskFailureState(errMessage: e.toString()));
    }
  }
}
