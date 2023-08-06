import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginDataSource {
  Future<UserCredential> googleLogin() async {
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    final googleAuth = await user?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential response =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return response;
  }
}
