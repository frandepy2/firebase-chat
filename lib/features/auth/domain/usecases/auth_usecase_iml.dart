
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/common/datatype.dart';
import 'package:firebase_chat/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_chat/features/auth/domain/usecases/auth_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthUsecase)
class AuthUsecaseIml implements AuthUsecase {
  final AuthRepository repository;
  AuthUsecaseIml({
    required this.repository,
  });

  @override
  Future<DT<User>> login() async {
    return await repository.login();
  }

}