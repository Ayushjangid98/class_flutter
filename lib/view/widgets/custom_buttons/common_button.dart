import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool loading;
  final Color color;
  final double ?width;
  final double ?height;
  final double ?textSize;
  const CommonButton({super.key, required this.text, required this.loading, required this.onPressed, required this.color,this.width,this.height,this.textSize,});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height??32,
        width: width??double.infinity,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: MaterialButton(
              onPressed: onPressed,
              child: Center(
                child: loading == true
                    ? const SizedBox(height: 30,width: 30,child:  CircularProgressIndicator(strokeWidth: 3,))
                    : Text(text,
                    style: TextStyle(
                        fontSize: textSize??14,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500)),
              )),
        ));
  }
}