import 'package:flutter/material.dart';

import '../components/templates/todo_list/todo_list_template.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TodoListTemplate();
  }
}
