import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/main.dart';

import 'Task_Item.dart';
import 'bottom-sheet2.dart';
import 'data.dart';
import 'empty_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Task>(TaskBoxName);

    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return BottomSheet2();
                    },
                  );
                });
          },
          label: const Row(
            children: [
              Text(
                'Add New Task',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                CupertinoIcons.add,
                color: Colors.white,
              )
            ],
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 1, 32, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'To Do List',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Image.asset('assets/img/letter.png')
              ],
            ),
          ),
          Container(
            height: 40,
            width: 360,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade200,
                  Colors.blue.shade100
                ]),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                  label: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Search Task ...',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Members Task',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: 110,
                              height: 1,
                              color: Colors.blue.shade200,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                    Container(
                      width: 80,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
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
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Icon(
                                  CupertinoIcons.delete_solid,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            onPressed: () {
                              box.clear();
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (BuildContext context, value, Widget? child) {
              if (box.isNotEmpty) {
                return ListView.builder(
                    itemCount: value.values.length,
                    itemBuilder: (context, index) {
                      final Task task = value.values.toList()[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: TaskItem(task: task),
                      );
                    });
              } else {
                return EmpteState();
              }
            },
          ))
        ],
      ),
    ));
  }
}


