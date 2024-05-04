// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:firebase_auth/firebase_auth.dart';
import 'package:eve_crafts/utils/toast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

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
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        Utils().toastMessage('Google sign-in cancelled');
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      Utils().toastMessage('Google sign-in successful');

      return userCredential.user;
    } catch (error) {
      Utils().toastMessage('Error signing in with Google');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      User? user = getCurrentUser();

      if (user != null) {
        bool isGoogleSignIn =
            user.providerData.any((info) => info.providerId == 'google.com');

        if (isGoogleSignIn) {
          googleSignIn.signOut;
        } else {
          await _auth.signOut();
        }
      }
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
