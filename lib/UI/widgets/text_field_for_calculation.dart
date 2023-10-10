import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Custom input field for calculation.
class CalculationTextField extends StatefulWidget {
  const CalculationTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.textInputType,
      this.readOnly = false});

  final TextEditingController controller;
  final bool readOnly;

  final String label;
  final TextInputType textInputType;

  @override
  State<CalculationTextField> createState() => _CalculationTextFieldState();
}

class _CalculationTextFieldState extends State<CalculationTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.15),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        readOnly: widget.readOnly,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        cursorHeight: 25,
        style: TextStyle(
            fontSize: 25,
            color: widget.readOnly == true ? Colors.redAccent : null),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 15, bottom: 20, top: 20),
          label: Text(widget.label),
          labelStyle: TextStyle(
              fontSize: 25,
              color: widget.readOnly == true ? Colors.redAccent : null),
          hintStyle: const TextStyle(fontSize: 25),
          floatingLabelStyle: TextStyle(
              fontSize: 18,
              color: widget.readOnly == true ? Colors.redAccent : null),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
