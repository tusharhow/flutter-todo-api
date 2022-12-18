import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_api/src/services/network/network_service.dart';
import 'package:get/get.dart';
import '../models/add_todo.dart';
import '../models/todo.dart';


class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<List<Todo>> getAllTodos() async {
    final response = await NetworkService.get('todos');
    if (response.statusCode == 200) {
      final todos = todoFromJson(response.body);
      todos.assignAll(todos);
      return todos;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  // add a new todo
  Future<AddTodo> addTodo(
      String title, String description, bool isCompleted) async {
    final response = await NetworkService.post(
      'todos',
      body: {
        "title": title,
        "description": description,
        "is_completed": isCompleted,
      },
    );
    if (response.statusCode == 201) {
      final todo = addTodoFromJson(response.body);
      return todo;
    } else {
      print(response.body);
      throw Exception('Failed to add todo');
    }
  }

  @override
  void onInit() {
    // getAllTodos();
    super.onInit();
  }
}
