import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:spotify_clone/data/models/create_user_req.dart';
import 'package:spotify_clone/data/models/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq req);
  Future<Either> signin(SigninUserReq req);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq req) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: req.email,
        password: req.password,
      );
      return const Right("Signin successfully");
    } on FirebaseAuthException catch (e) {
      log("$e");
      return Left(e.message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq req) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: req.email,
        password: req.password,
      );

      FirebaseDatabase.instance.ref('users/${data.user!.uid}').set({
        "email": req.email,
        "fullName": req.fullName,
      });

      return const Right("Signup successfully");
    } on FirebaseAuthException catch (e) {
      log("$e");
      return Left(e.message);
    }
  }
}
