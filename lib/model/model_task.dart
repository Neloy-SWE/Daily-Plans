import 'package:equatable/equatable.dart';
import 'constants.dart';

class TaskModel extends Equatable {
  final String title;
  final String description;
  final String id;
  bool? isDone;
  bool? isDeleted;

  TaskModel({
    required this.title,
    required this.description,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskModel tm({
    String? title,
    String? description,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ModelConstants.title: title,
      ModelConstants.description: description,
      ModelConstants.id: id,
      ModelConstants.isDone: isDone,
      ModelConstants.isDeleted: isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map[ModelConstants.title] ?? "",
      description: map[ModelConstants.description] ?? "",
      id: map[ModelConstants.id] ?? "",
      isDone: map[ModelConstants.isDone] ?? "",
      isDeleted: map[ModelConstants.isDeleted] ?? "",
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      description,
      id,
      isDone,
      isDeleted,
    ];
  }
}
