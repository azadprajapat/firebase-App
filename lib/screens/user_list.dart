import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:firebaseapp/models/brew.dart';
import 'package:firebaseapp/screens/brew_tile.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<Brew>>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        return BrewTile(brew: users[index]);
      },
      itemCount: users.length,
    );
  }
}
