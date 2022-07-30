import 'package:flutter/material.dart';

class AlertModal extends StatelessWidget {
  final Function executeFunc;
  final String showTitle;
  final String showContext;
  const AlertModal(
      {Key? key,
      required this.executeFunc,
      this.showTitle = "",
      this.showContext = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: showTitle.isEmpty ? null : Text(showTitle),
      content: showContext.isEmpty ? null : Text('タイトル: $showContext'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            executeFunc();
            Navigator.of(context).pop();
          },
          child: const Text('削除'),
        ),
      ],
    );
  }
}
