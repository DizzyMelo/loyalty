import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/shared/style.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeGeneratorView extends StatelessWidget {
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
          title: Text('QrCode'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // static id
              PrettyQr(
                size: 200,
                data: 'asdfan4o23i4g5o5o23ih45',
                roundEdges: false,
                //errorCorrectLevel: QrErrorCorrectLevel.M,
                typeNumber: 4,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Customer must scan this code to validate the transaction',
                style: Style.largeText,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
