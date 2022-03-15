import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/models/user/user_model.dart';


class UserScreen  extends StatelessWidget {

  List<UserModel> users = [
    UserModel(
      id:1,
      name: 'Hagar Yasser',
      phoneNumber: '+201148318229',
    ),
    UserModel(
      id:2,
      name: 'Salma Hesham',
      phoneNumber: '+201151446780',
    ),
    UserModel(
      id:3,
      name: 'Nouran Mohamed',
      phoneNumber: '+201092938914',
    ),
    UserModel(
      id:1,
      name: 'Hagar Yasser',
      phoneNumber: '+201148318229',
    ),
    UserModel(
      id:2,
      name: 'Salma Hesham',
      phoneNumber: '+201151446780',
    ),
    UserModel(
      id:3,
      name: 'Nouran Mohamed',
      phoneNumber: '+201092938914',
    ),
    UserModel(
      id:1,
      name: 'Hagar Yasser',
      phoneNumber: '+201148318229',
    ),
    UserModel(
      id:2,
      name: 'Salma Hesham',
      phoneNumber: '+201151446780',
    ),
    UserModel(
      id:3,
      name: 'Nouran Mohamed',
      phoneNumber: '+201092938914',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index) => buildUserItem(users[index]),
          separatorBuilder: (context,index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,),
    );
  }

  Widget buildUserItem(UserModel user) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${user.phoneNumber}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
