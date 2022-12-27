import 'package:equatable/equatable.dart';
import 'constants.dart';


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
      ModelConstants.title: title,
      ModelConstants.isDone: isDone,
      ModelConstants.isDeleted: isDeleted,
    };
  }

  factory TaskModel.hello(Map<String, dynamic> map) {
    return TaskModel(
      title: map[ModelConstants.title] ?? "",
      isDone: map[ModelConstants.isDone] ?? "",
      isDeleted: map[ModelConstants.isDeleted] ?? "",
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
