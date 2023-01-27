import 'package:equatable/equatable.dart';
import 'constants.dart';

class TaskModel extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  TaskModel({
    required this.title,
    required this.description,
    required this.id,
    required this.date,
    this.isDone,
    this.isDeleted,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  TaskModel tm({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ModelConstants.title: title,
      ModelConstants.description: description,
      ModelConstants.id: id,
      ModelConstants.date: date,
      ModelConstants.isDone: isDone,
      ModelConstants.isDeleted: isDeleted,
      ModelConstants.isFavorite: isFavorite,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map[ModelConstants.title] ?? "",
      description: map[ModelConstants.description] ?? "",
      id: map[ModelConstants.id] ?? "",
      date: map[ModelConstants.date] ?? "",
      isDone: map[ModelConstants.isDone],
      isDeleted: map[ModelConstants.isDeleted],
      isFavorite: map[ModelConstants.isFavorite],
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      description,
      id,
      date,
      isDone,
      isDeleted,
      isFavorite,
    ];
  }
}
