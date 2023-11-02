import 'package:note_app/model/taskType_Enum.dart';
import 'package:note_app/model/task_taype_model.dart';

List<TaskType> taskDataType = [
  TaskType(
    title: 'تفریح',
    image: 'assets/images/social_frends.png',
    taskTypeEnum: taskTypeEnum.hubby,
  ),
  TaskType(
    title: 'کار',
    image: 'assets/images/working.png',
    taskTypeEnum: taskTypeEnum.working,
  ),
  TaskType(
      title: 'تمرکز',
      image: 'assets/images/meditate.png',
      taskTypeEnum: taskTypeEnum.fouce),
];
