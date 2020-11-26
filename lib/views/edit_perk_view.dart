import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/default_textfield_component.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/controllers/perk_controller.dart';
import 'package:loyalty/shared/SessionVariables.dart';

class EditPerkView extends StatefulWidget {
  final dynamic perk;

  EditPerkView({@required this.perk});
  @override
  _EditPerkViewState createState() => _EditPerkViewState();
}

class _EditPerkViewState extends State<EditPerkView> {
  PerkController _controller = PerkController();

  TextEditingController ctrTitle = TextEditingController();
  TextEditingController ctrDescription = TextEditingController();
  TextEditingController ctrRounds = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Edit Promo'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                DefaultTextfieldComponent(
                  controller: ctrTitle,
                  icon: LineIcons.tag,
                  label: 'Title',
                ),
                DefaultTextfieldComponent(
                  controller: ctrDescription,
                  icon: LineIcons.tag,
                  label: 'Description',
                ),
                DefaultTextfieldComponent(
                  controller: ctrRounds,
                  icon: LineIcons.sort_numeric_asc,
                  label: 'Times',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                Observer(
                    builder: (_) => MainButtonComponent(
                        title: 'Edit',
                        function: () {
                          Map<String, dynamic> data = {
                            "title": ctrTitle.text,
                            "description": ctrDescription.text,
                            "company": SessionVariables.user['_id'],
                            "rounds": ctrRounds.text
                          };

                          _controller.editPerk(
                              data, widget.perk['_id'], context);
                        },
                        loading: _controller.loading))
              ],
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
    ctrTitle.text = widget.perk['title'];
    ctrDescription.text = widget.perk['description'];
    ctrRounds.text = widget.perk['rounds'].toString();
  }
}
