import 'package:flutter/material.dart';
import 'package:flutter_todo_api/src/controllers/todo_controller.dart';
import 'package:flutter_todo_api/src/models/todo.dart';
import 'package:get/get.dart';

import '../components/alert_dialog_widget.dart';
import '../models/add_todo.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                FutureBuilder<List<Items>>(
                    future: controller.getAllTodos(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child:
                                Text('No Data', style: TextStyle(fontSize: 23)),
                          );
                        }
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final todo = snapshot.data![index];
                              return ListTile(
                                title: Text(
                                  todo.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Text(
                                  todo.description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    controller.deleteTodoById(todo.sId);
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Error');
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialogWidget(formKey: _formKey);
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
