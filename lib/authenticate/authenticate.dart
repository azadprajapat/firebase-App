import 'package:firebaseapp/authenticate/register.dart';
import 'package:firebaseapp/screens/sign_in.dart';
import 'package:flutter/material.dart';
class authenticate extends StatefulWidget {
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  bool showSign=true;
  @override
  Widget build(BuildContext context) {

    void toggleView(){
      setState(()=>
        showSign=!showSign
      );
    }
    if(showSign){
      return SignIn(toggleView:toggleView);
    }
    else{
      return Register(toggleView: toggleView);
    }
  }
}

