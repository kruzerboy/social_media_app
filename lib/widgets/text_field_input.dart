import 'package:flutter/material.dart';
class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText; 
  final TextInputType textInputType;
  const TextFieldInput({super.key, 
  required this.textEditingController,
   this.isPass = false,
    required this.hintText, 
    required this.textInputType
    }
    );

  @override
  Widget build(BuildContext context) {
    return TextField( 
      controller: textEditingController, // Added space after colon
      decoration: InputDecoration(
        hintText: hintText, // Replaced 'HintText' with 'hintText'
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType, // Added space after colon
      obscureText: isPass, // Added space after colon
    );
  }
}
