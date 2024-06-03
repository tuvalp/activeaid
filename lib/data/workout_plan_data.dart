import 'package:activeaid/models/exercise.dart';
import 'package:activeaid/models/workout_plan.dart';

class WorkoutPlanData {
  static List<WorkoutPlan> getWorkoutPlans() {
    Exercise pushUps = Exercise(
      name: 'Push-ups',
      duration: 30,
      soundPath: "sounds/exercises/Push-ups.mp3",
      metValue: 3.8,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise squats = Exercise(
      name: 'Squats',
      duration: 45,
      soundPath: "sounds/exercises/Squats.mp3",
      metValue: 5.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise plank = Exercise(
      name: 'Plank',
      duration: 30,
      soundPath: "sounds/exercises/Plank.mp3",
      metValue: 2.5,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise mountainClimbers = Exercise(
      name: 'Mountain Climbers',
      duration: 45,
      soundPath: "sounds/exercises/Mountain_Climbers.mp3",
      metValue: 8.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise lunges = Exercise(
      name: 'Lunges (alternate legs)',
      duration: 45,
      soundPath: "sounds/exercises/Lunges_alternate_legs.mp3",
      metValue: 5.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise wallSit = Exercise(
      name: 'Wall Sit',
      duration: 45,
      soundPath: "sounds/exercises/Wall_sit.mp3",
      metValue: 2.5,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise jumpingJacks = Exercise(
      name: 'Jumping Jacks',
      duration: 60,
      soundPath: "sounds/exercises/Jumping_Jacks.mp3",
      metValue: 8.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise burpees = Exercise(
      name: 'Burpees',
      duration: 45,
      soundPath: "sounds/exercises/Burpees.mp3",
      metValue: 8.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise bicycleCrunches = Exercise(
      name: 'Bicycle Crunches',
      duration: 45,
      soundPath: "sounds/exercises/Bicycle_Crunches.mp3",
      metValue: 8.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise russianTwists = Exercise(
      name: 'Russian Twists',
      duration: 45,
      soundPath: "sounds/exercises/Russian_Twists.mp3",
      metValue: 8.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise legRaises = Exercise(
      name: 'Leg Raises',
      duration: 45,
      soundPath: "sounds/exercises/Leg_Raises.mp3",
      metValue: 3.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise supermanPose = Exercise(
      name: 'Superman Pose',
      duration: 45,
      soundPath: "sounds/exercises/Superman_Pose.mp3",
      metValue: 3.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise reverseLunges = Exercise(
      name: 'Reverse Lunges (alternate legs)',
      duration: 60,
      soundPath: "sounds/exercises/Reverse_Lunges_alternate_legs.mp3",
      metValue: 5.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise highKnees = Exercise(
      name: 'High Knees',
      duration: 60,
      soundPath: "sounds/exercises/High_Knees.mp3",
      metValue: 8.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise tricepDips = Exercise(
      name: 'Tricep Dips',
      duration: 45,
      soundPath: "sounds/exercises/Tricep_Dips.mp3",
      metValue: 5.0,
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );

    Exercise exs1 = Exercise(
      name: 'exs1',
      duration: 5,
      metValue: 1,
      soundPath: "",
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise exs2 = Exercise(
      name: 'exs2',
      duration: 5,
      metValue: 1,
      soundPath: "",
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );
    Exercise exs3 = Exercise(
      name: 'exs3',
      duration: 5,
      metValue: 1,
      soundPath: "",
      image: 'assets/images/push_up_1.png',
      secondaryImage: 'assets/images/push_up_2.png',
    );

    // Define workout plans
    List<WorkoutPlan> workoutPlans = [
      WorkoutPlan(
        name: 'exss',
        category: 1,
        exercises: [exs1, exs2, exs3],
        rest: 10,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Beginner Full Body Circuit',
        category: 1,
        exercises: [pushUps, squats, plank, mountainClimbers],
        rest: 60,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Lower Body Blast',
        category: 2,
        exercises: [lunges, squats, wallSit, jumpingJacks],
        rest: 45,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Core Crusher',
        category: 4,
        exercises: [bicycleCrunches, russianTwists, legRaises, plank],
        rest: 60,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Cardio Burn',
        category: 5,
        exercises: [highKnees, burpees, mountainClimbers, jumpingJacks],
        rest: 45,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Upper Body Strength',
        category: 3,
        exercises: [pushUps, tricepDips, supermanPose, plank],
        rest: 60,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Full Body HIIT',
        category: 1,
        exercises: [burpees, lunges, russianTwists, mountainClimbers],
        rest: 45,
        repetitions: 4,
      ),
      WorkoutPlan(
        name: 'Leg Day Burnout',
        category: 2,
        exercises: [squats, jumpingJacks, wallSit, reverseLunges],
        rest: 60,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Quick Cardio Blast',
        category: 5,
        exercises: [jumpingJacks, highKnees, mountainClimbers, burpees],
        rest: 45,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Core and Cardio Combo',
        category: 4,
        exercises: [plank, bicycleCrunches, mountainClimbers, highKnees],
        rest: 45,
        repetitions: 4,
      ),
      WorkoutPlan(
        name: 'Strength and Stability',
        category: 6,
        exercises: [pushUps, squats, plank, tricepDips],
        rest: 60,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Lower Body HIIT',
        category: 2,
        exercises: [jumpingJacks, lunges, squats, wallSit],
        rest: 45,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Quick Abs Blast',
        category: 4,
        exercises: [russianTwists, bicycleCrunches, legRaises, plank],
        rest: 45,
        repetitions: 4,
      ),
      WorkoutPlan(
        name: 'Upper Body Burnout',
        category: 3,
        exercises: [pushUps, tricepDips, supermanPose, mountainClimbers],
        rest: 45,
        repetitions: 4,
      ),
      WorkoutPlan(
        name: 'Core Strength Challenge',
        category: 4,
        exercises: [plank, legRaises, russianTwists, bicycleCrunches],
        rest: 60,
        repetitions: 3,
      ),
      WorkoutPlan(
        name: 'Total Body Circuit',
        category: 1,
        exercises: [burpees, squats, pushUps, mountainClimbers],
        rest: 60,
        repetitions: 3,
      ),
    ];

    return workoutPlans;
  }
}
