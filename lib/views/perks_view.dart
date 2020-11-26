import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/column_animation_component.dart';
import 'package:loyalty/components/row_perk_component.dart';
import 'package:loyalty/controllers/perk_controller.dart';
import 'package:loyalty/shared/SessionVariables.dart';

class PerkView extends StatefulWidget {
  final dynamic company;

  PerkView({this.company});
  @override
  _PerkViewState createState() => _PerkViewState();
}

class _PerkViewState extends State<PerkView> {
  PerkController _controller = PerkController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Promos'),
          centerTitle: true,
          actions: SessionVariables.user['role'] == 'company'
              ? [
                  IconButton(
                    icon: Icon(LineIcons.plus),
                    onPressed: () => Navigator.pushNamed(context, '/add_perk'),
                  )
                ]
              : [],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Observer(
            builder: (_) => ColumnAnimationComponent(
              widgets: List<dynamic>.from(_controller.perks['data']['data'])
                  .map((perk) => RowPerkComponent(
                        perk: perk,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getPerks(
        widget.company == null
            ? SessionVariables.user['_id']
            : widget.company['_id'],
        context);
  }
}
