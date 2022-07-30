import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final bool disabled;
  final String label;
  final GestureTapCallback handlePress;
  final double width;
  final double height;
  final double radius;
  final double fontSize;
  const CommonButton({
    Key? key,
    required this.label,
    required this.handlePress,
    this.disabled = false,
    this.width = 200,
    this.height = 60,
    this.radius = 10,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // ボタンにまるみをつける
          // https://www.choge-blog.com/programming/flutterelevatedbutton-rounded/
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: disabled ? null : handlePress,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
