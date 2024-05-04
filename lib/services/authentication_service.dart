import 'package:firebase_auth/firebase_auth.dart';
import 'package:eve_crafts/utils/toast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Utils().toastMessage('Login successful');
      return userCredential.user;
    } catch (error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'user-not-found') {
          Utils().toastMessage('User not found');
        } else if (error.code == 'wrong-password') {
          Utils().toastMessage('Wrong password');
        }
      }
      return null;
    }
  }

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'email-already-in-use') {
          Utils().toastMessage('Email is already in use');
        } else if (error.code == 'weak-password') {
          Utils().toastMessage('Password is too weak');
        }
      }
      return null;
    }
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      // Create a new instance of the GoogleSignIn class
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Prompt the user to select a Google account
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      // Retrieve the authentication credentials
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;

      // Create a new instance of the AuthCredential class using the Google authentication credentials
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase using the AuthCredential
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Display a success message
      Utils().toastMessage('Google sign-in successful');

      return userCredential.user;
    } catch (error) {
      // Handle any errors that occur during the sign-in process
      Utils().toastMessage('Error signing in with Google');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      Utils().toastMessage('Error signing out');
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Check if user is signed in
  bool isUserSignedIn() {
    return _auth.currentUser != null;
  }
}
