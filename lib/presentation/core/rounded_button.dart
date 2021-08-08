import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.child, required this.color, this.borderColor, required this.onPressed}) : super(key: key);

  final Widget child;
  final Color color;
  final Color? borderColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(color: borderColor ?? Colors.transparent), borderRadius: BorderRadius.circular(50))),
            backgroundColor: MaterialStateProperty.all(color)),
        onPressed: onPressed,
        child: child);
  }
}

