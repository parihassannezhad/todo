

import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String? name ;

  @HiveField(1)
  bool? isCompeleted = false;

  @HiveField(2)
  Periority? periority;

  @HiveField(3)
  User? user;

}

@HiveType(typeId: 1)
enum Periority {
  @HiveField(0)
  low,
  @HiveField(1)
  normal,
  @HiveField(2)
  high
}


@HiveType(typeId: 2)
class User extends HiveObject{
  @HiveField(0)
  String title = '';

  @HiveField(1)
  String imagePath = '';

  User(this.title, this.imagePath);
}

var userList= [
    User(
      'Ali Imani',
      'assets/img/1.png',
      

    ),
    User(
      'Sara Radi',
      'assets/img/3.png',
   
    ),
    User(
      'Reza Ahmadi',
      'assets/img/2.png',
   
    ),
    User(
      'Raha Hasani',
      'assets/img/4.png',
     
    ),
    User(
      'Mona Rezaei',
      'assets/img/5.png',
    
    ),
    User(
      'Kian Davoodi',
      'assets/img/6.png',
    
    ),
    User(
      'Negin Razi',
      'assets/img/7.png',
   
    ),
    User(
      'Sahar Najjar',
      'assets/img/8.png',
    
    ),
  ];






