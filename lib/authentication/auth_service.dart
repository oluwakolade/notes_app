import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    //interactive sign in proccess
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
//obtainauth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
//create new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
//signin
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
