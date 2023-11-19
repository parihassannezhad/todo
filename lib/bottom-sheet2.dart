import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/main.dart';

import 'data.dart';
import 'member_item.dart';

class BottomSheet2 extends StatefulWidget {
  @override
  State<BottomSheet2> createState() => _BottomSheet2State();
}

class _BottomSheet2State extends State<BottomSheet2> {

  var index = 0;

  void updateselectedItems(int value) {
    setState(() {
      //selectedUser = user;
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Task>(TaskBoxName);

    TextEditingController controller = TextEditingController();

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Stack(
        children: [
          SizedBox(
            height: 290,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        right: 4, left: 4, top: 20, bottom: 1),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          MembersItem(
                            user: User(
                              'Ali Imani',
                              'assets/img/1.png',
                            ),
                            selected: index == 0,
                            onTapContainer: () {
                              updateselectedItems(0);
                            },
                          ),
                          MembersItem(
                            user: User(
                              'Sara Radi',
                              'assets/img/3.png',
                            ),
                            selected: index == 1,
                            onTapContainer: () {
                              updateselectedItems(1);
                            },
                          ),
                          MembersItem(
                            user: User(
                              'Reza Ahmadi',
                              'assets/img/2.png',
                            ),
                            selected: index == 2,
                            onTapContainer: () {
                              updateselectedItems(2);
                            },
                          ),
                          MembersItem(
                            user: User(
                              'Raha Hasani',
                              'assets/img/4.png',
                            ),
                            selected: index == 3,
                            onTapContainer: () {
                              updateselectedItems(3);
                            },
                          ),
                          MembersItem(
                            user: User(
                              'Mona Rezaei',
                              'assets/img/5.png',
                            ),
                            selected: index == 4,
                            onTapContainer: () {
                              updateselectedItems(4);
                            },
                          ),
                          MembersItem(
                            user: User(
                              'Kian Davoodi',
                              'assets/img/6.png',
                            ),
                            selected: index == 5,
                            onTapContainer: () {
                              updateselectedItems(5);
                            },
                          ),
                          MembersItem(
                            user: User(
                              'Negin Razi',
                              'assets/img/7.png',
                            ),
                            selected: index == 6,
                            onTapContainer: () {
                              updateselectedItems(6);
                            },
                          ),
                          MembersItem(
                            user: User(
                              'Sahar Najjar',
                              'assets/img/8.png',
                            ),
                            selected: index == 7,
                            onTapContainer: () {
                              updateselectedItems(7);
                            },
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40, top: 40, right: 40, bottom: 40),
                  child: Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            CupertinoIcons.pencil_ellipsis_rectangle,
                            size: 18,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide()),
                          label: const Text(
                            'Add a new task...',
                            style: TextStyle(fontSize: 12),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            right: 157,
            child: Container(
              width: 85,
              height: 40,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Colors.blue.shade400,
                      Colors.blue.shade300,
                      Colors.lightBlueAccent.shade100
                    ])),
                child: MaterialButton(
                    textColor: Colors.black,
                    elevation: 0,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Icon(
                          CupertinoIcons.check_mark,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    onPressed: () {
                      final task = Task();
                      task.name = controller.text;
                      task.periority = Periority.low;
                      task.user=userList[index];

                      if (task.isInBox) {
                        task.save();
                      } else {
                        final Box<Task> box = Hive.box(TaskBoxName);
                        box.add(task);
                      }

                      Navigator.of(context).pop();
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
