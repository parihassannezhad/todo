import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'check_box.dart';
import 'data.dart';
import 'homePage.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          widget.task.isCompeleted=!widget.task.isCompeleted;
        });
      },
      child: Container(
        width: 270,
        height: 60,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row
                (children: [MyChechBox(value:widget.task.isCompeleted),
                const SizedBox(width: 8,),
                Text(widget.task.name),],),

              IconButton(
                  onPressed: () {
                    widget.task.delete();
                  },
                  icon: const Icon(
                    Icons.clear,
                    size: 16,
                    color: Colors.blue,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}