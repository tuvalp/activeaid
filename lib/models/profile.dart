import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 4)
class Profile {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String gender;

  @HiveField(3)
  int age;

  @HiveField(4)
  int height;

  @HiveField(5)
  int weight;

  Profile({
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
  });
}
