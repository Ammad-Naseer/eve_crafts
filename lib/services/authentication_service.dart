import 'package:firebase_auth/firebase_auth.dart';
import 'package:eve_crafts/utils/toast.dart';

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
