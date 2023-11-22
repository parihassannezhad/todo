import 'package:flutter/material.dart';



import 'data.dart';


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
      onTap: () {
        setState(() {
          if (widget.task.isCompeleted == null) {
            widget.task.isCompeleted = false;
          } else {
            widget.task.isCompeleted = !widget.task.isCompeleted!;
          }
        });
      },
      child: Container(
        width: 270,
        height: 60,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 10)
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
              Row(
                children: [

                  Image.asset(
                    widget.task.user!.imagePath,
                    width: 45,
                    height: 45,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ScreenSubject(task: widget.task)));
                      },
                      child: Text(widget.task.user!.title,style: const TextStyle(fontSize:14),)),
                ],
              ),
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

class ScreenSubject extends StatefulWidget {
  const ScreenSubject({super.key, required this.task});

  final Task task;


  @override
  State<ScreenSubject> createState() => _ScreenSubjectState();
}

class _ScreenSubjectState extends State<ScreenSubject> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), blurRadius: 20)
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.blue.shade400,
                    Colors.blue.shade300,
                    Colors.lightBlueAccent.shade100
                  ])),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      )),
                  Image.asset(
                    widget.task.user!.imagePath,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.task.user!.title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3), blurRadius: 20)
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,top: 30),
                  child: Text(widget.task.name!,style: const TextStyle(fontSize: 17,),),
                ),


              ),
            )
          ],
        ),
      ),
    );
  }
}
