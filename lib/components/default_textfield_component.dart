import 'package:flutter/material.dart';

class DefaultTextfieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final Function function;
  final IconData icon;
  final IconData iconFunction;
  final bool showPreIcon;
  final bool showFunctionIcon;
  final bool sendOnSubmit;

  DefaultTextfieldComponent(
      {@required this.controller,
      @required this.icon,
      this.function,
      this.iconFunction,
      this.showPreIcon = true,
      this.showFunctionIcon = false,
      this.sendOnSubmit = true});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: sendOnSubmit ? function : null,
      decoration: InputDecoration(
        labelText: 'Email',
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
