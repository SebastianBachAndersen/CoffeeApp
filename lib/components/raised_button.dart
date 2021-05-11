import 'package:flutter/material.dart';

class StyledRaisedButton extends StatelessWidget {
  final BuildContext context;

  final Function callback;
  final String text;
  final Icon icon;
  final double width;
  final double padding;
  final EdgeInsets margin;
  final bool loading;
  final Color color;

  StyledRaisedButton(
    this.context, {
    this.callback,
    this.text,
    this.icon,
    this.width = double.infinity,
    this.padding = 8,
    this.margin,
    this.loading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets selectedMargin =
        margin == null ? EdgeInsets.symmetric(vertical: 8) : margin;

    double selectedPadding = padding;

    Widget buttonContent;
    if (loading) {
      // Spinner takes up more space, so the padding should be decreased if possible
      selectedPadding = padding - 2 > 0 ? padding - 2 : padding;

      buttonContent = SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 3,
        ),
      );
    } else if (icon == null) {
      buttonContent = Text(text);
    } else {
      buttonContent = icon;
    }

    return Container(
      margin: selectedMargin,
      child: SizedBox(
          width: width,
          child: RaisedButton(
            onPressed: () {
              callback();
            },
            color: color ?? Theme.of(context).primaryColor,
            textColor: Colors.white,
            padding: EdgeInsets.all(selectedPadding),
            child: buttonContent,
          )),
    );
  }
}
