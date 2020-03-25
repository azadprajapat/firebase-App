
import 'package:firebaseapp/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebaseapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebaseapp/screens/user_list.dart';
import 'package:firebaseapp/models/brew.dart';
class Home extends StatelessWidget {
  final AuthService _Auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().users,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Users'),
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _Auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Log out')),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.settings),
                label: Text('Setting')),

          ],
        ),
        body: UserList(),
      ),
    );
  }
}
