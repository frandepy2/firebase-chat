import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/common/datatype.dart';

abstract class AuthDatasource {
  Future<DT<User>> login();
}
