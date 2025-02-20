part of 'chat_bloc.dart';


@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    String? errorMessage,
    required ChatStatus status,
  }) = _ChatState;

  factory ChatState.initial() => const _ChatState(
    status: ChatStatus.initial,
  );
}


enum ChatStatus {
  initial,
  loading,
  connected,
  disconnected,
  loadingMessages,
  messagesLoaded,
  messageSending,
  error,
}