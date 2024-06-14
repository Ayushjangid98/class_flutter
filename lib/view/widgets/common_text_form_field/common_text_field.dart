import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyBordType;
  final TextStyle? textStyle;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;
  const CommonTextField({super.key, required this.controller, required this.hintText, required this.errorText, this.inputFormatters, this.keyBordType, required this.validator, this.textStyle, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
          child: TextFormField(
            controller: controller,
            keyboardType: keyBordType ?? TextInputType.text,
            validator: validator,
            inputFormatters: inputFormatters ?? [],
            onChanged: onChanged,
            style: textStyle??const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              errorText: null,
              errorStyle: const TextStyle(fontSize: 0),
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        if(errorText!="")
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              errorText,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.red,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
            ),
          )
      ],
    );
  }
}
