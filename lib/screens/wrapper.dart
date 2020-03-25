import 'package:firebaseapp/models/user.dart';
import 'package:firebaseapp/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebaseapp/authenticate/authenticate.dart';
import 'package:provider/provider.dart';


class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user==null){
      return authenticate();
    }
    else{
      return Home();
    }
  }
}
