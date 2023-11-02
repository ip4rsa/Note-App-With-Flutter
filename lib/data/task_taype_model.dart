import 'package:hive/hive.dart';

part 'task_taype_model.g.dart';

@HiveType(typeId: 2)
class TaskType {
  @HiveField(0)
  String title;

  @HiveField(1)
  String image;

  @HiveField(2)
  Enum taskTypeEnum;

  TaskType({
    required this.title,
    required this.image,
    required this.taskTypeEnum,
  });
}
