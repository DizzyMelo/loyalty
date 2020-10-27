import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/column_animation_component.dart';
import 'package:loyalty/components/row_company_component.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(LineIcons.close),
          ),
          title: Text('Daniel'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qr_code_scanner');
              },
              icon: Icon(Icons.qr_code_rounded),
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ColumnAnimationComponent(widgets: [
              RowCompanyComponent(),
              RowCompanyComponent(),
              RowCompanyComponent(),
              RowCompanyComponent()
            ])),
      ),
    );
  }
}
