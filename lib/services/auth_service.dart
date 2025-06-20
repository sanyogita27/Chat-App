import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Method to handle user registration
  ///Register a new user with email and password

  Future<void> register(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
// Method to handle user login
//
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
// Method to handle user logout

  Future<void> logout() async {
    await _auth.signOut();
  }
  // Check if the user is authenticated
  //
  User? get currentUser => _auth.currentUser;
  

}
