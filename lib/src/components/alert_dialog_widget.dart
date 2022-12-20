import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class AlertDialogWidget extends StatelessWidget {
   AlertDialogWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.updateId,
    required this.isUpdate,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
   bool isUpdate = false;
  final String updateId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(8.0),
      content: GetBuilder<TodoController>(builder: (controller) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 270,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isUpdate ? 'Update Todo' : 'Add Todo',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.titleController,
                          decoration: const InputDecoration(
                            hintText: 'Enter Title',
                            filled: true,
                            fillColor: Colors.black12,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controller.descriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Enter Description',
                            filled: true,
                            fillColor: Colors.black12,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (isUpdate) {
                                controller.updateTodoById(
                                  updateId,
                                );
                              } else {
                                if (_formKey.currentState!.validate()) {
                                  controller.addTodo();
                                  controller.titleController.clear();
                                  controller.descriptionController.clear();
                                  Get.back();
                                }
                              }
                              Get.back();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(150, 45),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          child: Text(
                            isUpdate ? 'Update Todo' : 'Add Todo',
                            style: const TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        );
      }),
    );
  }
}
