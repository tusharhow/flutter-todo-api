import 'package:flutter/material.dart';
import 'package:flutter_todo_api/src/controllers/todo_controller.dart';
import 'package:get/get.dart';

import '../models/add_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Todo API'),
      ),
      body: GetBuilder<TodoController>(
          init: TodoController(),
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('controller.todos[index].title'),
                        subtitle: Text('controller.todos[index].description'),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.addTodo(
                      'title',
                      'description',
                      false,
                    );
                  },
                  child: const Text('Add Todo'),
                ),
              ],
            );
          }),
    );
  }
}
