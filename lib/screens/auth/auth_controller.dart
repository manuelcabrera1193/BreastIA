import 'dart:io';

import 'package:breast_ia/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class AuthController extends GetxController {
  var state = StateAuth(
          userCredential: null, loadingLogin: false, loadingLoginGoogle: false)
      .obs;

  Future<String> login(String email, String password) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user != null) {
        Get.offAllNamed(HomeScreen.routerName);
      }
      state(state.value.copy(userCredential: user));
      return "";
    } catch (e) {
      return "$e";
    }
  }

  Future<String> loginGoogle() async {
    try {
      if (!Platform.isAndroid) {
        var googleProvider = GoogleAuthProvider();
        UserCredential user =
            await FirebaseAuth.instance.signInWithPopup(googleProvider);
        if (user.user != null) {
          Get.offAllNamed(HomeScreen.routerName);
        }
        state(state.value.copy(userCredential: user));
      } else {
        final googleSignIn = GoogleSignIn(scopes: ['email']);
        final account = await googleSignIn.signIn();
        final authentication = await account?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: authentication?.accessToken,
          idToken: authentication?.idToken,
        );

        final user =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (user.user != null) {
          Get.offAllNamed(HomeScreen.routerName);
        }
        state(state.value.copy(userCredential: user));
      }
      return "";
    } catch (e) {
      print("$e");
      return "$e";
    }
  }
}

class StateAuth {
  UserCredential? userCredential;
  bool loadingLogin;
  bool loadingLoginGoogle;

  StateAuth(
      {required this.userCredential,
      required this.loadingLogin,
      required this.loadingLoginGoogle});

  StateAuth copy({
    UserCredential? userCredential,
    bool? loadingLogin,
    bool? loadingLoginGoogle,
  }) {
    return StateAuth(
      userCredential: userCredential ?? this.userCredential,
      loadingLogin: loadingLogin ?? this.loadingLogin,
      loadingLoginGoogle: loadingLoginGoogle ?? this.loadingLoginGoogle,
    );
  }
}
