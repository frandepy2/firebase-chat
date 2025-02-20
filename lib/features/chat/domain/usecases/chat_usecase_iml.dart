import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/common/datatype.dart';
import 'package:firebase_chat/core/common/error_model.dart';
import 'package:firebase_chat/features/chat/domain/usecases/chat_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChatUsecase)
class ChatUsecaseIml implements ChatUsecase {
  @override
  Future<DT<bool>> sendMessage(
      {required String message, required String chatId}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Left(ErrorModel(
          message: "User not Authenticated",
          code: "AUTH-002",
          timestamp: DateTime.now()));
    }

    try {
      await FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add({
        'text': message,
        'senderId': user.uid,
        'timestamp': FieldValue.serverTimestamp(),
        'username': user.displayName,
        'profileImageUrl': user.photoURL,
      });

      return Right(true);
    } catch (e) {
      return Left(ErrorModel(
          message: "Failed to send message",
          code: "SEND-001",
          timestamp: DateTime.now()));
    }
  }
}
