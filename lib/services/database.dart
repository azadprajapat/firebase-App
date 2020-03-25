import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/models/brew.dart';
import 'package:firebaseapp/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      Firestore.instance.collection('users');

  Future UpdateUserData(String name, int contact, int age) async {
    return await brewCollection.document(uid).setData({
      'name': name,
      'age': age,
      'contact': contact,
    });
  }

  List<Brew> _BrewList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        age: doc.data['age'] ?? 0,
        contact: doc.data['contact'] ?? 0,
      );
    }).toList();
  }
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        age: snapshot.data['age'],
        contact: snapshot.data['contact']
    );
  }


  Stream<List<Brew>> get users {
    return brewCollection.snapshots().map(_BrewList);
  }

  Stream<UserData> get userData{
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);

  }

}
