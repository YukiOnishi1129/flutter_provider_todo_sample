import 'package:flutter_provider_todo_sample/model/todo_model.dart';

class ProviderDataType {
  List<Todo> todoList;
  int currentLastId;

  ProviderDataType(
    this.todoList,
    this.currentLastId,
  );
}
