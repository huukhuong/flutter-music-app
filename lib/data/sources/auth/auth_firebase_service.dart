import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq req);
  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() async {}

  @override
  Future<Either> signup(CreateUserReq req) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: req.email,
        password: req.password,
      );
      return const Right("Signup successfully");
    } on FirebaseAuthException catch (e) {
      log("$e");
      return Left(e.message);
    }
  }
}
