// ignore_for_file: unused_local_variable, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

class AuthControllerController extends GetxController {
  String kodeverifikasi = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> StreamAuthStatus() => auth.authStateChanges();

  login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: "Warning", middleText: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  logout() async {
    Get.defaultDialog(
        title: "Maneh yakin ingin keluar",
        middleText: "dari aplikasi ini ?",
        confirm: ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.SPLASH_SCREEN);
            },
            child: Text("Yakin")),
        cancel: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: merah),
          onPressed: () => Get.back(),
          child: Text("No"),
        ));
  }

  register(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      if (credential.user?.sendEmailVerification() != null) {
        Get.offAllNamed(Routes.VERIFICATION);
      } else {
        Get.defaultDialog(
            title: "Maneh yakin ingin keluar",
            middleText: "dari aplikasi ini ?",
            confirm: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAllNamed(Routes.SPLASH_SCREEN);
                },
                child: Text("Yakin")),
            cancel: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: merah),
              onPressed: () => Get.back(),
              child: Text("No"),
            ));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: "error", middleText: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            title: "error", middleText: "No user found for that email.");
      }
    }
  }

  resetPassword(String email) async {
    try {
      final credential = await auth.sendPasswordResetEmail(email: email);

      Get.toNamed(Routes.VERIFICATION);
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: "Alert", middleText: "Gagal reset pass");
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the
    Get.offAllNamed(Routes.HOME);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  verifyPhone(String nomor) async {
    await auth.verifyPhoneNumber(
        phoneNumber: "+62${nomor}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            if (value.user != null) {
              Get.toNamed(Routes.HOME);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.defaultDialog(
              title: "error", middleText: "Gagal mengirim pesan verivikasi");
        },
        codeSent: (String verificationId, int? resendToken) {
          kodeverifikasi = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          kodeverifikasi = verificationId;
        },
        timeout: Duration(seconds: 60));
    Get.toNamed(Routes.OTP_VERIVICATION, parameters: {"phone": nomor});
  }

  checkOtp(String sms) async {
    try {
      await auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: kodeverifikasi, smsCode: sms))
          .then((value) {
        if (value.user != null) {
          Get.toNamed(Routes.HOME);
        }
      });
    } catch (e) {
      Get.defaultDialog(title: "error", middleText: "kode verifikasi salah");
    }
  }
}
