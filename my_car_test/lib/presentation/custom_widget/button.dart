import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPress;
  final bool isOutline;
  final text;

  const Button(
      {required this.onPress,
      required this.text,
      this.isOutline = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          color: isOutline ? Colors.white : Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: Colors.black)),
      child: Text(
        text,
        style: TextStyle(
            color: isOutline ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
