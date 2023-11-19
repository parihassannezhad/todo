import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/main.dart';

import 'data.dart';

Future<void> seederUser(List<User> users) async{
  var box =  Hive.box<User>(UserBoxName);
  if(box.isEmpty){
    box.addAll(users);
  }


}