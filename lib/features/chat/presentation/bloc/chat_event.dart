part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage({required String text, required String chatId}) = _SendMessage;
}