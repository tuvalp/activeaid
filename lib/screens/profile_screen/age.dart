import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Age extends StatefulWidget {
  const Age({
    required this.isOpen,
    required this.setOpen,
    Key? key,
  }) : super(key: key);

  final bool isOpen;
  final void Function(int) setOpen;

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
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
  void didUpdateWidget(Age oldWidget) {
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
                  SizedBox(
                    width: 52,
                    height: 52,
                    child: Center(
                      child: Icon(Icons.cake_rounded,
                          size: 28,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "20",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  widget.setOpen(2);
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
                SizedBox(
                  height: 120,
                  child: CupertinoPicker(
                    itemExtent: 32,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    scrollController:
                        FixedExtentScrollController(initialItem: 18),
                    onSelectedItemChanged: (value) => (print(value)),
                    children: [
                      for (var i = 0; i <= 100; i++)
                        Text(
                          i.toString(),
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.setOpen(0);
                  },
                  child: const Text("Save", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
