import 'package:firebase_auth/firebase_auth.dart';
import 'package:pre_mart/global/common/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try{
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      var error = e.toString();
      // i want to check inside the error string there is a word 'email' or not
      if (error.contains('formatted')) {
        showToast(message: 'Please enter a valid email address');
      } else if (error.contains('password')) {
        showToast(message: 'Please enter a valid password');
      } else {
        showToast(message: error.split(']')[1]);
      }
    }
    return null;
  }

  Future<UserCredential?> createUser(String email, String password) async {
    try{
    final user =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return user;
    } on FirebaseAuthException catch (e) {
      var error = e.toString();
      // i want to check inside the error string there is a word 'email' or not
      if (error.contains('formatted')) {
        showToast(message: 'Please enter a valid email address');
      } else if (error.contains('password')) {
        showToast(message: 'Please enter a valid password');
      } else {
        showToast(message: error.split(']')[1]);
      }
    }
    return null;
  }
  
}