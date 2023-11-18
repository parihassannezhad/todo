import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/main.dart';

import 'data.dart';
import 'homePage.dart';
import 'member_item.dart';

class BottomSheet2 extends StatefulWidget {
  @override
  State<BottomSheet2> createState() => _BottomSheet2State();
}

class _BottomSheet2State extends State<BottomSheet2> {
  MembersName membersItem = MembersName.Imani;

  void updateselectedItems(MembersName membersName) {
    setState(() {
      membersItem = membersName;
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
                            title: 'Ali Imani',
                            imagePath: 'assets/img/1.png',
                            selected: membersItem == MembersName.Imani,
                            name: MembersName.Imani,
                            onTapContainer: () {
                              updateselectedItems(MembersName.Imani);
                            },
                          ),
                          MembersItem(
                            title: 'Sara Radi',
                            imagePath: 'assets/img/3.png',
                            selected: membersItem == MembersName.Radi,
                            name: MembersName.Radi,
                            onTapContainer: () {
                              updateselectedItems(MembersName.Radi);
                            },
                          ),
                          MembersItem(
                            title: 'Reza Ahmadi',
                            imagePath: 'assets/img/2.png',
                            selected: membersItem == MembersName.Ahmadi,
                            name: MembersName.Ahmadi,
                            onTapContainer: () {
                              updateselectedItems(MembersName.Ahmadi);
                            },
                          ),
                          MembersItem(
                            title: 'Raha Hasani',
                            imagePath: 'assets/img/4.png',
                            selected: membersItem == MembersName.Hasani,
                            name: MembersName.Hasani,
                            onTapContainer: () {
                              updateselectedItems(MembersName.Hasani);
                            },
                          ),
                          MembersItem(
                            title: 'Mona Rezaei',
                            imagePath: 'assets/img/5.png',
                            selected: membersItem == MembersName.Rezaei,
                            name: MembersName.Rezaei,
                            onTapContainer: () {
                              updateselectedItems(MembersName.Rezaei);
                            },
                          ),
                          MembersItem(
                            title: 'Kian Davoodi',
                            imagePath: 'assets/img/6.png',
                            selected: membersItem == MembersName.Davoodi,
                            name: MembersName.Davoodi,
                            onTapContainer: () {
                              updateselectedItems(MembersName.Davoodi);
                            },
                          ),
                          MembersItem(
                            title: 'Negin Razi',
                            imagePath: 'assets/img/7.png',
                            selected: membersItem == MembersName.Razi,
                            name: MembersName.Razi,
                            onTapContainer: () {
                              updateselectedItems(MembersName.Razi);
                            },
                          ),
                          MembersItem(
                            title: 'Sahar Najjar',
                            imagePath: 'assets/img/8.png',
                            selected: membersItem == MembersName.Najafi,
                            name: MembersName.Najafi,
                            onTapContainer: () {
                              updateselectedItems(MembersName.Najafi);
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
                      if (task.isInBox) {
                        task.save();
                      }else{
                        final Box<Task> box=Hive.box(TaskBoxName);
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
