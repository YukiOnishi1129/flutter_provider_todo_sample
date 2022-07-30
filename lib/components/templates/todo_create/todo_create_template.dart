import 'package:flutter/material.dart';

import '../../../model/todo_model.dart';
import '../../commons/atoms/common_button.dart';
import '../../layouts/detail_base_body_layout.dart';

class TodoCreateTemplate extends StatefulWidget {
  final int lastId;
  const TodoCreateTemplate({Key? key, required this.lastId}) : super(key: key);

  @override
  State<TodoCreateTemplate> createState() => _TodoCreateTemplateState();
}

class _TodoCreateTemplateState extends State<TodoCreateTemplate> {
  // 入力値の定義
  late TextEditingController _titleController;
  late TextEditingController _contentsController;
  bool disabled = true;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentsController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentsController.dispose();
  }

  /*
  * タイトル入力処理
  */
  void _handleTitleInputValue(String inputValue) {
    setState(() {
      disabled = inputValue.isEmpty || _contentsController.text.isEmpty;
    });
  }

  /*
  * 内容入力処理
  */
  void _handleContentInputValue(String inputValue) {
    setState(() {
      disabled = inputValue.isEmpty || _titleController.text.isEmpty;
    });
  }

  /*
  * Todo作成処理
  */
  void _submitCreateTodo() {
    Navigator.of(context).pop(Todo(
      (widget.lastId + 1).toString(),
      _titleController.text,
      _contentsController.text,
      DateTime.now(),
      DateTime.now(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('作成'),
      ),
      body: DetailBaseBodyLayout(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'タイトル',
              ),
              onChanged: _handleTitleInputValue,
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              maxLines: null,
              controller: _contentsController,
              decoration: const InputDecoration(
                labelText: '内容',
              ),
              onChanged: _handleContentInputValue,
            ),
            const SizedBox(
              height: 100,
            ),
            CommonButton(
              disabled: disabled,
              label: '作成',
              handlePress: _submitCreateTodo,
            ),
          ],
        ),
      ),
    );
  }
}
