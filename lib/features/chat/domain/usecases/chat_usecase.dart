

import 'package:firebase_chat/core/common/datatype.dart';

abstract class ChatUsecase {
  Future<DT<bool>> sendMessage({required String message, required String chatId});
}