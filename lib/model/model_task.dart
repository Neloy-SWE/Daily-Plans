import 'package:daily_plans/utilities/strings.dart';
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  TaskModel({
    required this.title,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskModel tm({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      AllText.title: title,
      AllText.isDone: isDone,
      AllText.isDeleted: isDeleted,
    };
  }

  factory TaskModel.hello(Map<String, dynamic> map) {
    return TaskModel(
      title: map[AllText.title] ?? "",
      isDone: map[AllText.isDone] ?? "",
      isDeleted: map[AllText.isDeleted] ?? "",
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      isDone,
      isDeleted,
    ];
  }
}
