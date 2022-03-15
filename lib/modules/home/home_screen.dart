import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('notification clicked');
            },
            icon: Icon(
              Icons.notification_important,
            ),
          ),
          IconButton(
            onPressed: () {
              print('clicked');
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 200.0,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0,),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,

            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(image: NetworkImage(
                  'https://celebrity.tn/wp-content/uploads/2021/04/hamaki-1-819x1024.jpg',
                ),
                  width:200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(.7),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),

                  child: Text(
                  'hamaki',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

      ),





    );

  }
}
