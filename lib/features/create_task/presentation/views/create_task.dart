import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_app/core/functions/custom_toast.dart';
import 'package:todo_app/core/functions/navigation.dart';
import 'package:todo_app/core/functions/date_service.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/widgets/custom_btn.dart';
import 'package:todo_app/features/create_task/presentation/cubit/task_cubit.dart';
import 'package:todo_app/features/create_task/presentation/cubit/task_state.dart';

import '../../../../core/utils/app_assets.dart';

class CreateTask extends StatefulWidget {
  final Size? size;

  const CreateTask({super.key, this.size});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TaskCubit? taskCubit;
  DateTime currentDateTime = DateTime.now();
  DateTime? datePicked;
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDate = TextEditingController();

  Widget _addTaskForm(BuildContext context) {
    return Form(
        key: taskCubit?.addTaskFormKey,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: AppColors.grey,
                  filled: true,
                  hintText: AppStrings.taskTitleHint,
                  hintStyle: const TextStyle(color: Colors.black26),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
              style: const TextStyle(fontSize: 18),
              controller: taskTitle,
            ),
            20.height,
            TextField(
              readOnly: true,
              onTap: () async {
                datePicked = await selectDate(context, currentDateTime);
                if (datePicked != null && datePicked != currentDateTime) {
                  setState(() {
                    String formattedDate = parseDate(datePicked!);
                    taskDate.text = formattedDate;
                  });
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: AppColors.grey,
                  filled: true,
                  hintText: AppStrings.dateHint,
                  hintStyle: const TextStyle(color: Colors.black26),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
              style: const TextStyle(fontSize: 18),
              controller: taskDate,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskStat>(listener: (context, state) {
      if (state is TaskSuccessState) {
        customReplacementNavigate(context, '/home');
      } else if (state is TaskFailureState) {
        showToast(state.errMessage);
      }
    }, builder: (context, state) {
      taskCubit = BlocProvider.of<TaskCubit>(context);
      return SizedBox(
        height: widget.size!.height * 0.5,
        child: Card(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  10.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(Assets.imagesIcCancel,
                            width: 30, height: 30)
                        .onTap(() {
                      finish(context);
                    }),
                  ),
                  20.height,
                  const Text(
                    AppStrings.createNewTask,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  30.height,
                  _addTaskForm(context),
                  30.height,
                  CustomBtn(
                    text: AppStrings.saveTask,
                    onPressed: () async {
                      if (taskCubit!.addTaskFormKey.currentState!.validate()) {
                        taskCubit?.taskTitle = taskTitle.text;
                        taskCubit?.timeStamp = currentDateTime;
                        taskCubit?.taskDate = datePicked;
                        await taskCubit?.createNewTask();
                      }
                    },
                  )
                ],
              )),
        ),
      );
    });
  }
}
