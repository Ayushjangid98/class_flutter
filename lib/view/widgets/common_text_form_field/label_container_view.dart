import 'package:flutter/material.dart';

class LabelContainer extends StatelessWidget {
  final String label;
  final Widget child;
  const LabelContainer({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400
        ),),
        const SizedBox(height: 5,),
        child
      ],
    );
  }
}
