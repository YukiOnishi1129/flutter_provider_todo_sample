import 'package:flutter/material.dart';

import '../../../model/todo_model.dart';
import '../../commons/atoms/common_button.dart';
import '../../layouts/detail_base_body_layout.dart';

class TodoUpdateTemplate extends StatefulWidget {
  final Todo todoDetail;
  const TodoUpdateTemplate({Key? key, required this.todoDetail})
      : super(key: key);

  @override
  State<TodoUpdateTemplate> createState() => _TodoUpdateTemplateState();
}

class _TodoUpdateTemplateState extends State<TodoUpdateTemplate> {
  //  入力値の定義
  // late: 遅延初期化
  // https://qiita.com/nukotsuka/items/66236723bf17c4574608
  late TextEditingController _titleController;
  late TextEditingController _contentsController;
  bool disabled = true;

  // コントローラーの初期化
  // https://qiita.com/pe-ta/items/b3b7458059c1fd7efcf0
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todoDetail.title);
    _contentsController =
        TextEditingController(text: widget.todoDetail.content);
  }

  // statefulオブジェクトが削除されるときに、参照を削除してくれる
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
      disabled = inputValue.isEmpty ||
          _contentsController.text.isEmpty ||
          (inputValue == widget.todoDetail.title &&
              _contentsController.text == widget.todoDetail.title);
    });
  }

  /*
  * 内容入力処理
  */
  void _handleContentInputValue(String inputValue) {
    setState(() {
      disabled = inputValue.isEmpty ||
          _titleController.text.isEmpty ||
          (inputValue == widget.todoDetail.content &&
              _titleController.text == widget.todoDetail.title);
      ;
    });
  }

  /*
  * Todo更新処理
  */
  void _submitUpdateTodo() {
    // popで前の画面に戻る
    // popの引数から前の画面にデータを渡す
    Navigator.of(context).pop(
      Todo(
        widget.todoDetail.id,
        _titleController.text,
        _contentsController.text,
        widget.todoDetail.createdAt,
        DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('編集'),
      ),
      body: DetailBaseBodyLayout(
        child: Column(
          children: [
            TextField(
              // enabled: false, // 非活性
              controller: _titleController,
              decoration: const InputDecoration(
                // https://qiita.com/sekitaka_1214/items/17cccc94a9e7150cdf3a
                labelText: 'タイトル',
              ),
              onChanged: _handleTitleInputValue,
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              // enabled: false,
              // 複数行表示
              // https://minpro.net/flutter-dart-textfield-fold
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
              label: '更新',
              handlePress: _submitUpdateTodo,
            ),
          ],
        ),
      ),
    );
  }
}
