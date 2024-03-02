import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_app/core/functions/custom_toast.dart';
import 'package:todo_app/core/functions/date_service.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/widgets/custom_btn.dart';
import 'package:todo_app/core/widgets/custom_header_text.dart';
import 'package:todo_app/features/create_task/presentation/views/create_task.dart';
import 'package:todo_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:todo_app/features/home/presentation/cubit/home_state.dart';
import 'package:todo_app/features/home/presentation/widgets/tasks_list_section.dart';
import 'package:todo_app/features/home/presentation/widgets/status_filter_section.dart';

import '../../../create_task/presentation/cubit/task_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Size size;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String welcomeMessage = getWelcomeMessageBasedOnTime();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
      if (state is HomeFailureState) {
        showToast(state.errMessage);
      }
    }, builder: (context, state) {
      return Scaffold(
        key: scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                10.width,
                CustomHeaderText(text: welcomeMessage),
                20.height,
                const StatusFilter(),
                20.height,
                SizedBox(
                  height: size.height * 0.7,
                  child: state is HomeLoadingState
                      ? CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ).center()
                      : TasksList(models: context.read<HomeCubit>().tasksList),
                ),
                20.height,
                CustomBtn(
                  text: AppStrings.createTask,
                  onPressed: () {
                    scaffoldKey.currentState?.showBottomSheet(
                      elevation: 5.0,
                        (c) => BlocProvider(
                            create: (context) => TaskCubit()..addTaskFormKey,
                            child: CreateTask(size: size)),
                        enableDrag: false);
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
