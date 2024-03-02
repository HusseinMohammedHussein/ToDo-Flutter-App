import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/features/home/presentation/widgets/custom_task_card.dart';

import '../../data/models/home_model.dart';

class TasksList extends StatefulWidget {
  final List<HomeModel> models;

  const TasksList({super.key, required this.models});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    log("get_items_list:::: ${widget.models.length}");
    return ListView.builder(
        reverse: false,
        itemCount: widget.models.length,
        itemBuilder: (context, index) => TaskCard(
              model: widget.models[index],
            ));
  }
}
