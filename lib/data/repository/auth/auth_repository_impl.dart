import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/create_user_req.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq req) async {
    return await sl<AuthFirebaseService>().signup(req);
  }
}
