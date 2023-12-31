import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/data/task_taype_model.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class taskModel extends HiveObject {
  taskModel({
    required this.title,
    required this.subTitle,
    this.isDone = false,
    required this.time,
    required this.taskType,
    required this.opacity,
    required this.userName,
  });

  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  bool isDone;

  @HiveField(3)
  DateTime time;

  @HiveField(4)
  TaskType taskType;

  @HiveField(5)
  double opacity;

  @HiveField(6)
  String userName;
}
