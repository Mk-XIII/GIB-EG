import 'package:GIB_EG/models/player.dart';
import 'package:GIB_EG/utilities/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut(Player player, DatabaseService db) async {
    await db.updateUserData(player, getUserId());
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> singUp({String email, String password, String username, DatabaseService db}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      
      Map<String, dynamic> userData = {
        "Username"  : username,
        "Money"     : 0,
        "Stats"     : [0,0,0],
        "Items"     : new Map<int,int>(),
        "Eggs"      : new Map<int,int>(),
        "Boosters"  : new Map<int,int>(),
      };

      await db.uploadUserInfo(userData, getUserId());
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  String getUserId() => _firebaseAuth.currentUser.uid;
}
