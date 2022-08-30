import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/widgets/app_large_text.dart';
import 'package:flutter_widgets/widgets/custom_text_field.dart';

import '../../model/todo.dart';
import '../../repository/todo_list_state_notifier.dart';
import '../../widgets/custom_app_bar.dart';

class TodoListPage extends ConsumerStatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends ConsumerState<TodoListPage> {
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = ref.watch(todosProvider);
    return Scaffold(
      appBar: CustomAppBar(title: 'TodoList'),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomTextField(
                      controller: descriptionController, label: 'Description'),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Todo todo = Todo(
                            id: todos.length.toString(),
                            description: descriptionController.text,
                            completed: false);
                        ref.read(todosProvider.notifier).addTodo(todo);
                        descriptionController.clear();
                      },
                      child: const Text('Add'))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: double.infinity,
                child: Center(child: AppLargeText(text: 'Todo list'))),
            const SizedBox(
              height: 10,
            ),
            Text('${todos.length} items'),
            const SizedBox(
              height: 10,
            ),
            todos.isEmpty
                ? Text("List is empty")
                : SizedBox(
                    height: 400,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          Todo todo = todos[index];
                          return CheckboxListTile(
                            value: todo.completed,
                            // When tapping on the todo, change its completed status
                            onChanged: (value) => ref
                                .read(todosProvider.notifier)
                                .toggle(todo.id),
                            title: Text(todo.description),
                          );
                        })),
          ],
        ),
      ),
    );
  }
}
