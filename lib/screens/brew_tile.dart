import 'package:flutter/material.dart';
import 'package:firebaseapp/models/brew.dart';

class BrewTile extends StatelessWidget {
  @override
  final Brew brew;

  BrewTile({this.brew});

  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[200],
          ),
          title: Text(brew.name),
          subtitle: Text(' ${brew.contact} '),
          trailing: Text('Age ${brew.age}'),
        ),
      )
      ,);
  }
}
