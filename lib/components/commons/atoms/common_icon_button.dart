import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  final double width;
  final IconData icon;
  final GestureTapCallback handlePress;
  const CommonIconButton(
      {Key? key,
      required this.icon,
      required this.handlePress,
      this.width = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: IconButton(
        icon: Icon(icon),
        onPressed: handlePress,
      ),
    );
  }
}
