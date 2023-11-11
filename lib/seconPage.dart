import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class MySecondPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  MySecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          FloatingActionButton.extended(onPressed: () {}, label: const Row(
            children: [
              Text('Save',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              SizedBox(width: 1,),
              Icon(CupertinoIcons.check_mark,size: 18,)
            ],
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 12, 0, 12),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(CupertinoIcons.arrow_left)),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Edite Task',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 120,
            child: Padding(
                padding:
                    EdgeInsets.only(left: 36, right: 22, top: 18, bottom: 12),
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
                        selected: true,
                      ),
                      MembersItem(
                        title: 'Reza Ahmadi',
                        imagePath: 'assets/img/2.png',
                        selected: true,
                      ),
                      MembersItem(
                        title: 'Raha Hasani',
                        imagePath: 'assets/img/4.png',
                        selected: true,
                      ),
                      MembersItem(
                        title: 'Mona Rezaei',
                        imagePath: 'assets/img/5.png',
                        selected: true,
                      ),
                      MembersItem(
                        title: 'Kian Davoodi',
                        imagePath: 'assets/img/6.png',
                        selected: true,
                      ),
                      MembersItem(
                        title: 'Negin Razi',
                        imagePath: 'assets/img/7.png',
                        selected: true,
                      ),
                      MembersItem(
                        title: 'Sahar Najjar',
                        imagePath: 'assets/img/8.png',
                        selected: true,
                      ),
                    ],
                  ),
                )),

          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 30,
              left: 30,
            ),
            child: Container(
              width: 340,
              height: 2,
              decoration: BoxDecoration(color: Colors.blue.shade200),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  label: Text('Add a new task for today...')),
            ),
          ),


        ],
      ),
    ));
  }
}
