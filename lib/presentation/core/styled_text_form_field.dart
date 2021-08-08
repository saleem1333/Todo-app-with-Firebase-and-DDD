import 'package:flutter/material.dart';

class StyledTextFormField extends StatelessWidget {
  const StyledTextFormField({Key? key, this.hintText, this.onPressed, this.validator, this.onChanged, this.obsecureText = false}) : super(key: key);

  final String? hintText;
  final void Function()? onPressed;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 17, color: Color(0xff707070).withOpacity(0.7)),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Color(0xff707070))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Color(0xff707070)))),
      obscureText: obsecureText,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
