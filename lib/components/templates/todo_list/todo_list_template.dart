import 'package:flutter/material.dart';
import 'package:flutter_provider_todo_sample/model/provider_model.dart';
import 'package:provider/provider.dart';

import '../../../model/todo_model.dart';
import '../../../screen/todo_create_screen.dart';
import '../../../screen/todo_detail_screen.dart';
import '../../../screen/todo_update_screen.dart';
import '../../modals/alert_modal.dart';
import 'organisms/todo_item.dart';

class TodoListTemplate extends StatefulWidget {
  const TodoListTemplate({Key? key}) : super(key: key);

  @override
  State<TodoListTemplate> createState() => _TodoListTemplateState();
}

class _TodoListTemplateState extends State<TodoListTemplate> {
  @override
  Widget build(BuildContext context) {
    // List<Todo> _todoList = todoList;
    // int _currentLastId = initialLastId;

    final ProviderDataType data = context.watch<ProviderDataType>();

    /*
    * 作成画面へ遷移処理
    */
    void _handleTransitionCreateScreen() async {
      try {
        // 作成画面へ遷移
        final Todo createdTodo = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoCreateScreen(
              lastId: data.currentLastId,
            ),
          ),
        );
        // 新規Todoを追加
        data.todoList.add(createdTodo);
        // 作成日の降順にソート
        // _todoList.sort((prev, next) => -prev.createdAt.compareTo(next.createdAt));
        setState(() {
          // 配列のコピーを作成
          // https://www.choge-blog.com/programming/dart%E3%83%AA%E3%82%B9%E3%83%88list%E3%82%92%E3%82%B3%E3%83%94%E3%83%BC%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95/
          // final newTodoList = List.of(_todoList);
          data.todoList;
          data.currentLastId = int.parse(createdTodo.id);
        });
      } catch (e) {
        throw Exception(e.toString());
      }
    }

    /*
    * 詳細画面へ遷移処理
    */
    void _handleTransitionDetailScreen({required Todo targetTodo}) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TodoDetailScreen(todoDetail: targetTodo),
        ),
      );
    }

    /*
    * 更新画面へ遷移
    * (更新画面で更新処理を実施した際に、値を更新する)
    */
    Future<void> _handleTransitionUpdateScreen(
        {required Todo targetTodo}) async {
      try {
        final Todo updatedTodo = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TodoUpdateScreen(todoDetail: targetTodo), // 更新画面に遷移
          ),
        );
        // 更新画面で更新処理を実施した際に、渡ってきた更新データを元にtodoListを更新
        // Todoの内容を更新
        setState(() {
          data.todoList = data.todoList.map((todo) {
            if (todo.id == updatedTodo.id) {
              return updatedTodo;
            }
            return todo;
          }).toList();
        });
      } catch (e) {
        throw Exception(e.toString());
      }
    }

    /*
    * Todo削除処理
    */
    void _handleDeleteTodo({required Todo targetTodo}) {
      setState(() {
        // Dartでfilterするときはwhereを使う
        // https://www.choge-blog.com/programming/dart%E3%83%AA%E3%82%B9%E3%83%88list%E3%81%AB%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF%E3%83%BCfilter%E5%87%A6%E7%90%86%E3%82%92%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95/
        data.todoList =
            data.todoList.where((todo) => todo.id != targetTodo.id).toList();
      });
    }

    /*
    * 削除アイコンクリック処理
    */
    void _handleClickDeleteIcon({required Todo targetTodo}) {
      // 削除処理を実行
      showDialog(
        context: context,
        builder: (_) {
          return AlertModal(
              executeFunc: () => _handleDeleteTodo(targetTodo: targetTodo),
              showTitle: 'Todoを削除します。',
              showContext: targetTodo.title);
        },
      );
    }

    // ソート
    // https://www.choge-blog.com/programming/dart%E3%83%AA%E3%82%B9%E3%83%88list%E3%82%92%E4%B8%A6%E3%81%B3%E6%9B%BF%E3%81%88%E3%82%8B%E6%96%B9%E6%B3%95/
    // 作成日の降順にソート
    data.todoList
        .sort((prev, next) => -prev.createdAt.compareTo(next.createdAt));

    return Scaffold(
      appBar: AppBar(
        title: const Text('STF TODO'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30, // 垂直方向に余白
        ),
        child: ListView.builder(
          // ListView.builderで一覧表示できる
          // https://www.flutter-study.dev/widgets/list-view-widget
          itemCount: data.todoList.length, // widget.~で親から受け取ったパラメータを使用できる
          itemBuilder: (context, index) {
            final todo = data.todoList[index];

            return Center(
              // 中央寄せ
              child: Container(
                width: 350,
                height: 60,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                // Containerにdecoration
                // https://note.com/hatchoutschool/n/na227e7035f3d
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TodoItem(
                  title: todo.title,
                  handlePressDetail: () =>
                      _handleTransitionDetailScreen(targetTodo: todo),
                  handlePressUpdate: () =>
                      _handleTransitionUpdateScreen(targetTodo: todo),
                  handlePressDelete: () =>
                      _handleClickDeleteIcon(targetTodo: todo),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => _handleTransitionCreateScreen(),
      ),
    );
  }
}
