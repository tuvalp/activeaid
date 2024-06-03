import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 3)
class Exercise {
  @HiveField(0)
  String name;

  @HiveField(1)
  int duration;

  @HiveField(2)
  double metValue;

  @HiveField(3)
  String soundPath;

  @HiveField(4)
  String image;

  @HiveField(5)
  String? secondaryImage;

  Exercise({
    required this.name,
    required this.duration,
    required this.metValue,
    required this.soundPath,
    required this.image,
    this.secondaryImage,
  });
}
