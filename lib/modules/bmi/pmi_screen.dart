import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/modules/bmi_result/bmi_result_screen.dart';
class PmiScreen extends StatefulWidget {

  @override
  _PmiScreenState createState() => _PmiScreenState();
}

class _PmiScreenState extends State<PmiScreen> {

bool isMale = true;
double height = 120.0;
int weight = 40;
int age = 20;

  Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'BMI Calculator',

            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;

                        });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 70.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 7.0,
                            ),

                            Text(
                              'MALE',
                              style: TextStyle(
                                color: Colors.grey,
                              ),

                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale? Colors.red[500]: hexToColor('#3B444444'),



                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 70.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 7.0,
                            ),

                            Text(
                              'FEMALE',
                              style: TextStyle(
                                color: Colors.grey,
                              ),

                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: !isMale? Colors.red[500] :hexToColor('#3B444444'),


                        ),
                      ),
                    ),
                  ),
  ],
              ),
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                  'HEIGHT',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: Text(
                            'cm',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),

                      ],
                    ),
                    Slider(
                        value: height,
                        max: 220.0,
                        min: 80.0,
                        inactiveColor: Colors.grey,
                        activeColor: Colors.white,
                        thumbColor: Colors.red,
                        onChanged: (value){
                          setState(() {
                            height = value;
                          });
                        },),

                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: hexToColor('#3B444444'),
                ),
              ),
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: hexToColor('#3B444444'),
                      ),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '${weight}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  elevation: 0.0,
                                  onPressed: (){
                                    setState(() {
                                      weight -- ;
                                    });
                                  },
                                  mini: true,
                                  backgroundColor: Colors.grey[800],
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  elevation: 0.0,
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true,
                                  backgroundColor: Colors.grey[800],
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),

                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: hexToColor('#3B444444'),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                elevation: 0.0,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                backgroundColor: Colors.grey[800],
                                child: Icon(
                                  Icons.remove,
                                ),
                              ),
                              FloatingActionButton(
                                elevation: 0.0,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                backgroundColor: Colors.grey[800],
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
              bottom: 30.0,
            ),
            child: Container(
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                   bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  ),
                   color: Colors.red,
                ),

              child: MaterialButton(
                  onPressed: (){
                    double result = weight / pow(height/ 100, 2);
                    print(result.round());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BmiResultScreen(
                              isMale: isMale,
                              result: result.round(),
                              age: age,
                            ),
                        ),
                    );
                  },
                height: 50.0,

                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                  ),
            ),
          ),
          

        ],
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
