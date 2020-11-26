import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class TransactionConfirmationView extends StatefulWidget {
  final dynamic transaction;

  TransactionConfirmationView({@required this.transaction});
  @override
  _TransactionConfirmationViewState createState() =>
      _TransactionConfirmationViewState();
}

class _TransactionConfirmationViewState
    extends State<TransactionConfirmationView> with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: Tween(begin: 0.2, end: 1.0).animate(
                  CurvedAnimation(
                      parent: _controller, curve: Curves.elasticInOut),
                ),
                child: Icon(
                  LineIcons.check_circle,
                  color: Colors.white,
                  size: 55,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: PrettyQr(
                  size: 140,
                  data: widget.transaction['_id'],
                  roundEdges: true,
                  //errorCorrectLevel: QrErrorCorrectLevel.M,
                  elementColor: Colors.white,
                  typeNumber: 4,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'User scan the qr code to validate the transaction',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/tabs', (route) => false);
          },
          child: Icon(Icons.arrow_forward_ios, color: Colors.teal),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }
}
