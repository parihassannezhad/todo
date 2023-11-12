import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'member_item.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {
    final TextEditingController controller=TextEditingController();
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Stack(
                        children: [
                          SizedBox(
                            height: 290,
                            child: Column(
                              children: [
                                 const Padding(
                                    padding: EdgeInsets.only(
                                        right: 4, left: 4, top: 20, bottom: 1),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          MembersItem(
                                            title: 'Ali Imani',
                                            imagePath: 'assets/img/1.png',
                                            selected: true,
                                          ),
                                          MembersItem(
                                            title: 'Sara Radi',
                                            imagePath: 'assets/img/3.png',
                                            selected: false,
                                          ),
                                          MembersItem(
                                            title: 'Reza Ahmadi',
                                            imagePath: 'assets/img/2.png',
                                            selected: false,
                                          ),
                                          MembersItem(
                                            title: 'Raha Hasani',
                                            imagePath: 'assets/img/4.png',
                                            selected: false,
                                          ),
                                          MembersItem(
                                            title: 'Mona Rezaei',
                                            imagePath: 'assets/img/5.png',
                                            selected: false,
                                          ),
                                          MembersItem(
                                            title: 'Kian Davoodi',
                                            imagePath: 'assets/img/6.png',
                                            selected: false,
                                          ),
                                          MembersItem(
                                            title: 'Negin Razi',
                                            imagePath: 'assets/img/7.png',
                                            selected: false,
                                          ),
                                          MembersItem(
                                            title: 'Sahar Najjar',
                                            imagePath: 'assets/img/8.png',
                                            selected: false,
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
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                color: Colors.green,
                                              )),
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
                                      Navigator.of(context).pop();
                                    }),
                              ),
                            ),
                          )
                        ],
                      );
                    });;
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
                        const Row(
                          children: [
                            Text(
                              'Ali Imani',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              CupertinoIcons.arrow_down,
                              color: Colors.blue,
                              size: 18,
                            )
                          ],
                        ),
                        Container(
                          width: 80,
                          height: 35,
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
                                      'Delete',
                                      style: TextStyle(color: Colors.white,fontSize: 12),
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
                                  Navigator.of(context).pop();
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(controller.text),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}