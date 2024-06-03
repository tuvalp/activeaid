import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Acount extends StatefulWidget {
  const Acount({super.key});

  @override
  State<Acount> createState() => _AcountState();
}

class _AcountState extends State<Acount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(Ionicons.logo_google,
                      size: 28,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Tuval Peled",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.edit,
                size: 18, color: Theme.of(context).colorScheme.onSecondary),
          ),
        ],
      ),
    );
  }
}
