import 'package:activeaid/models/profile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileUtils {
  final profileBox = Hive.box<Profile>("profileBox");
  void newProfile() {
    if (profileBox.isEmpty) {
      profileBox.add(Profile(
          name: "", email: "", gender: "", age: 1, height: 1, weight: 1));
    }
  }

  void updateAuth(name, email) {
    if (name != null && email != null) {
      Profile newProfile = Profile(
          name: name,
          email: email,
          gender: profileBox.getAt(0)!.gender,
          age: profileBox.getAt(0)!.age,
          height: profileBox.getAt(0)!.height,
          weight: profileBox.getAt(0)!.weight);

      profileBox.putAt(0, newProfile);
    }
  }

  void updateGender(gender) {
    if (gender != null) {
      Profile newProfile = Profile(
        name: profileBox.getAt(0)!.name,
        email: profileBox.getAt(0)!.email,
        gender: gender,
        age: profileBox.getAt(0)!.age,
        height: profileBox.getAt(0)!.height,
        weight: profileBox.getAt(0)!.weight,
      );

      profileBox.putAt(0, newProfile);
    }
  }

  void updateAge(age) {
    if (age != null) {
      Profile newProfile = Profile(
        name: profileBox.getAt(0)!.name,
        email: profileBox.getAt(0)!.email,
        gender: profileBox.getAt(0)!.gender,
        age: age,
        height: profileBox.getAt(0)!.height,
        weight: profileBox.getAt(0)!.weight,
      );

      profileBox.putAt(0, newProfile);
    }
  }

  void updateHeight(height) {
    if (height != null) {
      Profile newProfile = Profile(
        name: profileBox.getAt(0)!.name,
        email: profileBox.getAt(0)!.email,
        gender: profileBox.getAt(0)!.gender,
        age: profileBox.getAt(0)!.age,
        height: height,
        weight: profileBox.getAt(0)!.weight,
      );

      profileBox.putAt(0, newProfile);
    }
  }

  void updateWeight(weight) {
    if (weight != null) {
      Profile newProfile = Profile(
        name: profileBox.getAt(0)!.name,
        email: profileBox.getAt(0)!.email,
        gender: profileBox.getAt(0)!.gender,
        age: profileBox.getAt(0)!.age,
        height: profileBox.getAt(0)!.height,
        weight: weight,
      );

      profileBox.putAt(0, newProfile);
    }
  }
}
