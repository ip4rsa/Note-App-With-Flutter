import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class taskModel {
  taskModel({required this.title, required this.subTitle});

  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;
}
