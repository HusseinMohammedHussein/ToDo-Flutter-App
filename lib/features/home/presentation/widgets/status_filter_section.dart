import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StatusFilter extends StatefulWidget {
  const StatusFilter({super.key});

  @override
  State<StatusFilter> createState() => _StatusFilterState();
}

class _StatusFilterState extends State<StatusFilter> {
  List<Status> status = Status.values;
  int selectedItemIndex = 0;

  Widget _statusItem(String status, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: selectedItemIndex == index ? Colors.green : Colors.green[100],
      ),
      child: Text(
        status,
        style: TextStyle(
            fontSize: 18, color: selectedItemIndex == index ? Colors.white : Colors.green),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: status.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedItemIndex = index;
              });
            },
            child: Row(
              children: [
                _statusItem(status[index].name, index),
                10.width
              ],
            )),
      ),
    );
  }
}

enum Status {
  All,
  NOT_DONE,
  Done,
}

extension StatusExtension on Status {
  String get name {
    switch(this){
      case Status.NOT_DONE:
        return "Not Done";
      case Status.All:
        return "All";
      case Status.Done:
        return "Done";
    }
  }
}