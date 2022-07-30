import '../model/todo_model.dart';

// シングルトン
// https://qiita.com/i-tanaka730/items/ee5a58ce9a9d7774feaa
// https://flutter.keicode.com/dart/singleton.php

final List<Todo> initTodoList = [
  Todo(
    '1',
    'Todo111111111111111',
    // 複数行テキストを表示
    // https://note.com/_hi/n/n805374ac4ab4
    '''todo content1 
    todo content1 
    todo content1 todo content1 
    todo content1 todo content1 todo content1 todo content1 todo content1 todo content1 todo content1 todo content1 todo content1 ''',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '2',
    'Todo2',
    'todo content2',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '3',
    'Todo3',
    'todo content3',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '4',
    'Todo4',
    'todo content4',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '5',
    'Todo5',
    'todo content5',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '6',
    'Todo6',
    'todo content6',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '7',
    'Todo7',
    'todo content7',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '8',
    'Todo8',
    'todo content8',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '9',
    'Todo9',
    'todo content9',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '10',
    'Todo10',
    'todo content10',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '11',
    'Todo11',
    'todo content11',
    DateTime.now(),
    DateTime.now(),
  ),
  Todo(
    '12',
    'Todo12',
    'todo content12',
    DateTime.now(),
    DateTime.now(),
  ),
];

const int initialLastId = 12;
