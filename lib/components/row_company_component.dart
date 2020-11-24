import 'package:flutter/material.dart';
import 'package:loyalty/shared/style.dart';
//import 'package:percent_indicator/linear_percent_indicator.dart';

class RowCompanyComponent extends StatelessWidget {
  final dynamic resume;

  RowCompanyComponent({@required this.resume});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/rewards', arguments: resume['_id']);
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Material(
          borderRadius: BorderRadius.circular(5),
          elevation: 10,
          shadowColor: Style.themeColor,
          child: Container(
            padding: EdgeInsets.all(10),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                CircleAvatar(),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resume['_id']['name'],
                      style: Style.largeText,
                    ),

                    // LinearPercentIndicator(
                    //   animation: true,
                    //   animationDuration: 500,
                    //   padding: EdgeInsets.all(0),
                    //   width: 200,
                    //   lineHeight: 5.0,
                    //   percent: 0.5,
                    //   backgroundColor: Colors.grey[300],
                    //   progressColor: Style.themeColor,
                    //   linearStrokeCap: LinearStrokeCap.butt,
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${resume['total']} purchases',
                      style: Style.smallText,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
