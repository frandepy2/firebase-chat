import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class SessionHelper {
  User? _user;

  void saveUser(User userData) {
    _user = userData;
  }

  User? getUser() {
    return _user;
  }

  void clearSession(){
    _user = null;
  }
}