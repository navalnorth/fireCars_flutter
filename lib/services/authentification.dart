import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Connexion avec google
  Future<UserCredential> signInWithGoogle() async {
    // Déclencher le flux d'authentification
    final googleUser = await _googleSignIn.signIn();

    // Obtenir les detail d'autorisations de la demande
    final googleAuth = await googleUser!.authentication;

    // créer un nouvel identifiant
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    // Une fois connecte, renvoyer l'identifiant del'utilisateur
    return await _auth.signInWithCredential(credential);
  }

  // L'etat de l'utilisateur en temps réel
  Stream<User?> get user => _auth.authStateChanges();

  //deconnexion
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}