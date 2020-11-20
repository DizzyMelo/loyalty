import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/default_textfield_component.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/controllers/perk_controller.dart';

class AddPerkView extends StatefulWidget {
  @override
  _AddPerkViewState createState() => _AddPerkViewState();
}

class _AddPerkViewState extends State<AddPerkView> {
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
          title: Text('New Perk'),
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
                        title: 'Add',
                        function: () {
                          Map<String, dynamic> data = {
                            "title": ctrTitle.text,
                            "description": ctrDescription.text,
                            // static id
                            "company": "5f9330cf1daf88096801b5c4",
                            "rounds": ctrRounds.text
                          };

                          _controller.generatePerk(data, context);
                        },
                        loading: _controller.loading))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
