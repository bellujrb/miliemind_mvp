import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final double? defaultPaddingAll;
  final BorderRadiusEnum borderRadiusEnum;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final bool readOnly;
  final Function()? onTap;
  final Function(String)? onChanged;
  final int? maxLines;
  final FocusNode? fieldFocus;
  final FocusNode? nextFocus;
  final Color? backgroundColor;
  final Color? borderColor;

  const TextFieldCustom({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.sufixIcon,
    this.readOnly = false,
    this.textStyle,
    this.onChanged,
    this.labelStyle,
    this.borderRadiusEnum = BorderRadiusEnum.all,
    required this.labelText,
    this.validator,
    this.keyboardType,
    this.autofillHints,
    this.inputFormatters,
    this.controller,
    this.maxLines,
    this.onTap,
    this.fieldFocus,
    this.nextFocus,
    this.defaultPaddingAll,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPaddingAll ?? 8.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: _getBorderRadius(borderRadiusEnum),
        border: Border.all(
          color: borderColor ?? Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          if (prefixIcon != null) prefixIcon!,
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: validator,
              readOnly: readOnly,
              maxLines: maxLines,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: inputFormatters,
              autofillHints: autofillHints,
              keyboardType: keyboardType,
              cursorColor: Colors.lightBlue,
              onTap: onTap,
              focusNode: fieldFocus,
              onFieldSubmitted: (value) {
                fieldFocus?.unfocus();
                if (nextFocus != null) {
                  FocusScope.of(context).requestFocus(nextFocus);
                }
              },
              onChanged: onChanged,
              style: textStyle ?? TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                labelText: labelText,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                hintText: hintText,
                labelStyle: labelStyle ?? TextStyle(color: Colors.grey),
              ),
            ),
          ),
          if (sufixIcon != null) sufixIcon!,
        ],
      ),
    );
  }

  BorderRadius _getBorderRadius(BorderRadiusEnum radiusEnum) {
    switch (radiusEnum) {
      case BorderRadiusEnum.onlyTop:
        return BorderRadius.vertical(top: Radius.circular(8.0));
      case BorderRadiusEnum.onlyBottom:
        return BorderRadius.vertical(bottom: Radius.circular(8.0));
      case BorderRadiusEnum.all:
        return BorderRadius.all(Radius.circular(8.0));
      case BorderRadiusEnum.none:
      default:
        return BorderRadius.zero;
    }
  }
}

enum BorderRadiusEnum { onlyTop, onlyBottom, all, none }
