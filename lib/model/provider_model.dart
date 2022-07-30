import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_todo_sample/model/todo_model.dart';

import '../constants/data.dart';

class ProviderDataType extends ChangeNotifier {
  List<Todo> todoList = initTodoList;
  int currentLastId = initialLastId;

  void createTodoList({required Todo createTodo, required int newTodoId}) {
    todoList.add(createTodo);
    currentLastId = newTodoId;
    // UI再構築
    notifyListeners();
  }

  void updateTodoList({required Todo updateTodo}) {
    todoList = todoList.map((todo) {
      if (todo.id == updateTodo.id) {
        return updateTodo;
      }
      return todo;
    }).toList();
    notifyListeners();
  }

  void deleteTodo({required Todo deleteTodo}) {
    todoList = todoList.where((todo) => todo.id != deleteTodo.id).toList();
    notifyListeners();
  }
}
