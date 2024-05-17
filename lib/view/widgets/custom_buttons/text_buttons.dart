import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomTextButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
