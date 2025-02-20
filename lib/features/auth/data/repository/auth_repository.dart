

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/common/datatype.dart';
import 'package:firebase_chat/features/auth/data/datasourses/auth_datasource.dart';
import 'package:firebase_chat/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryIml implements AuthRepository {
  final AuthDatasource datasource;
  
  AuthRepositoryIml({
    required this.datasource,
  });

  @override
  Future<DT<User>> login() async {
    return await datasource.login();
  }
}