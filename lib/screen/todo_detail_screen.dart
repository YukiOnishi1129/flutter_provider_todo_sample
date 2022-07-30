import 'package:flutter/material.dart';

import '../components/templates/todo_detail/todo_detail_template.dart';
import '../model/todo_model.dart';

class TodoDetailScreen extends StatelessWidget {
  final Todo todoDetail;
  const TodoDetailScreen({Key? key, required this.todoDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoDetailTemplate(todoDetail: todoDetail);
  }
}
