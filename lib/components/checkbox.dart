import 'package:flutter/material.dart';

class StyledCheckBox extends StatelessWidget {
  final bool value;
  final Function callback;
  final String text;
  final double fontSize;

  StyledCheckBox({
    @required this.value,
    this.callback,
    this.text,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
        contentPadding: EdgeInsets.all(0),
        child: CheckboxListTile(
          title: Text(
            text,
            style: TextStyle(fontSize: fontSize),
          ),
          value: value,
          onChanged: (checked) {
            callback(checked);
          },
          controlAffinity: ListTileControlAffinity.leading,
        ));
  }
}
