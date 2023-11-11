import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/seconPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MySecondPage()));
          },
          label: const Row(
            children: [
              Text(
                'Add New Task',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                CupertinoIcons.add,
                color: Colors.black,
              )
            ],
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
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
                    MaterialButton(
                        color: const Color(0xffEAEFF5),
                        textColor: Colors.black,
                        elevation: 0,
                        child: const Row(
                          children: [
                            Text('Delete'),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              CupertinoIcons.delete_solid,
                              size: 18,
                            ),
                          ],
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 10,
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(),
                        child: MaterialButton(

                          color: Colors.blue.shade300,
                          textColor: Colors.black,
                          elevation: 0,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: const BoxDecoration(

                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                        )),
                                    height: 220,
                                    width: double.infinity,
                                  );
                                });
                          },
                          child: Text(
                            'ویرایش',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12,color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}

class MembersItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool selected;

  const MembersItem({
    super.key,
    required this.imagePath,
    required this.selected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.only(right: 11, left: 11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                gradient:
                    const LinearGradient(begin: Alignment.topLeft, colors: [
                  Color(0xff376AED),
                  Color(0xff49B0E2),
                  Color(0xff9CECFB),
                ]),
              ),
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  imagePath,
                ),
              ),
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ))
      ],
    );
  }
}
