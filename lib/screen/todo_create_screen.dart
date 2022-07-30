import 'package:flutter/material.dart';

import '../components/templates/todo_create/todo_create_template.dart';

class TodoCreateScreen extends StatelessWidget {
  final int lastId;
  const TodoCreateScreen({Key? key, required this.lastId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoCreateTemplate(lastId: lastId);
  }
}
