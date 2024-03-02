import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_app/core/functions/date_service.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_text_styles.dart';
import 'package:todo_app/features/home/data/models/home_model.dart';

class TaskCard extends StatefulWidget {
  final bool? isTaskDone;
  final HomeModel model;

  const TaskCard({super.key, this.isTaskDone = false, required this.model});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    log("getTitle::: ${widget.model.taskTitle}");
    log("getDate::: ${widget.model.taskDate}");
    var date = parseDate(widget.model.taskDate!);
    var currentDate = DateTime.now();
    var isDone = currentDate.isAfter(widget.model.taskDate!);
    return Card(
        margin: const EdgeInsets.only(bottom: 15),
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.taskTitle.toString(),
                    style: CustomTextStyles.style18,
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        "${AppStrings.dateFieldTitle}$date",
                        style: CustomTextStyles.style15,
                      ),
                    ],
                  ),
                ],
              ),
              isDone
                  ? Image.asset(
                      Assets.imagesIcDone,
                      height: 30,
                      width: 30,
                    )
                  : const Offstage()
            ],
          ),
        ));
  }
}
