// To parse this JSON data, do
//
//     final addTodo = addTodoFromJson(jsonString);

import 'dart:convert';

AddTodo addTodoFromJson(String str) => AddTodo.fromJson(json.decode(str));

String addTodoToJson(AddTodo data) => json.encode(data.toJson());

class AddTodo {
  AddTodo({
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  String title;
  String description;
  String isCompleted;

  factory AddTodo.fromJson(Map<String, dynamic> json) => AddTodo(
        title: json["title"],
        description: json["description"],
        isCompleted: json["is_completed"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "is_completed": isCompleted,
      };
}
