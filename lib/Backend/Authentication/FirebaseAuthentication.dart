import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthResult {
  dynamic error;
  bool isLogin;
  FirebaseAuthResult({this.error, this.isLogin = false});
}

class FirebaseAuthentication {
  Future<FirebaseAuthResult> emailLogin(String email, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      if (userCredential.user != null) {
        return FirebaseAuthResult(isLogin: true);
      }
      return FirebaseAuthResult(error: "error desconocido");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('The password provided is too weak.');
        return FirebaseAuthResult(error: "user not found");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return FirebaseAuthResult(error: "wrong password");
      }
    } catch (e) {
      print(e);
      return FirebaseAuthResult(error: e);
    }
    return FirebaseAuthResult(error: "error desconocido");
  }
}
