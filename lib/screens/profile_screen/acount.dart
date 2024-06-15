import 'package:activeaid/utils/profile_utils.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Acount extends StatefulWidget {
  const Acount({
    required this.isOpen,
    required this.setOpen,
    Key? key,
  }) : super(key: key);

  final bool isOpen;
  final void Function(int) setOpen;
  @override
  State<Acount> createState() => _AcountState();
}

class _AcountState extends State<Acount> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = ProfileUtils().profileBox.getAt(0)!.name;
    emailController.text = ProfileUtils().profileBox.getAt(0)!.email;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(Acount oldWidget) {
    nameController.text = ProfileUtils().profileBox.getAt(0)!.name;
    emailController.text = ProfileUtils().profileBox.getAt(0)!.email;

    super.didUpdateWidget(oldWidget);
    if (oldWidget.isOpen != widget.isOpen) {
      if (widget.isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: widget.isOpen
                ? const BorderRadius.vertical(top: Radius.circular(16))
                : BorderRadius.circular(16),
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
                    ProfileUtils().profileBox.getAt(0)!.name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.setOpen(1);
                  });
                },
                icon: Icon(Icons.edit,
                    size: 18, color: Theme.of(context).colorScheme.onSecondary),
              ),
            ],
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: -1,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Full Name",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        ProfileUtils().updateAuth(
                            nameController.text, emailController.text);
                        widget.setOpen(0);
                      },
                      child: const Text("Save", style: TextStyle(fontSize: 16)),
                    ),
                    TextButton(
                      onPressed: () {
                        widget.setOpen(0);
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
