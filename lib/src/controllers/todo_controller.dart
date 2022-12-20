import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_todo_api/src/services/network/network_service.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var todos = [].obs;

  @override
  void onInit() {
    getAllTodos();
    super.onInit();
  }

// add a new todo
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<List> addTodo() async {
    final data = {
      "title": titleController.text,
      "description": descriptionController.text,
      "is_completed": false,
    };
    var body = json.encode(data);

    var response = await NetworkService.post('todos', body: body);
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final addedTodos = data['data'];
      todos.addAll(addedTodos);
      update();
      return todos;
    } else {
      throw Exception('Failed to add todo');
    }
  }

// get all todos
  Future<List> getAllTodos() async {
    final response = await NetworkService.get('todos');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final todoss = data['items'];
      todos.addAll(todoss);
      update();
      return todos;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  // delete a todo
  Future<void> deleteTodoById(String id) async {
    final response = await NetworkService.delete('todos/$id');
    if (response.statusCode == 200) {
      todos.removeWhere((element) => element['_id'] == id);
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

  // update a todo
  Future<void> updateTodoById(String id) async {
    final data = {
      "title": titleController.text,
      "description": descriptionController.text,
      "is_completed": false,
    };
    var body = json.encode(data);

    final response = await NetworkService.put('todos/$id', body: body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final updatedTodo = data['data'];
      final index = todos.indexWhere((element) => element['_id'] == id);
      todos[index] = updatedTodo;
      update();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Todo updated successfully'),
        ),
      );
    } else {
      throw Exception('Failed to update todo');
    }
  }
}
