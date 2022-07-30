import 'package:flutter/material.dart';

class DetailBaseBodyLayout extends StatelessWidget {
  final Widget child;
  const DetailBaseBodyLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        // vertical: 30, // 垂直方向に余白
        horizontal: 30,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
