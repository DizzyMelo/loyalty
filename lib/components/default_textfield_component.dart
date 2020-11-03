import 'package:flutter/material.dart';

class DefaultTextfieldComponent extends StatelessWidget {
  TextEditingController controller;
  IconData icon;

  DefaultTextfieldComponent({@required this.controller, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(icon)),
    );
  }
}
