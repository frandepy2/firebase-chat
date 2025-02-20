


import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/common/datatype.dart';
import 'package:firebase_chat/core/common/error_model.dart';
import 'package:firebase_chat/core/firebase/auth_service.dart';
import 'package:firebase_chat/features/auth/data/datasourses/auth_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDatasource)
class AuthDatasourceIml  implements AuthDatasource{
  @override
  Future<DT<User>> login() async {
    AuthService authService = AuthService();

    try {
      User? user = await authService.signInWithGoogle();
      return Right(user!);
    }catch (e) {
      return Left(ErrorModel(code:'AUTH-001',message: 'Login Failed', timestamp: DateTime.now()));
    }
  }
}