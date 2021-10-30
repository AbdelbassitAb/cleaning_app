import 'package:cleaning_app/models/user_data.dart';
import 'package:cleaning_app/services/data_base.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  String uid;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Chef _userFromFirebaseUser(User user) {
    return user != null ? Chef(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Chef> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password,
      String firstName, String lastName, String phoneNumber,String adress) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      // create a new document for the user with a uniq uid
      await DataBaseController(uid: user.uid)
          .updateUserData(user.uid, email, firstName, lastName, phoneNumber,adress,);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print('error');
      //print(error.toString());
      return null;
    }
  }


  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      uid = user.uid;


      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
