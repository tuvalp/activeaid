import 'package:activeaid/screens/profile_screen/acount.dart';
import 'package:activeaid/screens/profile_screen/age.dart';
import 'package:activeaid/screens/profile_screen/gender.dart';
import 'package:activeaid/screens/profile_screen/heigt.dart';
import 'package:activeaid/screens/profile_screen/weight.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _editIndex = 0;

  void _setEditIndex(int index) {
    setState(() {
      _editIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Center(
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Tuval Peled",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 8),
            Text(
              "tuvalpeled@gmail.com",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
            const SizedBox(height: 24),
            const Acount(),
            const SizedBox(height: 16),
            Gender(isOpen: _editIndex == 1, setOpen: _setEditIndex),
            const SizedBox(height: 16),
            Age(isOpen: _editIndex == 2, setOpen: _setEditIndex),
            const SizedBox(height: 16),
            Heigt(isOpen: _editIndex == 3, setOpen: _setEditIndex),
            const SizedBox(height: 16),
            Weight(isOpen: _editIndex == 4, setOpen: _setEditIndex),
          ],
        ),
      ),
    );
  }
}
