import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //yetki al ->instance

  final _auth = FirebaseAuth.instance;

  //mevcut kullanıcı bilgilerini al
  User? getCurrentUser() => _auth.currentUser;
  String getCurrentUid() => _auth.currentUser!.uid;

  //email şifre girim
  Future<UserCredential> loginEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //email şifre kayıt
  Future<UserCredential> registerEmailPassword(
    String email,
    String password,
  ) async {
    //yeni kullanıcı
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //çıkış
  Future<void> logout() async {
    await _auth.signOut();
  }
}
