import 'package:hive_flutter/hive_flutter.dart';
part 'mobile.g.dart';

@HiveType(typeId: 3)
class Mobile {
  Mobile(
      {required this.nameMobile,
      required this.brand,
      required this.storage,
      required this.ram});

  @HiveField(0)
  String nameMobile;

  @HiveField(1)
  String brand;

  @HiveField(2)
  int ram;

  @HiveField(3)
  int storage;
}
