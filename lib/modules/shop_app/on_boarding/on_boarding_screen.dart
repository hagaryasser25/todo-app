import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://raw.githubusercontent.com/ahmed-m-abdelfatah/flutter-course-abdullah-mansour/main/05_shop_app/assets/images/onboard_1.jpg'),
          SizedBox(
            height: 30.0,
          ),
          Text(
              'Screen Title',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Screen Body',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}
