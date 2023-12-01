import 'package:note_app/data/taskType_Enum.dart';
import 'package:note_app/data/task_taype_model.dart';

List<TaskType> taskDataType = [
  TaskType(
    title: 'کار',
    image: 'assets/images/wirking.png',
    taskTypeEnum: taskTypeEnum.working,
  ),
  TaskType(
      title: 'استراحت',
      image: 'assets/images/cheel.png',
      taskTypeEnum: taskTypeEnum.fouce),
  TaskType(
    title: 'تفریح',
    image: 'assets/images/hubby.png',
    taskTypeEnum: taskTypeEnum.hubby,
  ),
  TaskType(
    title: 'ورزش',
    image: 'assets/images/gym.png',
    taskTypeEnum: taskTypeEnum.hubby,
  ),
  TaskType(
      title: 'مطالعه',
      image: 'assets/images/book.png',
      taskTypeEnum: taskTypeEnum.fouce),
  TaskType(
      title: 'خرید',
      image: 'assets/images/order.png',
      taskTypeEnum: taskTypeEnum.fouce),
  TaskType(
      title: 'خواب',
      image: 'assets/images/Sleep.png',
      taskTypeEnum: taskTypeEnum.fouce),
  TaskType(
      title: 'درس',
      image: 'assets/images/School.png',
      taskTypeEnum: taskTypeEnum.fouce),
  TaskType(
      title: 'تمرین',
      image: 'assets/images/ronio-vector-svg-1024-Playing Music-min.png',
      taskTypeEnum: taskTypeEnum.fouce),
  TaskType(
      title: 'تمیزکاری',
      image: 'assets/images/CLR.png',
      taskTypeEnum: taskTypeEnum.fouce),
  TaskType(
      title: 'نوشیدن آب',
      image: 'assets/images/water.png',
      taskTypeEnum: taskTypeEnum.fouce),
];
