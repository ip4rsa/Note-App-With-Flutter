import 'package:hive/hive.dart';
part 'taskType_Enum.g.dart';

@HiveType(typeId: 3)
enum taskTypeEnum {
  @HiveField(0)
  hubby,

  @HiveField(1)
  working,

  @HiveField(2)
  fouce;
}
