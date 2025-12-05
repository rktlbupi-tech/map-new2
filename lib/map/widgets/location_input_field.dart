import 'package:flutter/material.dart';

class LocationInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final Function(String) onChanged;
  final Widget? suffixIcon;

  const LocationInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.onChanged,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF888888),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF888888)),
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 10,
        ),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black, width: 1.2),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
