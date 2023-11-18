import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String name = '';
  @HiveField(1)
  bool isCompeleted = false
  ;
  @HiveField(2)
  Periority periority = Periority.low;

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