import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/home/data/models/home_model.dart';
import 'package:todo_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HomeModel> tasksList = [];

  fetchTasks() async {
    try {
      emit(HomeLoadingState());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.tasks)
          .orderBy(AppStrings.taskTimeStamp, descending: true)
          .get()
          .then((value) => value.docs.forEach((element) async {
                tasksList.add(HomeModel.fromJson(element.data()));
              }));
      emit(HomeSuccessState());
    } on Exception catch (e) {
      emit(HomeFailureState(errMessage: e.toString()));
    }
  }
}
