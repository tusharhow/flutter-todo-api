import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_api/src/services/network/network_service.dart';
import 'package:get/get.dart';
import '../models/add_todo.dart';
import '../models/todo.dart';

class TodoController extends GetxController {
  var todos = <Items>[].obs;

  @override
  void onInit() {
    getAllTodos();

    super.onInit();
  }

// add a new todo
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  var addedTodos = <Data>[].obs;
  Future addTodo() async {
    final data = {
      "title": titleController.text,
      "description": descriptionController.text,
      "is_completed": false,
    };
    var body = json.encode(data);

    var response = await NetworkService.post('todos', body: body);
    if (response.statusCode == 201) {
      final map = AddTodo.fromJson(jsonDecode(response.body));
      final Data todo = Data.fromJson(map.toJson());

      addedTodos.add(todo);
      update();
      return addedTodos;
    } else {
      throw Exception('Failed to add todo');
    }
  }

  Future<List<Items>> getAllTodos() async {
    final response = await NetworkService.get('todos');
    if (response.statusCode == 200) {
      final map = Todo.fromJson(jsonDecode(response.body)).items;
      final List<Items> todoss =
          map!.map((e) => Items.fromJson(e.toJson())).toList();
      todos.assignAll(todoss);
      return todos;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  // delete a todo by sid
  Future<void> deleteTodoById(String id) async {
    final response = await NetworkService.delete('todos/$id');
    if (response.statusCode == 200) {
      todos.removeWhere((element) => element.sId == id);
      update();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Todo deleted successfully'),
        ),
      );
    } else {
      throw Exception('Failed to delete todo');
    }
  }
}
