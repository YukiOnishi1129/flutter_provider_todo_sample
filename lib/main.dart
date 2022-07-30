import 'package:flutter/material.dart';
import 'package:flutter_provider_todo_sample/screen/todo_list_screen.dart';
import 'package:provider/provider.dart';

import 'model/provider_model.dart';
import 'constants/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerData = ProviderDataType(todoList, initialLastId);
    return MaterialApp(
      title: 'STF TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Providerで親Widgetにデータを仕掛ける
      home: Provider<ProviderDataType>.value(
        value: providerData,
        child: const TodoListScreen(),
      ),
    );
  }
}
