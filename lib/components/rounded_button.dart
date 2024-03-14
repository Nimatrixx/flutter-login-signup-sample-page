import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {super.key,
      required this.onPressed,
      this.width,
      this.height,
      this.color,
      this.text,
      this.textColor});

  double? width;
  double? height;
  String? text;
  Color? color;
  Color? textColor;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        elevation: 8.0,
        child: MaterialButton(
          minWidth: width,
          height: height,
          onPressed: onPressed,
          child: Text(
            text ?? 'Button',
            style: TextStyle(
              fontFamily: 'Satoshi',
              color: textColor,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
