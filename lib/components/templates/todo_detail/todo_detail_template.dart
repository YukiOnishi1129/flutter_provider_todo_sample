import 'package:flutter/material.dart';

import '../../../model/todo_model.dart';
import '../../layouts/detail_base_body_layout.dart';

class TodoDetailTemplate extends StatefulWidget {
  final Todo todoDetail;
  const TodoDetailTemplate({Key? key, required this.todoDetail})
      : super(key: key);

  @override
  State<TodoDetailTemplate> createState() => _TodoDetailTemplateState();
  Widget build(BuildContext context) {
    return Container();
  }
}

class _TodoDetailTemplateState extends State<TodoDetailTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('詳細'),
      ),
      body: DetailBaseBodyLayout(
        child: Column(
          children: [
            TextField(
              enabled: false, // 非活性
              controller: TextEditingController(text: widget.todoDetail.title),
              decoration: const InputDecoration(
                // https://qiita.com/sekitaka_1214/items/17cccc94a9e7150cdf3a
                labelText: 'タイトル',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              enabled: false,
              // 複数行表示
              // https://minpro.net/flutter-dart-textfield-fold
              maxLines: null,
              controller:
                  TextEditingController(text: widget.todoDetail.content),
              decoration: const InputDecoration(
                labelText: '内容',
              ),
            ),
            const SizedBox(
              height: 160,
            )
          ],
        ),
      ),
    );
  }
}
