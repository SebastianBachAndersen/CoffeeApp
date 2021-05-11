import 'package:flutter/material.dart';

import 'custom_colors.dart';

class StyledTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  final bool isPassword;
  final bool lastField;
  final bool isTextBox;
  final bool readOnly;
  final int maxLines;
  final Function submitHandler;
  final Widget suffixIcon;

  StyledTextField(
    this.title,
    this.controller, {
    this.isPassword = false,
    this.lastField = false,
    this.isTextBox = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.submitHandler,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 175.0,
          ),
          child: TextField(
            style: TextStyle(color: CustomColors.primaryColor),
            readOnly: readOnly,
            cursorColor: CustomColors.primaryColor,
            textAlign: TextAlign.center,
            maxLines: maxLines,
            obscureText: isPassword,
            controller: controller,
            onSubmitted: submitHandler,
            textInputAction: isTextBox
                ? TextInputAction.newline
                : lastField
                    ? TextInputAction.done
                    : TextInputAction.next,
            decoration: InputDecoration(
              fillColor: CustomColors.secondaryColor,
              filled: true,
              hintText: title,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: CustomColors.primaryColor, width: 10.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              suffixIcon: suffixIcon,
            ),
          ),
        ));
  }
}
