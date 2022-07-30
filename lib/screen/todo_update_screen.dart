import 'package:flutter/material.dart';

import '../components/templates/todo_update/todo_update_template.dart';
import '../model/todo_model.dart';

class TodoUpdateScreen extends StatelessWidget {
  final Todo todoDetail;
  const TodoUpdateScreen({Key? key, required this.todoDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoUpdateTemplate(todoDetail: todoDetail);
  }
}
