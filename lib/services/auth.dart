

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/models/user.dart';
import 'package:firebaseapp/services/database.dart';
class AuthService {
  final FirebaseAuth _Auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  User _userfromfirebaseuser(FirebaseUser user) {
    return user != null ? User(user.uid) : null;
  }

  Stream<User> get user {
    return _Auth.onAuthStateChanged.map((FirebaseUser user) =>
        _userfromfirebaseuser(user));
  }

  Future signInAnom() async {
    try {
      AuthResult result = await _Auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInEmail(String email,String password) async {
    try {
      AuthResult result = await _Auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future RegisterWithEmail(String email,String password) async {
    try {
      AuthResult result = await _Auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).UpdateUserData('azad',9950729403,20);
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future signOut() async{
    try{
      return await _Auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}