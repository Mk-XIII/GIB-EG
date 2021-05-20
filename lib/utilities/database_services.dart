import 'package:GIB_EG/models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore;

  DatabaseService(this._firestore);

  FirebaseFirestore getInstance(){
    return this._firestore;
  }

  Future uploadUserInfo(userdata, userID) async {
    _firestore.collection("users")
    .doc(userID)
    .set(userdata);
  }

  Future<dynamic> getUserData(String userID) async {
    return _firestore.collection("users").doc(userID).get();
  } 

  Future<dynamic> getItemData() async {
    return _firestore.collection("data").doc("Items").get();
  }

  Future updateUserData(Player player, String uid) async {
    _firestore.collection("users")
    .doc(uid)
    .update({
        "Money": player.getMoney(),
        "Stats": player.getStatsDb(),
        "Items": player.getItemsDb()
      }
    );
  }  
  // Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() async{
  //   return await _firestore.collection("users");
  // }
}