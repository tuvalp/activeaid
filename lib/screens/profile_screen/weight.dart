import 'package:activeaid/utils/profile_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  const Weight({
    required this.isOpen,
    required this.setOpen,
    Key? key,
  }) : super(key: key);

  final bool isOpen;
  final void Function(int) setOpen;

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int weight = ProfileUtils().profileBox.getAt(0)!.weight;

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
  void didUpdateWidget(Weight oldWidget) {
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
                      child: Icon(Icons.scale,
                          size: 28,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Text(
                        ProfileUtils().profileBox.getAt(0)!.weight.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "(kg)",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  widget.setOpen(5);
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
                        FixedExtentScrollController(initialItem: 50),
                    onSelectedItemChanged: (value) {
                      setState(() {
                        weight = 30 + value;
                      });
                    },
                    children: [
                      for (var i = 30; i <= 200; i++)
                        Text(
                          i.toString(),
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        ProfileUtils().updateWeight(weight);
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
