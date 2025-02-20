

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/common/datatype.dart';

abstract class AuthRepository {
  Future<DT<User>> login();
}