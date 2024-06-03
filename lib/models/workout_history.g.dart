// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutHistoryAdapter extends TypeAdapter<WorkoutHistory> {
  @override
  final int typeId = 1;

  @override
  WorkoutHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutHistory(
      date: fields[0] as DateTime,
      isCompleted: fields[1] as bool,
      plan: fields[2] as WorkoutPlan,
      repetitions: fields[3] as int,
      exesrciseIndex: fields[4] as int,
      exercises: (fields[5] as List).cast<Exercise>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutHistory obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.isCompleted)
      ..writeByte(2)
      ..write(obj.plan)
      ..writeByte(3)
      ..write(obj.repetitions)
      ..writeByte(4)
      ..write(obj.exesrciseIndex)
      ..writeByte(5)
      ..write(obj.exercises);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
