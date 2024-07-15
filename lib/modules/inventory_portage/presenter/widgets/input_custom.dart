import 'package:flutter/material.dart';

class InputCustom extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const InputCustom({
    Key? key,
    required this.title,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.title,
          errorText: _errorText,
        ),
        onChanged: (value) {
          setState(() {
            _errorText = widget.validator!(value);
          });
        },
      ),
    );
  }
}
