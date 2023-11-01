class taskType {
  String title;
  String image;
  Enum taskTypeEnum;

  taskType({
    required this.title,
    required this.image,
    required this.taskTypeEnum,
  });
}

enum taskTypeEnum {
  hubby,
  working,
  fouce;
}
