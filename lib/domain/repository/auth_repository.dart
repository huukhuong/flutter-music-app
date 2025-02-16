import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/create_user_req.dart';
import 'package:spotify_clone/data/models/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq req);
  Future<Either> signin(SigninUserReq req);
}
