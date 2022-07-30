import 'package:flutter/material.dart';
import 'package:flutter_provider_todo_sample/screen/todo_list_screen.dart';
import 'package:provider/provider.dart';

import 'model/provider_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerData = ProviderDataType();
    return MaterialApp(
      title: 'STF TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Providerで親Widgetにデータを仕掛ける
      // 参考: https://www.flutter-study.dev/create-app/provider
      home: ChangeNotifierProvider<ProviderDataType>.value(
        value: providerData,
        child: const TodoListScreen(),
      ),
    );
  }
}
