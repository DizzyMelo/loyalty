import 'package:flutter/material.dart';

class DefaultTextfieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final Function function;
  final IconData icon;
  final IconData iconFunction;
  final bool showPreIcon;
  final bool showFunctionIcon;
  final bool sendOnSubmit;
  final String label;
  final TextInputType inputType;

  DefaultTextfieldComponent(
      {@required this.controller,
      @required this.icon,
      this.function,
      this.iconFunction,
      this.showPreIcon = true,
      this.showFunctionIcon = false,
      this.sendOnSubmit = true,
      this.label = '',
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      onSubmitted: sendOnSubmit ? function : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: showPreIcon ? Icon(icon) : null,
        suffixIcon: showFunctionIcon && iconFunction != null
            ? IconButton(
                onPressed: function,
                icon: Icon(iconFunction),
              )
            : null,
      ),
    );
  }
}
