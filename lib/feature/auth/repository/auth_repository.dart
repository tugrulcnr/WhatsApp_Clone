// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_clone/common/models/user_model.dart';
import 'package:whatsapp_clone/common/repository/firebase_storage_repository.dart';
import '../../../common/routes/routes.dart';

final authRepositoryProvider = Provider(
  (ref) {
    return AuthRepository(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    );
  },
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  Future<void> saveUserInfoToFirestore({
    required String username,
    required var profileImage,
    required ProviderRef ref,
    required BuildContext context,
    required bool mounted,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String profileImageUrl = '';
      if (profileImage != null) {
        profileImageUrl = await ref
            .read(firebaseStorageRepositoryProvider)
            .storeFileToFirebase('profileImage/$uid', profileImage);
      }
      UserModel user = UserModel(
        username: username,
        uid: uid,
        profileImageUrl: profileImageUrl,
        active: true,
        phoneNumber: auth.currentUser!.phoneNumber!,
        groupId: [],
      );

      await firestore.collection('users').doc(uid).set(user.toMap());

      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
      
    } catch (e) {
      showCustomAlertDialog(context: context, message: e.toString());
    }
  }

  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: smsCodeId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      if (!mounted) return;
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.userInfo,
        (route) => false,
      );
    } on FirebaseAuth catch (e) {
      showCustomAlertDialog(
        context: context,
        message: e.toString(),
      );
    }
  }

  Future<void> sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          showCustomAlertDialog(context: context, message: e.toString());
        },
        codeSent: (smsCodeId, resendSmsCodeId) async {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.verification, (route) => false,
              arguments: {
                'phoneNumber': phoneNumber,
                'smsCodeId': smsCodeId,
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showCustomAlertDialog(context: context, message: e.toString());
    }
  }
}
