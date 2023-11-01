import 'package:design/auth/auth_exceptions.dart';
import 'package:design/screens/authentication/login.dart';
import 'package:design/utility/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/screen_navigator.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const ScreenNavigator());
  }

  Future<User?> createUserWithNameEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (firebaseUser.value != null) {
        Get.offAll(() => const ScreenNavigator());
      }
      return firebaseUser.value;
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      showSnackkBar(
        message: ex.message,
        title: 'Try Again',
        icon: const Icon(Icons.error),
      );
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure();
      showSnackkBar(
        message: ex.message,
        title: 'Try Again',
        icon: const Icon(Icons.error),
      );
      // print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithNameEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.put(firebaseUser);
      firebaseUser.value != null
          ? Get.offAll(() => const ScreenNavigator())
          : Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      // print("Erroe code " + e.code);
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      showSnackkBar(
        message: ex.message,
        title: 'Try Again',
        icon: const Icon(Icons.error),
      );
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure();
      showSnackkBar(
        message: ex.message,
        title: 'Try Again',
        icon: const Icon(Icons.error),
      );
      // print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> resetPassword(email) async {
    await _auth.sendPasswordResetEmail(email: email);
    Get.offAll(() => const LoginScreen());
    showSnackkBar(
      message: 'Password Reset Mail Send SuccessFully',
      title: 'Check Your Mail',
      icon: const Icon(Icons.done),
    );
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
