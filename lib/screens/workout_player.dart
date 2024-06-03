import 'dart:async';
import 'package:activeaid/models/workout_history.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:activeaid/widgets/exercise_app_bar.dart';
import 'package:activeaid/widgets/primary_button.dart';
import 'package:activeaid/widgets/secondary_button.dart';
import 'package:activeaid/widgets/workout_completed.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/workout_plan.dart';

class WorkoutPlayer extends StatefulWidget {
  final WorkoutPlan plan;
  final WorkoutHistory? history;

  const WorkoutPlayer({required this.plan, this.history, Key? key})
      : super(key: key);

  @override
  WorkoutPlayerState createState() => WorkoutPlayerState();
}

class WorkoutPlayerState extends State<WorkoutPlayer> {
  late Timer _exerciseTimer;
  late int _currentExerciseIndex;
  late int _currentRepetition;
  late int _secondsRemaining;
  late bool _isResting;
  late bool _isCountingDown;
  late bool _isCompleted;
  late bool _isPaused;
  late String _displayImage;
  late WorkoutHistory _workoutHistory;
  final historyBox = Hive.box<WorkoutHistory>('historyBox');

  @override
  void initState() {
    super.initState();
    _initializeSession();
  }

  void _initializeSession() {
    _currentExerciseIndex = 0;
    _currentRepetition = 0;
    _isResting = false;
    _isCountingDown = true;
    _isCompleted = false;
    _isPaused = false;
    _displayImage = widget.plan.exercises[_currentExerciseIndex].image;

    if (widget.history != null) {
      _workoutHistory = widget.history!;
      _currentExerciseIndex = _workoutHistory.exesrciseIndex;
      _currentRepetition = _workoutHistory.repetitions;
      _workoutHistory.date = DateTime.now();
    } else {
      _workoutHistory = WorkoutHistory(
        date: DateTime.now(),
        plan: widget.plan,
        exercises: [],
        repetitions: _currentRepetition,
        exesrciseIndex: _currentExerciseIndex,
        isCompleted: _isCompleted,
      );
    }

    // Start the countdown for the first exercise
    _startCountdown();
  }

  void _startCountdown() {
    _isCountingDown = true;
    _secondsRemaining = 3;
    AudioPlayer().play(
        AssetSource(widget.plan.exercises[_currentExerciseIndex].soundPath),
        mode: PlayerMode.lowLatency);
    _exerciseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _isCountingDown = false;
          _startExerciseTimer();
          timer.cancel();
        }
      });
    });
  }

  void _startExerciseTimer() {
    setState(() {
      if (_isPaused) {
        _isPaused = false;
      } else {
        _secondsRemaining =
            widget.plan.exercises[_currentExerciseIndex].duration;
      }
    });
    _exerciseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;

          if (_displayImage ==
              widget.plan.exercises[_currentExerciseIndex].image) {
            _displayImage =
                widget.plan.exercises[_currentExerciseIndex].secondaryImage!;
          } else {
            _displayImage = widget.plan.exercises[_currentExerciseIndex].image;
          }

          if (_secondsRemaining < 3 && !_isCountingDown) {
            AudioPlayer().play(AssetSource('sounds/beep.mp3'),
                mode: PlayerMode.lowLatency);
          }
        } else {
          timer.cancel();

          // add exercise to history
          _workoutHistory.exercises
              .add(widget.plan.exercises[_currentExerciseIndex]);

          _nextExercise();
        }
      });
    });
  }

  void _nextExercise() {
    setState(() {
      if (_currentExerciseIndex < widget.plan.exercises.length - 1) {
        _currentExerciseIndex++;
        _workoutHistory.exesrciseIndex = _currentExerciseIndex;
        _startCountdown();
      } else {
        if (_currentRepetition < widget.plan.repetitions - 1) {
          _currentRepetition++;
          _currentExerciseIndex = 0;
          _workoutHistory.repetitions = _currentRepetition;
          _workoutHistory.exesrciseIndex = _currentExerciseIndex;
          _rest();
        } else {
          _completeExercise();
        }
      }
    });
  }

  void _rest() {
    _isResting = true;
    _secondsRemaining = widget.plan.rest;
    ;
    AudioPlayer().play(AssetSource('sounds/exercises/Rest.mp3'),
        mode: PlayerMode.lowLatency);
    _exerciseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
          _startCountdown();
          _isResting = false;
        }
      });
    });
  }

  void _completeExercise() async {
    _exerciseTimer.cancel();
    _workoutHistory.isCompleted = true;

    AudioPlayer()
        .play(AssetSource('sounds/completed.wav'), mode: PlayerMode.lowLatency);
    setState(() {
      _isCompleted = true;

      showModalBottomSheet(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        context: context,
        builder: (context) => WorkoutCompelted(workoutHistory: _workoutHistory),
      );
    });
  }

  void _onPause() {
    setState(() {
      _exerciseTimer.cancel();
      _isPaused = true;
    });
  }

  void _onResume() {
    setState(() {
      _startExerciseTimer();
    });
  }

  void _skipExercise() {
    setState(() {
      _exerciseTimer.cancel();
      if (_isResting) {
        _startCountdown();
        _isResting = false;
      } else {
        _nextExercise();
      }
    });
  }

  void _onRestart() {
    setState(() {
      _exerciseTimer.cancel();
      _startCountdown();
    });
  }

  @override
  void dispose() {
    _exerciseTimer.cancel();
    if (widget.history == null) {
      historyBox.add(_workoutHistory);
    } else {
      int historyIndex = historyBox.values.toList().indexOf(widget.history!);
      if (historyIndex != -1) {
        historyBox.putAt(historyIndex, _workoutHistory);
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ExerciseAppBar.buildAppBar(context),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _isCompleted
                    ? 'Workout Completed'
                    : _isResting
                        ? 'Rest'
                        : widget.plan.exercises[_currentExerciseIndex].name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                  width: 288,
                  height: 288,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0XFFF3F6FB),
                  ),
                  child: _isCompleted
                      ? const Icon(
                          Icons.done,
                          size: 128,
                          color: Colors.green,
                        )
                      : Center(
                          child: Image.asset(
                            _displayImage,
                            height: 128,
                            width: 248,
                            fit: BoxFit.cover,
                          ),
                        )),
              _isCompleted
                  ? const SizedBox()
                  : _isCountingDown
                      ? Text(
                          "$_secondsRemaining",
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          Duration(seconds: _secondsRemaining)
                              .toString()
                              .substring(2, 7),
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
              _isCompleted
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: PrimaryButton(
                          onTap: () => Navigator.pop(context), text: "Done"),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SecondaryButton(
                              text: _isPaused ? "Resume" : "Pause",
                              onTap: _isPaused ? _onResume : _onPause),
                          const SizedBox(width: 16),
                          PrimaryButton(text: "Restart", onTap: _onRestart),
                        ],
                      ),
                    ),
              _isCompleted
                  ? const SizedBox()
                  : TextButton(
                      onPressed: _skipExercise,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0XFF81809E),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }
}
