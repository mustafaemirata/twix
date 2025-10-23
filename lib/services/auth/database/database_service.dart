import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter/models/user.dart';

class DatabaseService {
  // db instance

  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //profil

  // kullanıcı bilgisi kayıt

  Future<void> seveUserInfoFirebase({required String name, required String email}) async {
    //curerent uid
    String uid = _auth.currentUser!.uid;

    //name'den email bilgisie-ne ulaşma
    String username = email.split('@')[0];

    //profil oluştur
    UserProfile user = UserProfile(
      uid: uid,
      name: name,
      email: email,
      username: username,
      bio: '',
    );

    //dönüşüm yap
    final userMap = user.toMap();

    //dbye kayıt
    await _db.collection("Users").doc(uid).set(userMap);
  }

  //user info çekme
  Future<UserProfile?> getUserFromFirebase(String uid) async {
    try {
      DocumentSnapshot userDoc = await _db.collection("Users").doc(uid).get();

      //convert
      return UserProfile.fromDocument(userDoc);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
