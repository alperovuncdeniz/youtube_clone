import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;
  AuthService({
    required this.auth,
    required this.googleSignIn,
  });

  signInWithGoogle() async {
    final user = await googleSignIn.signIn();
    final googleAuth = await user!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await auth.signInWithCredential(credential);
  }
}
