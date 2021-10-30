
import 'package:cleaning_app/models/transaction.dart';
import 'package:cleaning_app/models/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class DataBaseController extends GetxController {

  final String uid;

  DataBaseController({this.uid});

  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('Users');
  final CollectionReference transactionsCollection =
  FirebaseFirestore.instance.collection('Transactions');


  Future<void> updateUserData(String uid, String email, String firstName,
      String lastName, String phoneNumber, String adress) async {
    return await usersCollection.doc(uid).set({
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'adress': adress,
    });
  }



  Future<void> updateUserTransaction(
      String uid,
      String name,
      String description,
      String time,
      double argent,
      double somme,
      bool deleted,
      String type,
      String chantier) async {
    await transactionsCollection
        .doc('All transactions')
        .collection('Transactions')
        .doc(uid)
        .set({
      'uid': uid,
      'name': name,
      'description': description,
      'time': time,
      'argent': argent,
      'somme': somme,
      'type': type,
      'chantier': chantier,

      'deleted': deleted,
    });
  }




  UserData _chefFromSnapshot(DocumentSnapshot snapshot) {
    return UserData.fromMap(snapshot.data());
  }




  List<TR> _transactionsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return TR.fromMap(doc.data());
    }).toList();
  }



  Stream<UserData> get chefData {
    return usersCollection.doc(uid).snapshots().map(_chefFromSnapshot);
  }










  Future<void> deleteTransaction(String id) {
    return transactionsCollection
        .doc('All transactions')
        .collection('Transactions')
        .doc(id)
        .delete();
  }
}

