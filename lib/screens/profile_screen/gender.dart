import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({required this.isOpen, required this.setOpen, super.key});

  final bool isOpen;
  final void Function(int) setOpen;

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(Gender oldWidget) {
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

  String gender = "Male";

  void setGender(String gender) {
    setState(() {
      this.gender = gender;
      widget.setOpen(0);
    });
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
                      child: Icon(Icons.male,
                          size: 28,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "Male",
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
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            width: double.infinity,
            child: Column(children: [
              GestureDetector(
                onTap: () => setGender("Male"),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                width: 2,
                              ),
                            ),
                            child: gender == "Male"
                                ? Center(
                                    child: Container(
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                  )
                                : Container(),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          ),
                        ],
                      ),
                      Icon(Icons.male,
                          size: 32,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => setGender("Female"),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                width: 2,
                              ),
                            ),
                            child: gender == "Female"
                                ? Center(
                                    child: Container(
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                  )
                                : Container(),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          ),
                        ],
                      ),
                      Icon(Icons.female,
                          size: 32,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => setGender("Other"),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                width: 2,
                              ),
                            ),
                            child: gender == "Other"
                                ? Center(
                                    child: Container(
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                  )
                                : Container(),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            "Other",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          ),
                        ],
                      ),
                      Icon(Icons.transgender,
                          size: 32,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
