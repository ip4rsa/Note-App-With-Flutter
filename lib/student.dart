import 'package:hive_flutter/hive_flutter.dart';
part 'student.g.dart';

@HiveType(typeId: 2)
class Student {
  Student(
      {required this.name,
      required this.famly,
      required this.age,
      required this.grade});

  @HiveField(0)
  String name;

  @HiveField(1)
  String famly;

  @HiveField(2)
  int age;

  @HiveField(3)
  int grade;
}
